<?php

namespace App\Http\Controllers\Payment;

use Session;
use Carbon\Carbon;
use App\Models\Vendor;
use App\Models\Package;
use App\Models\Membership;
use Illuminate\Http\Request;
use App\Http\Helpers\MegaMailer;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use App\Http\Helpers\VendorPermissionHelper;
use App\Http\Controllers\Vendor\VendorCheckoutController;

class NowpaymentController extends Controller
{
    public $base_url;
    public $api_key;
    public $public_key;

    public function __construct()
    {
        $this->base_url = env('NOWPAYMENT_URL');
        $this->api_key = env('NOWPAYMENT_API_KEY');
        $this->public_key = env('NOWPAYMENT_PUBLIC_KEY');
    }

    public function paymentProcess(Request $request, $amount, $success_url, $cancel_url, $title, $bex)
    {
        $order_id = VendorPermissionHelper::uniqidReal(8);
        $requestData = $request->except('_token');
        $requestData['title'] = $title;
        $requestData['order_id'] = $order_id;
        $requestData['status'] = 0;
        $requestData['nowpayment_request_data'] = json_encode($requestData);

        $response = Http::withHeaders([
            'x-api-key' => $this->api_key,
            'Content-Type' => 'application/json',
        ])->post($this->base_url . '/invoice', [
            'price_amount' => $amount,
            'price_currency' => 'USD',
            'order_id' => $order_id,
            'order_description' => $title,
            'ipn_callback_url' => null,
            'success_url' => $success_url,
            'cancel_url' => $cancel_url,
        ]);

        $invoice = $response->json();

        if ($response->successful() && isset($invoice['invoice_url'])) {
            $checkout = new VendorCheckoutController();
            $bs = $bex;
            $transaction_details = '';
            $transaction_id = $invoice['id'];
            $requestData['nowpayment_invoice_id'] = $invoice['id'];
            $checkout->store($requestData, $transaction_id, $transaction_details);
            return redirect($invoice['invoice_url']);
        } else {
            Session::flash('warning', 'Failed to create invoice.');
            return back();
        }
    }

    public function currentPaymentActivity($paymentId)
    {
        $response = Http::withHeaders([
            'x-api-key' => env('NOWPAYMENT_API_KEY'),
        ])->get('https://api.nowpayments.io/v1/payment/' . $paymentId);
        return $response->json();
    }

    public function paymentSuccess(Request $request)
    {
        $information = [];
        $responseData = $this->currentPaymentActivity($request['NP_id']);
        if (is_array($responseData) && array_key_exists('invoice_id', $responseData)) {
            $invoice_id = $responseData['invoice_id'];
            $payment_id = $responseData['payment_id'];

            $membership = Membership::where('nowpayment_invoice_id', $invoice_id)->first();
            if (!$membership) {
                \Log::error('Membership not found for invoice: ' . $invoice_id);
                abort(404);
            }

            $membership->transaction_id = $payment_id;
            $membership->save();

            $bs = Basic::first();
            $package = Package::find($membership->package_id);

            $vendor = Vendor::find($membership->vendor_id);

            if (!$bs || !$package || !$vendor) {
                \Log::error('Missing essential data for email sending.', compact('bs', 'package', 'vendor'));
                abort(404);
            }

            $activation = Carbon::parse($membership->start_date);
            $expire = Carbon::parse($membership->expire_date);
            $file_name = $this->makeInvoice($request, 'membership', $vendor, $membership->price, 'NOWPayments', $vendor->phone, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $membership->transaction_id, $package->title, $membership);
            $mailer = new MegaMailer();
            $data = [
                'toMail' => $vendor->email,
                'toName' => $vendor->fname,
                'username' => $vendor->username,
                'package_title' => $package->title,
                'package_price' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $package->price . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                'discount' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $membership->discount . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                'total' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $membership->price . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                'activation_date' => $activation->toFormattedDateString(),
                'expire_date' => Carbon::parse($expire->toFormattedDateString())->format('Y') == '9999' ? 'Lifetime' : $expire->toFormattedDateString(),
                'membership_invoice' => $file_name,
                'website_title' => $bs->website_title,
                'templateType' => 'package_purchase',
                'type' => 'packagePurchase',
            ];
            $mailer->mailFromAdmin($data);
            return redirect()->route('success.page');
        }
        return redirect()->route('nowpayment.payment.cancel');
    }

    public function paymentCancel()
    {
        $requestData = Session::get('request');
        $paymentFor = Session::get('paymentFor');
        session()->flash('warning', __('cancel_payment'));
        if ($paymentFor == 'membership') {
            return redirect()
                ->route('front.register.view', ['status' => $requestData['package_type'], 'id' => $requestData['package_id']])
                ->withInput($requestData);
        } else {
            return redirect()
                ->route('vendor.plan.extend.checkout', ['package_id' => $requestData['package_id']])
                ->withInput($requestData);
        }
    }
}
