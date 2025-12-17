<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty\Payment;

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
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;

class PaystackController extends Controller
{
    public function __construct()
    {
    }
    /**
     * Redirect the User to Paystack Payment Page
     * @return
     */
    public function paymentProcess(Request $request, $_amount, $_email, $_success_url, $_cancle_url)
    {
        $data = OnlineGateway::whereKeyword('paystack')->first();
        $paydata = $data->convertAutoData();
        $secret_key = $paydata['key'];
        $cancel_url = $_cancle_url;
        $curl = curl_init();
        $callback_url = $_success_url; // url to go to after payment

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.paystack.co/transaction/initialize",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode([
                'amount' => $_amount,
                'email' => $_email,
                'callback_url' => $callback_url
            ]),
            CURLOPT_HTTPHEADER => [
                "authorization: Bearer " . $secret_key, //replace this with your own test key
                "content-type: application/json",
                "cache-control: no-cache"
            ],
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);
        if ($err) {
            return redirect()->back()->with('error', $err);
        }

        $tranx = json_decode($response, true);
        Session::put('request', $request->all());
        Session::put('cancel_url', $cancel_url);
        if (!$tranx['status']) {
            return redirect()->back()->with("error", $tranx['message']);
        }
        return redirect($tranx['data']['authorization_url']);
    }

    public function notify(Request $request)
    {
        $requestData = Session::get('request');
        $cancel_url = Session::get('cancel_url');
        if (session()->has('lang')) {
            $currentLang = Language::where('code', session()->get('lang'))->first();
        } else {
            $currentLang = Language::where('is_default', 1)->first();
        }
        if ($request['trxref'] === $request['reference']) {

            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($request['trxref']);

            $requestData['gateway_type'] = 'paystack';

            $checkout = new PaymentController();

            $checkout->store($requestData, $transaction_id, $transaction_details);

            $checkout->mailToAdminForFeaturedRequest($requestData);
            session()->flash('success', 'Your payment has been completed.');
            Session::forget('request');
            Session::forget('paymentFor');
            return redirect()->route('vendor.property_management.featured_payment_success');
        } else {
            return redirect($cancel_url);
        }
    }
    public function cancelPayment()
    {
        session()->flash('warning', "Your payment is cancle.");
        return redirect()->route('vendor.property_management.properties');
    }
}
