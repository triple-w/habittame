<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty\Payment;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Vendor\FeaturedProperty\PaymentController;
use App\Http\Controllers\Vendor\VendorCheckoutController;
use App\Http\Helpers\MegaMailer;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\BasicSettings\Basic;
use App\Models\Language;
use App\Models\Package;
use App\Models\PaymentGateway\OnlineGateway;
use App\Models\Property\Content;
use App\Models\Vendor;
use Carbon\Carbon;
use Razorpay\Api\Api;
use Illuminate\Support\Facades\Session;
use Razorpay\Api\Errors\SignatureVerificationError;

class RazorpayController extends Controller
{
    private $keyId, $keySecret, $api;
    public function __construct()
    {
        $data = OnlineGateway::whereKeyword('razorpay')->first();
        $paydata = $data->convertAutoData();
        $this->keyId = $paydata['key'];
        $this->keySecret = $paydata['secret'];
        $this->api = new Api($this->keyId, $this->keySecret);
    }


    public function paymentProcess(Request $request, $_amount, $_item_number,  $_success_url, $_cancel_url, $_title, $_description, $bs)
    {
        $cancel_url = $_cancel_url;
        $notify_url = $_success_url;

        $orderData = [
            'receipt' => $_title,
            'amount' => $_amount * 100,
            'currency' => 'INR',
            'payment_capture' => 1 // auto capture
        ];

        $razorpayOrder = $this->api->order->create($orderData);
        $cancel_url = $_cancel_url;
        Session::put('cancel_url', $cancel_url);
        Session::put('request', $request->all());
        Session::put('order_payment_id', $razorpayOrder['id']);

        $displayAmount = $amount = $_amount;

        $checkout = 'automatic';

        if (isset($_GET['checkout']) and in_array($_GET['checkout'], ['automatic', 'manual'], true)) {
            $checkout = $_GET['checkout'];
        }

        $data = [
            "key" => $this->keyId,
            "amount" => $_amount,
            "name" => $_title,
            "description" => $_description,
            "prefill" => [
                "name" => $request->name,
                "email" => $request->address,
                "contact" => $request->razorpay_phone,
            ],
            "notes" => [
                "address" => $request->razorpay_address,
                "merchant_order_id" => $_item_number,
            ],
            "theme" => [
                "color" => "{{$bs->base_color}}"
            ],
            "order_id" => $razorpayOrder['id'],
        ];

        if ($bs->base_currency_text !== 'INR') {
            $data['display_currency'] = $bs->base_currency_text;
            $data['display_amount'] = $displayAmount;
        }

        $json = json_encode($data);
        $displayCurrency = $bs->base_currency_text;

        return view('front.razorpay', compact('data', 'displayCurrency', 'json', 'notify_url'));
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
       
        /** Get the payment ID before session clear **/
        $payment_id = Session::get('order_payment_id');
        $success = true;
        if (empty($request['razorpay_payment_id']) === false) {

            try {
                $attributes = array(
                    'razorpay_order_id' => $payment_id,
                    'razorpay_payment_id' => $request['razorpay_payment_id'],
                    'razorpay_signature' => $request['razorpay_signature']
                );

                $this->api->utility->verifyPaymentSignature($attributes);
            } catch (SignatureVerificationError $e) {
                $success = false;
            }
        }

        if ($success === true) {

            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($request);

            $requestData['gateway_type'] = 'razorpay';

            $checkout = new PaymentController();

            $checkout->store($requestData, $transaction_id, $transaction_details);

            $checkout->mailToAdminForFeaturedRequest($requestData);

            session()->flash('success', 'Your payment has been completed.');
            Session::forget('request');
            Session::forget('cancel_url');
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
