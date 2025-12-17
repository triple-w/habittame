<?php

namespace App\Http\Controllers\Payment;

use Carbon\Carbon;
use Midtrans\Snap;
use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Helpers\MegaMailer;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Midtrans\Config as MidtransConfig;
use Illuminate\Support\Facades\Session;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\PaymentGateway\OnlineGateway;
use App\Http\Controllers\Vendor\VendorCheckoutController;

class MidtransController extends Controller
{
    public function paymentProcess(Request $request, $_amount, $_success_url, $_cancel_url, $_title, $bex)
    {
        $info = OnlineGateway::where('keyword', 'midtrans')->first();
        $information = json_decode($info->information, true);

        // will come from database
        $client_key = $information['server_key'];
        MidtransConfig::$serverKey = $information['server_key'];
        if ($information['midtrans_mode'] == 1) {
            MidtransConfig::$isProduction = false;
        } elseif ($information['midtrans_mode'] == 0) {
            MidtransConfig::$isProduction = true;
        }
        MidtransConfig::$isSanitized = true;
        MidtransConfig::$is3ds = true;
        $token = uniqid();

        // this session $token also is used in the MidtransBankNotifyController
        Session::put('token', $token);

        $params = [
            'transaction_details' => [
                'order_id' => $token,
                'gross_amount' => (int) round($_amount),
            ],
            'customer_details' => [
                'first_name' => Auth::guard('vendor')->user()->name,
                'email' => Auth::guard('vendor')->user()->email,
                'phone' => Auth::guard('vendor')->user()->phone,
            ],
        ];

        $snapToken = Snap::getSnapToken($params);
        //if generate payment url then put some data into session
        Session::put('request', $request->all());
        Session::put('cancel_url', $_cancel_url);
        Session::put('midtrans_payment_type', 'package_feature');
        $paymentFor = Session::get('paymentFor');

        $is_production = $information['midtrans_mode'] == 1 ? $information['midtrans_mode'] : 0;
        return view('frontend.payment.package-midtrans', compact('snapToken', 'is_production', 'client_key', 'paymentFor'));
    }

    public function cardNotify($order_id)
    {
        $requestData = Session::get('request');
        $bs = Basic::first();

        $cancel_url = Session::get('cancel_url');
        if ($order_id) {
            $paymentFor = Session::get('paymentFor');
            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($order_id);
            $package = Package::find($requestData['package_id']);

            $amount = $requestData['price'];

                $checkout = new VendorCheckoutController();
                $vendor = $checkout->store($requestData, $transaction_id, $transaction_details);
                $lastMemb = $vendor->memberships()->orderBy('id', 'DESC')->first();

                $activation = Carbon::parse($lastMemb->start_date);
                $expire = Carbon::parse($lastMemb->expire_date);
                $file_name = $this->makeInvoice($requestData, 'membership', $vendor, $amount, 'Midtrans', $vendor->phone, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $transaction_id, $package->title, $lastMemb);

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
                Session::forget(['request', 'paymentFor']);
            return redirect()->route('success.page');
        } else {
            return redirect($cancel_url);
        }
    }

    public function OnlineBackNotify($order_id) {}

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
