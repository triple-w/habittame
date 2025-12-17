<?php

namespace App\Http\Controllers\Payment;

use Carbon\Carbon;
use App\Models\Package;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Helpers\MegaMailer;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use App\Http\Helpers\VendorPermissionHelper;
use App\Http\Controllers\Vendor\VendorCheckoutController;

class XenditController extends Controller
{
    public function paymentProcess(Request $request, $_amount, $_success_url, $_cancel_url, $_title, $bex)
    {
        $cancel_url = $_cancel_url;
        $notify_url = $_success_url;

        Session::put('request', $request->all());
        Session::put('cancel_url', $cancel_url);

        $external_id = Str::random(10);
        $secret_key = 'Basic ' . config('xendit.key_auth');
        $data_request = Http::withHeaders([
            'Authorization' => $secret_key,
        ])->post('https://api.xendit.co/v2/invoices', [
            'external_id' => $external_id,
            'amount' => (int) round($_amount),
            'currency' => $bex->base_currency_text,
            'success_redirect_url' => $notify_url,
        ]);

        $response = $data_request->object();
        $response = json_decode(json_encode($response), true);

        if (!empty($response['success_redirect_url'])) {
            Session::put('xendit_id', $response['id']);
            Session::put('secret_key', config('xendit.key_auth'));
            return redirect($response['invoice_url']);
        } else {
            return redirect($cancel_url)->with('error', __('Payment Canceled') . '.');
        }
    }

    public function successPayment(Request $request)
    {
        $requestData = Session::get('request');
        $bs = Basic::first();
        $cancel_url = Session::get('cancel_url');
        /** Get the payment ID before session clear **/

        $xendit_id = Session::get('xendit_id');
        $secret_key = Session::get('secret_key');

        if (!is_null($xendit_id) && $secret_key == config('xendit.key_auth')) {
            $paymentFor = Session::get('paymentFor');

            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($request['payment_request_id']);

            $package = Package::find($requestData['package_id']);
            $amount = $requestData['price'];

            $checkout = new VendorCheckoutController();
            $vendor = $checkout->store($requestData, $transaction_id, $transaction_details);
            $lastMemb = $vendor->memberships()->orderBy('id', 'DESC')->first();

            $activation = Carbon::parse($lastMemb->start_date);
            $expire = Carbon::parse($lastMemb->expire_date);
            $file_name = $this->makeInvoice($requestData, 'membership', $vendor, $amount, 'Xendit', $vendor->phone, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $transaction_id, $package->title, $lastMemb);

            $mailer = new MegaMailer();
            $data = [
                'toMail' => $vendor->email,
                'toName' => $vendor->fname,
                'username' => $vendor->username,
                'package_title' => $package->title,
                'package_price' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $package->price . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                'discount' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $lastMemb->discount . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                'total' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $lastMemb->price . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                'activation_date' => $activation->toFormattedDateString(),
                'expire_date' => Carbon::parse($expire->toFormattedDateString())->format('Y') == '9999' ? 'Lifetime' : $expire->toFormattedDateString(),
                'membership_invoice' => $file_name,
                'website_title' => $bs->website_title,
                'templateType' => 'package_purchase',
                'type' => 'packagePurchase',
            ];
            $mailer->mailFromAdmin($data);
            @unlink(public_path('assets/front/invoices/' . $file_name));
            session()->flash('success', 'Your payment has been completed.');
            Session::forget(['request', 'paymentFor', 'xendit_id', 'secret_key', 'cancel_url']);
            return redirect()->route('success.page');
        }
        return redirect($cancel_url);
    }

    public function cancelPayment()
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
