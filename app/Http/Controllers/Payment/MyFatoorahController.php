<?php

namespace App\Http\Controllers\Payment;

use Carbon\Carbon;
use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Helpers\MegaMailer;
use Basel\MyFatoorah\MyFatoorah;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\PaymentGateway\OnlineGateway;
use App\Http\Controllers\Vendor\VendorCheckoutController;

class MyFatoorahController extends Controller
{
    private $myfatoorah;

    public function __construct()
    {
        $info = OnlineGateway::where('keyword', 'myfatoorah')->first();
        $information = json_decode($info->information, true);
        $this->myfatoorah = MyFatoorah::getInstance($information['sandbox_status'] == 1 ? true : false);
    }

    public function paymentProcess(Request $request, $_amount, $_cancel_url)
    {
        $cancel_url = $_cancel_url;
        /********************************************************
         * send payment request to yoco for create a payment url
         ********************************************************/

        $info = OnlineGateway::where('keyword', 'myfatoorah')->first();
        $information = json_decode($info->information, true);

        $random_1 = rand(999, 9999);
        $random_2 = rand(9999, 99999);
        $result = $this->myfatoorah->sendPayment(Auth::guard('vendor')->user()->username, intval($_amount), [
            'CustomerMobile' => $information['sandbox_status'] == 1 ? '56562123544' : Auth::guard('vendor')->user()->phone,
            'CustomerReference' => "$random_1", //orderID
            'UserDefinedField' => "$random_2", //clientID
            'InvoiceItems' => [
                [
                    'ItemName' => 'Package Purchase or Extends',
                    'Quantity' => 1,
                    'UnitPrice' => intval($_amount),
                ],
            ],
        ]);

        if ($result && $result['IsSuccess'] == true) {
            Session::put('request', $request->all());
            return redirect($result['Data']['InvoiceURL']);
        } else {
            return redirect($cancel_url);
        }
    }

    public function successPayment(Request $request)
    {
        $requestData = Session::get('request');
     
        $bs = Basic::first();
        /** Get the payment ID before session clear **/
        if (!empty($request->paymentId)) {
            $result = $this->myfatoorah->getPaymentStatus('paymentId', $request->paymentId);
            if ($result && $result['IsSuccess'] == true && $result['Data']['InvoiceStatus'] == 'Paid') {
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
                $file_name = $this->makeInvoice($requestData, 'membership', $vendor, $amount, 'Myfatoorah', $vendor->phone, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $transaction_id, $package->title, $lastMemb);

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
                session()->flash('success', __('Your payment has been completed') . '.');

                Session::forget(['request', 'paymentFor']);
                return [
                    'url' => route('success.page'),
                ];
                // return redirect()->route('success.page');
            }
        }
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
