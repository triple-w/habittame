<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty\Payment;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Vendor\FeaturedProperty\PaymentController; 
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\BasicSettings\Basic;
use PHPMailer\PHPMailer\Exception;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use App\Models\PaymentGateway\OnlineGateway; 
use App\Models\VendorInfo;
use Config;
use Session;

class StripeController extends Controller
{
    public function __construct()
    {
        //Set Spripe Keys
        $stripe = OnlineGateway::where('keyword', 'stripe')->first();
        $stripeConf = json_decode($stripe->information, true);
        Config::set('services.stripe.key', $stripeConf["key"]);
        Config::set('services.stripe.secret', $stripeConf["secret"]);
    }

    public function paymentProcess(Request $request, $_amount, $_title, $_cancel_url)
    {

        $title = $_title;
        $price = $_amount;
        $price = round($price, 2);
        $cancel_url = $_cancel_url;

        Session::put('request', $request->all());

        $stripe = Stripe::make(Config::get('services.stripe.secret'));
        try {

            $token = $request->stripeToken;

            if (!isset($token)) {
                return back()->with('warning', 'Token Problem With Your Token.');
            }
            $vendorInfo = VendorInfo::where('vendor_id', $request->vendor_id)->first();

            $charge = $stripe->charges()->create([
                'source' => $token,
                'currency' =>  "USD",
                'amount' => $price,
                'description' => $title,
                'receipt_email' => $request->email,
                'metadata' => [
                    'customer_name' => $vendorInfo != null ? $vendorInfo->name : '',
                ]
            ]);


            if ($charge['status'] == 'succeeded') {

                $transaction_id = VendorPermissionHelper::uniqidReal(8);
                $transaction_details = json_encode($charge);
                $requestData = Session::get('request');
                $bs = Basic::first();


                $requestData['gateway_type'] = 'stripe';

                $checkout = new PaymentController();

                $checkout->store($requestData, $transaction_id, $transaction_details);
                $checkout->mailToAdminForFeaturedRequest($requestData);
               
                session()->flash('success', 'Your payment has been completed.');

                return redirect()->route('vendor.property_management.featured_payment_success');
            }
        } catch (Exception $e) {
            return redirect($cancel_url)->with('error', $e->getMessage());
        } catch (\Cartalyst\Stripe\Exception\CardErrorException $e) {
            return redirect($cancel_url)->with('error', $e->getMessage());
        } catch (\Cartalyst\Stripe\Exception\MissingParameterException $e) {
            return redirect($cancel_url)->with('error', $e->getMessage());
        }
        return redirect($cancel_url)->with('warning', 'Please Enter Valid Credit Card Informations.');
    }

    public function cancelPayment()
    {
        $requestData = Session::get('request');
        $paymentFor = Session::get('paymentFor');
        session()->flash('error', 'Payment has been canceled');
        if ($paymentFor == "membership") {
            return redirect()->route('front.register.view', ['status' => $requestData['package_type'], 'id' => $requestData['package_id']])->withInput($requestData);
        } else {
            return redirect()->route('vendor.plan.extend.checkout', ['package_id' => $requestData['package_id']])->withInput($requestData);
        }
    }
}
