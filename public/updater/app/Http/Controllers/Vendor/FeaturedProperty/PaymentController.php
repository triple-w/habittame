<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\AuthorizeController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\FlutterWaveController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\InstamojoController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\MercadopagoController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\MollieController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\PaypalController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\PaystackController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\PaytmController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\RazorpayController;
use App\Http\Controllers\Vendor\FeaturedProperty\Payment\StripeController;
use App\Http\Helpers\MegaMailer;
use App\Http\Helpers\UploadFile;
use App\Models\BasicSettings\Basic;
use App\Models\FeaturedPricing;
use App\Models\PaymentGateway\OfflineGateway;
use App\Models\Property\Content;
use App\Models\Property\FeaturedProperty;
use App\Models\Vendor;
use Auth;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function makePayment(Request $request)
    {

        $request->validate([
            'featured_pricing_id' => 'required',
            'gateway' => 'required',
        ], [
            'featured_pricing_id.required' => 'The Pricing field is required',
            'gateway.required' => 'The payment method field is required',
        ]);
        $currencyInfo = Basic::select('base_currency_symbol', 'base_currency_symbol_position', 'base_currency_text', 'base_currency_text_position', 'base_currency_rate')->first();
 
        $featuredPricing = FeaturedPricing::findOrFail($request->featured_pricing_id);
        $request['amount'] = $featuredPricing->price;
        $request['number_of_days'] = $featuredPricing->number_of_days;
        $amount = $featuredPricing->price;
        $bs = Basic::first();
        $title = 'Featured Payment';
        $email = Auth::guard('vendor')->user()->email;
        if (!$request->exists('gateway')) {
            return redirect()->back()->with('error', 'Choose a payment method')->withInput();
        } elseif ($request['gateway'] == 'paypal') {
            if ($currencyInfo->base_currency_text !== 'USD') {
                $rate = floatval($currencyInfo->base_currency_rate);
                $amount = round(($amount / $rate), 2);
            }
            $paypal = new PaypalController();

            $successUrl = route('vendor.featured.paypal.notify');
            $cancleUrl = route('vendor.featured.paypal.cancle');
            return $paypal->paymentProcess($request, $amount, $title, $successUrl, $cancleUrl);
        } elseif ($request['gateway'] == 'instamojo') {
            // checking whether the currency is set to 'INR' or not
            if ($currencyInfo->base_currency_text !== 'INR') {
                return redirect()->back()->with('warning', 'Invalid currency for instamojo payment.')->withInput();
            }

            $successUrl = route('vendor.featured.instamojo.notify');
            $cancleUrl = route('vendor.featured.instamojo.cancle');
            $paypal = new InstamojoController();
            return $paypal->paymentProcess($request, $amount,  $successUrl, $cancleUrl, $title);
        } else if ($request['gateway'] == 'paystack') {
            if ($currencyInfo->base_currency_text !== 'NGN') {
                return redirect()->back()->with('warning', 'Invalid currency for instamojo payment.')->withInput();
            }
            $successUrl = route('vendor.featured.paystack.notify');
            $cancleUrl = route('vendor.featured.paystack.cancle');
            $paystack = new PaystackController();
            return $paystack->paymentProcess($request, $amount,  $email, $successUrl, $cancleUrl);
        } else if ($request['gateway'] == 'flutterwave') {

            $allowedCurrencies = array('BIF', 'CAD', 'CDF', 'CVE', 'EUR', 'GBP', 'GHS', 'GMD', 'GNF', 'KES', 'LRD', 'MWK', 'MZN', 'NGN', 'RWF', 'SLL', 'STD', 'TZS', 'UGX', 'USD', 'XAF', 'XOF', 'ZMK', 'ZMW', 'ZWD');

            // checking whether the base currency is allowed or not
            if (!in_array($currencyInfo->base_currency_text, $allowedCurrencies)) {
                return redirect()->back()->with('warning', 'Invalid currency for flutterwave payment.')->withInput();
            }

            $successUrl = route('vendor.featured.flutterwave.notify');
            $cancleUrl = route('vendor.featured.flutterwave.cancle');

            $flutterwave = new FlutterWaveController;
            $itemNumber = uniqid();
            return $flutterwave->paymentProcess($request, $amount,  $email, $itemNumber, $successUrl, $cancleUrl, $currencyInfo);
        } else if ($request['gateway'] == 'razorpay') {

            // checking whether the currency is set to 'INR' or not
            if ($currencyInfo->base_currency_text !== 'INR') {
                return redirect()->back()->with('warning', 'Invalid currency for razorpay payment.')->withInput();
            }


            $bs = Basic::first();
            $itemNumber = uniqid();
            $successUrl = route('vendor.featured.razorpay.notify');
            $cancleUrl = route('vendor.featured.razorpay.cancle');
            $razorpay = new RazorpayController();
            return $razorpay->paymentProcess($request, $amount,   $itemNumber, $successUrl, $cancleUrl, $title, $title, $bs);
        } else if ($request['gateway'] == 'mercadopago') {

            $allowedCurrencies = array('ARS', 'BOB', 'BRL', 'CLF', 'CLP', 'COP', 'CRC', 'CUC', 'CUP', 'DOP', 'EUR', 'GTQ', 'HNL', 'MXN', 'NIO', 'PAB', 'PEN', 'PYG', 'USD', 'UYU', 'VEF', 'VES');

            // checking whether the base currency is allowed or not
            if (!in_array($currencyInfo->base_currency_text, $allowedCurrencies)) {
                return redirect()->back()->with('warning', 'Invalid currency for mercadopago payment.');
            }
            $mercadopago = new MercadopagoController();
            $successUrl = route('vendor.featured.razorpay.notify');
            $cancleUrl = route('vendor.featured.mercadopago.cancle');
            return $mercadopago->paymentProcess($request, $amount,    $successUrl, $cancleUrl, $email, $title, '');
        } else if ($request['gateway'] == 'mollie') {
            $successUrl = route('vendor.featured.mollie.notify');
            $cancleUrl = route('vendor.featured.mollie.cancle');
            $mollie = new MollieController();
            return $mollie->paymentProcess($request, $amount,    $successUrl, $cancleUrl,  $title, $currencyInfo);
        } else if ($request['gateway'] == 'paytm') {


            // checking whether the currency is set to 'INR' or not
            if ($currencyInfo->base_currency_text !== 'INR') {
                return redirect()->back()->with('warning', 'Invalid currency for paytm payment.')->withInput();
            }
            $successUrl = route('vendor.featured.paytm.notify');
            $itemNumber = uniqid();
            $paytm = new PaytmController();
            return $paytm->paymentProcess($request, $amount, $itemNumber,    $successUrl,);
        } else if ($request['gateway'] == 'stripe') {
            // changing the currency before redirect to Stripe
            if ($currencyInfo->base_currency_text !== 'USD') {
                $rate = floatval($currencyInfo->base_currency_rate);
                $amount = round(($amount / $rate), 2);
            }
            $stripe = new StripeController();
            $cancleUrl = route('vendor.dashboard');
            return $stripe->paymentProcess($request, $amount, $title,  $cancleUrl);
        } else if ($request['gateway'] == 'authorize.net') {
            $cancleUrl = route('vendor.dashboard');
            $authorizeNet = new AuthorizeController();
            return $authorizeNet->paymentProcess($request, $amount, $cancleUrl);
        } else {
            $gateway = OfflineGateway::find($request->gateway);

            if ($gateway->has_attachment == 1) {
                $request->validate([
                    'attachment' => 'required'
                ]);
            }
            $request['payment_status'] = "pending";
            if ($request->hasFile('attachment')) {
                $filename = UploadFile::store(public_path('assets/front/img/feature/attachment'),  $request->attachment);

                $request['attachmen'] = $filename;
            }
           
            $amount = $request->price;
            $transaction_id = \App\Http\Helpers\VendorPermissionHelper::uniqidReal(8);
            $transaction_details = "offline";
            $request['payment_method'] = "offline";
            $request['gateway_type'] = $gateway->name;
            $request['amount'] = $featuredPricing->price;

            $this->store($request, $transaction_id, json_encode($transaction_details),);
            $this->mailToAdminForFeaturedRequest($request);

            return view('vendors.property.offline-success');
        }
    }

    public function store($request, $transaction_id, $transaction_details)
    {

        FeaturedProperty::create([
            'featured_pricing_id' => $request['featured_pricing_id'],
            'property_id' => $request['property_id'],
            'vendor_id' => Auth::guard('vendor')->user()->id,
            'number_of_days' => $request['number_of_days'],
            'amount' => $request['amount'],
            'transaction_id' => $transaction_id,
            'transaction_details' => $transaction_details,
            'payment_method' => $request['payment_method'] ?? 'online',
            'gateway_type' => $request['gateway_type'],
            'payment_status' => $request['payment_status'] ?? 'complete',
            'status' => 0,
            'attachment' => $request['attachmen'] ?? null,
        ]);

        return;
    }

    public function onlineSuccess()
    {
        return view('vendors.success');
    }

    public function mailToAdminForFeaturedRequest($requestData)
    {
        $mailer = new MegaMailer();
        $bs = Basic::first();
        $vendor = Auth::guard('vendor')->user();
        $popertyContent = Content::where('property_id', $requestData['property_id'])->select('title')->first();
        $amount = $requestData['amount'];
        $days = $requestData['number_of_days'];
        $gateway = $requestData['gateway_type'];
        $data = [
            'subject' => "Request for featured property",
            'body' => "A vendor has paid for featured property and requested you to featured their property.<br><br>

                    <strong>Property Title:</strong>  $popertyContent->title<br>
                    <strong>Vendor Usename:</strong> $vendor->username<br>
                    <strong>Paid Amount:</strong> $amount  $bs->base_currency_text<br>
                    <strong>Number Of days:</strong> $days<br>
                    <strong>Payment Method:</strong>  $gateway 
                    <br><br>
                Best Regards,<br> $bs->website_title ",
        ];

        $mailer->mailToAdmin($data);
    }
}
