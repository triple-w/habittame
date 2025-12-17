<?php

namespace App\Http\Controllers\Vendor\FeaturedProperty\Payment;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Vendor\FeaturedProperty\PaymentController;
use App\Http\Helpers\MegaMailer;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\BasicSettings\Basic;
use App\Models\PaymentGateway\OnlineGateway;
use Illuminate\Http\Request;
use Omnipay\Omnipay;
use Session;

class AuthorizeController extends Controller
{
    private $gateway;
    public function __construct()
    {
        $data = OnlineGateway::query()->whereKeyword('authorize.net')->first();
        $authorizeNetData = json_decode($data->information, true);
        $this->gateway = Omnipay::create('AuthorizeNetApi_Api');
        $this->gateway->setAuthName($authorizeNetData['login_id']);
        $this->gateway->setTransactionKey($authorizeNetData['transaction_key']);
        if ($authorizeNetData['sandbox_check'] == 1) {
            $this->gateway->setTestMode(true);
        }
    }
    public function paymentProcess(Request $request, $_amount,  $_cancel_url)
    {
        try {
            $allowedCurrencies = array('USD', 'CAD', 'CHF', 'DKK', 'EUR', 'GBP', 'NOK', 'PLN', 'SEK', 'AUD', 'NZD');
            $currencyInfo = $this->getCurrencyInfo();
            // checking whether the base currency is allowed or not
            if (!in_array($currencyInfo->base_currency_text, $allowedCurrencies)) {
                return redirect()->back()->with('warning', 'Invalid currency for authorize.net payment.')->withInput();
            }
            Session::put('request', $request->all());
            $requestData = $request->all();
            if ($request->filled('opaqueDataValue') && $request->filled('opaqueDataDescriptor')) {
                // generate a unique merchant site transaction ID
                $transactionId = rand(100000000, 999999999);
              
                $response = $this->gateway->authorize([
                    'amount' => sprintf('%0.2f', $_amount),
                    'currency' => $currencyInfo->base_currency_text,
                    'transactionId' => $transactionId,
                    'opaqueDataDescriptor' => $request->opaqueDataDescriptor,
                    'opaqueDataValue' => $request->opaqueDataValue
                ])->send();

                if ($response->isSuccessful()) {
                    $response = json_encode($response, true);


                    $transaction_id = VendorPermissionHelper::uniqidReal(8);
                    $transaction_details = $response;

                    $requestData['gateway_type'] = 'authorize.net';

                    $checkout = new PaymentController();

                    $checkout->store($requestData, $transaction_id, $transaction_details);

                    $checkout->mailToAdminForFeaturedRequest($requestData);
                    session()->flash('success', 'Your payment has been completed.');

                    return redirect()->route('success.page');
                } else {
                    //cancel payment
                    return redirect($_cancel_url);
                }
            } else {
                //return cancel url 
                return redirect($_cancel_url);
            }
        } catch (\Exception $th) {
        }
    }

    public function cancelPayment()
    {
        $requestData = Session::get('request');
        $paymentFor = Session::get('paymentFor');
        session()->flash('warning', 'Your payment has been cancel.');
        if ($paymentFor == "membership") {
            return redirect()->route('front.register.view', ['status' => $requestData['package_type'], 'id' => $requestData['package_id']])->withInput($requestData);
        } else {
            return redirect()->route('vendor.plan.extend.checkout', ['package_id' => $requestData['package_id']])->withInput($requestData);
        }
    }
}
