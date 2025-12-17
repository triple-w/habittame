<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty\Payment;

use App\Http\Controllers\Front\CheckoutController;
use App\Http\Controllers\User\UserCheckoutController;
use App\Http\Helpers\UserPermissionHelper;
use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Vendor\FeaturedProperty\PaymentController;
use App\Http\Controllers\Vendor\VendorCheckoutController;
use App\Http\Helpers\Instamojo;
use App\Http\Helpers\MegaMailer;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\BasicSettings\Basic;
use PHPMailer\PHPMailer\Exception;
use App\Models\Language;
use App\Models\Membership;
use App\Models\PaymentGateway\OnlineGateway;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;

class InstamojoController extends Controller
{
    public function paymentProcess(Request $request, $_amount, $_success_url, $_cancel_url, $_title)
    {
        $data = OnlineGateway::whereKeyword('instamojo')->first();
        $paydata = $data->convertAutoData();
        $cancel_url = $_cancel_url;
        $notify_url = $_success_url;

        if ($paydata['sandbox_status'] == 1) {
            $api = new Instamojo($paydata['key'], $paydata['token'], 'https://test.instamojo.com/api/1.1/');
        } else {
            $api = new Instamojo($paydata['key'], $paydata['token']);
        }

        try {

            $response = $api->paymentRequestCreate(array(
                "purpose" => $_title,
                "amount" => $_amount,
                "send_email" => false,
                "email" => null,
                "redirect_url" => $notify_url
            ));

            $redirect_url = $response['longurl'];

            Session::put("request", $request->all());
            Session::put('payment_id', $response['id']);
            Session::put('success_url', $notify_url);
            Session::put('cancel_url', $cancel_url);

            return redirect($redirect_url);
        } catch (Exception $e) {

            return redirect($cancel_url)->with('error', 'Error: ' . $e->getMessage());
        }
    }

    public function notify(Request $request)
    {
        $requestData = Session::get('request');
        if (session()->has('lang')) {
            $currentLang = Language::where('code', session()->get('lang'))->first();
        } else {
            $currentLang = Language::where('is_default', 1)->first();
        }
        $success_url = Session::get('success_url');
        $cancel_url = Session::get('cancel_url');
        /** Get the payment ID before session clear **/
        $payment_id = Session::get('payment_id');

        if ($request['payment_request_id'] == $payment_id) {
            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($request['payment_request_id']);

            $requestData['gateway_type'] = 'instamojo';

            $checkout = new PaymentController();

            $checkout->store($requestData, $transaction_id, $transaction_details);

            $checkout->mailToAdminForFeaturedRequest($requestData);
            session()->flash('success', 'Your payment has been completed.');
            Session::forget('request');
            Session::forget('paymentFor');
            return redirect()->route('vendor.property_management.featured_payment_success');
        }
        return redirect($cancel_url);
    }

    public function cancelPayment()
    {

        session()->flash('warning', "Your payment is cancle.");
        return redirect()->route('vendor.property_management.properties');
    }
}
