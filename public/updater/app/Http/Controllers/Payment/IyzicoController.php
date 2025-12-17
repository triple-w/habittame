<?php

namespace App\Http\Controllers\Payment;

use Config\Iyzipay;
use App\Models\Vendor;
use App\Models\Language;
use App\Models\VendorInfo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\PaymentGateway\OnlineGateway;
use App\Http\Controllers\Vendor\VendorCheckoutController;

class IyzicoController extends Controller
{
    public function paymentProcess(Request $request, $_amount, $_success_url, $_cancel_url, $_title, $bex)
    {
        // get the current locale of this website
        if (Session::has('currentLocaleCode')) {
            $language = Language::query()->where('code', '=', Session::get('currentLocaleCode'))->first();
            if (is_null($language)) {
                $language = Language::query()->where('is_default', '=', 1)->first();
            }
        } else {
            $language = Language::query()->where('is_default', '=', 1)->first();
        }

        $paymentMethod = OnlineGateway::where('keyword', 'iyzico')->first();
        $paydata = json_decode($paymentMethod->information, true);

        $vendor = Vendor::find(Auth::guard('vendor')->user()->id);
        $vendorInfo = VendorInfo::where([['vendor_id', Auth::guard('vendor')->user()->id], ['language_id', $language->id]])->first();

        if (empty($vendorInfo) || empty($vendorInfo->name) || empty($vendorInfo->city) || empty($vendorInfo->country) || empty($vendorInfo->address) || empty($vendorInfo->zip_code)) {
            session()->flash('warning', __('Please Update your profile account for the current language to complete this payment') . '.');
            return back();
        }

        $fname = $vendor->username;
        $lname = $vendorInfo->name;
        $email = $vendor->email;
        $phone = $vendor->phone;
        $city = $vendorInfo->city;
        $country = $vendorInfo->country;
        $address = $vendorInfo->address;
        $zip_code = $vendorInfo->zip_code;
        $id_number = $phone;
        $basket_id = 'B' . uniqid(999, 99999);

        $cancel_url = $_cancel_url;
        $notify_url = $_success_url;

        Session::put('request', $request->all());
        $conversation_id = uniqid(9999, 999999);
        Session::put('conversation_id', $conversation_id);

        $options = Iyzipay::options();
        $options->setApiKey($paydata['api_key']);
        $options->setSecretKey($paydata['secret_key']);
        if ($paydata['iyzico_mode'] == 1) {
            $options->setBaseUrl('https://sandbox-api.iyzipay.com');
        } else {
            $options->setBaseUrl('https://api.iyzipay.com'); // production mode
        }

        # create request class
        $request = new \Iyzipay\Request\CreatePayWithIyzicoInitializeRequest();
        $request->setLocale(\Iyzipay\Model\Locale::EN);
        $request->setConversationId($conversation_id);
        $request->setPrice($_amount);
        $request->setPaidPrice($_amount);
        $request->setCurrency(\Iyzipay\Model\Currency::TL);
        $request->setBasketId($basket_id);
        $request->setPaymentGroup(\Iyzipay\Model\PaymentGroup::PRODUCT);
        $request->setCallbackUrl($notify_url);
        $request->setEnabledInstallments([2, 3, 6, 9]);

        $buyer = new \Iyzipay\Model\Buyer();
        $buyer->setId(uniqid());
        $buyer->setName($fname);
        $buyer->setSurname($lname);
        $buyer->setGsmNumber($phone);
        $buyer->setEmail($email);
        $buyer->setIdentityNumber($id_number);
        $buyer->setLastLoginDate('');
        $buyer->setRegistrationDate('');
        $buyer->setRegistrationAddress($address);
        $buyer->setIp('');
        $buyer->setCity($city);
        $buyer->setCountry($country);
        $buyer->setZipCode($zip_code);
        $request->setBuyer($buyer);

        $shippingAddress = new \Iyzipay\Model\Address();
        $shippingAddress->setContactName($fname);
        $shippingAddress->setCity($city);
        $shippingAddress->setCountry($country);
        $shippingAddress->setAddress($address);
        $shippingAddress->setZipCode($zip_code);
        $request->setShippingAddress($shippingAddress);

        $billingAddress = new \Iyzipay\Model\Address();
        $billingAddress->setContactName($fname);
        $billingAddress->setCity($city);
        $billingAddress->setCountry($country);
        $billingAddress->setAddress($address);
        $billingAddress->setZipCode($zip_code);
        $request->setBillingAddress($billingAddress);

        $q_id = uniqid(999, 99999);
        $basketItems = [];
        $firstBasketItem = new \Iyzipay\Model\BasketItem();
        $firstBasketItem->setId($q_id);
        $firstBasketItem->setName('Purchase Id ' . $q_id);
        $firstBasketItem->setCategory1('Purchase or Extend');
        $firstBasketItem->setCategory2('');
        $firstBasketItem->setItemType(\Iyzipay\Model\BasketItemType::PHYSICAL);
        $firstBasketItem->setPrice($_amount);
        $basketItems[0] = $firstBasketItem;
        $request->setBasketItems($basketItems);

        # make request
        $payWithIyzicoInitialize = \Iyzipay\Model\PayWithIyzicoInitialize::create($request, $options);

        $paymentResponse = (array) $payWithIyzicoInitialize;

        foreach ($paymentResponse as $key => $data) {
            $paymentInfo = json_decode($data, true);
            if ($paymentInfo['status'] == 'success') {
                if (!empty($paymentInfo['payWithIyzicoPageUrl'])) {
                    // Session::put('conversation_id', $conversation_id);
                    Session::put('cancel_url', $cancel_url);
                    return redirect($paymentInfo['payWithIyzicoPageUrl']);
                } else {
                    return redirect($cancel_url)->with('error', __('Payment Canceled') . '.');
                }
            } else {
                return redirect($cancel_url)->with('error', __('Payment Canceled') . '.');
            }
        }
    }

    public function successPayment(Request $request)
    {
        $requestData = Session::get('request');

        $conversation_id = Session::get('conversation_id');

        $transaction_id = VendorPermissionHelper::uniqidReal(8);
        $transaction_details = json_encode($request['payment_request_id']);

        $requestData['status'] = 0;
        $requestData['conversation_id'] = $conversation_id;

        $checkout = new VendorCheckoutController();
        $vendor = $checkout->store($requestData, $transaction_id, $transaction_details);

        session()->flash('success', 'Your payment has been completed.');
        Session::forget(['request', 'paymentFor', 'conversation_id']);
        return redirect()->route('success.page');
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
