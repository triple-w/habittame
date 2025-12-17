<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty\Payment;

use Anand\LaravelPaytmWallet\Facades\PaytmWallet;
use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Vendor\FeaturedProperty\PaymentController;
use App\Http\Controllers\Vendor\VendorCheckoutController;
use App\Http\Helpers\MegaMailer;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\BasicSettings\Basic;
use App\Models\Language;
use App\Models\Membership;
use App\Models\PaymentGateway\OnlineGateway;
use App\Models\Property\Content;
use App\Models\Vendor;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PaytmController extends Controller
{
    public function __construct()
    {

        $data = OnlineGateway::whereKeyword('paytm')->first();
        $paytmData = json_decode($data->information, true);

        config([
            // in case you would like to overwrite values inside config/services.php
            'services.paytm-wallet.env' => $paytmData['environment'],
            'services.paytm-wallet.merchant_id' => $paytmData['merchant_mid'],
            'services.paytm-wallet.merchant_key' => $paytmData['merchant_key'],
            'services.paytm-wallet.merchant_website' => $paytmData['merchant_website'],
            'services.paytm-wallet.industry_type' => $paytmData['industry_type'],
            'services.paytm-wallet.channel' => 'WEB',
        ]);
    }

    public function paymentProcess(Request $request, $_amount, $_item_number, $_callback_url)
    {

        $notifyURL = $_callback_url;

        $payment = PaytmWallet::with('receive');

        $payment->prepare([
            'order' => time(),
            'user' => uniqid(),
            'mobile_number' => Auth::guard('vendor')->user()->phone,
            'email' => Auth::guard('vendor')->user()->email,
            'amount' => $_amount,
            'callback_url' => $notifyURL
        ]);

        Session::put("request", $request->all());
        return $payment->receive();
    }


    public function notify(Request $request)
    {
        $requestData = Session::get('request');

        $transaction = PaytmWallet::with('receive');
        $transaction_id = VendorPermissionHelper::uniqidReal(8);
        $transaction_details = json_encode($request);
        if ($transaction->isSuccessful()) {
            $requestData['gateway_type'] = 'paytom';

            $checkout = new PaymentController();

            $checkout->store($requestData, $transaction_id, $transaction_details);
            $checkout->mailToAdminForFeaturedRequest($requestData);
            session()->flash('success', 'Your payment has been completed.');
            Session::forget('request');

            Session::forget('cancel_url');
            return redirect()->route('vendor.property_management.featured_payment_success');
        } else {
            return redirect()->route('vendor.property_management.properties')->with('warning', 'Your payment is cancled.');
        }
    }
}
