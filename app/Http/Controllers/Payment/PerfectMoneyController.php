<?php

namespace App\Http\Controllers\Payment;

use Carbon\Carbon;
use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Helpers\MegaMailer;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\PaymentGateway\OnlineGateway;
use App\Http\Controllers\Vendor\VendorCheckoutController;

class PerfectMoneyController extends Controller
{
    public function paymentProcess(Request $request, $_amount, $_success_url, $_cancel_url, $_title, $bex)
    {
        $info = OnlineGateway::where('keyword', 'perfect_money')->first();
        $information = json_decode($info->information, true);
        
        $cancel_url = $_cancel_url;
        $notify_url = $_success_url;
            $val = [];
        $randomNo = substr(uniqid(), 0, 8);
        $websiteInfo = Basic::first();
        $perfect_money = OnlineGateway::where('keyword', 'perfect_money')->first();
        $info = json_decode($perfect_money->information, true);
        $val['PAYEE_ACCOUNT'] = $info['perfect_money_wallet_id'];

        $val['PAYEE_NAME'] = $websiteInfo->website_title;
        $val['PAYMENT_ID'] = "$randomNo"; //random id
        $val['PAYMENT_AMOUNT'] = $_amount;
        // $val['PAYMENT_AMOUNT'] = 0.01; //test amount
        $val['PAYMENT_UNITS'] = "$websiteInfo->base_currency_text";

        $val['STATUS_URL'] = $notify_url;
        $val['PAYMENT_URL'] = $notify_url;
        $val['PAYMENT_URL_METHOD'] = 'GET';
        $val['NOPAYMENT_URL'] = $cancel_url;
        $val['NOPAYMENT_URL_METHOD'] = 'GET';
        $val['SUGGESTED_MEMO'] = Auth::guard('vendor')->user()->email;
        $val['BAGGAGE_FIELDS'] = 'IDENT';
        
        $data['val'] = $val;
        $data['method'] = 'get';
        $data['url'] = 'https://perfectmoney.com/api/step1.asp';

        Session::put('payment_id', $randomNo);
        Session::put('request', $request->all());

        return view('frontend.payment.perfect-money', compact('data'));
    }

    public function successPayment(Request $request)
    {
        $requestData = Session::get('request');
        $bs = Basic::first();
        $cancel_url = Session::get('cancel_url');
        $perfect_money = OnlineGateway::where('keyword', 'perfect_money')->first();
        $perfectMoneyInfo = json_decode($perfect_money->information, true);
        $currencyInfo = Basic::select('base_currency_text')->first();

        $amo = $request['PAYMENT_AMOUNT'];
        $unit = $request['PAYMENT_UNITS'];
        $track = $request['PAYMENT_ID'];
        $id = Session::get('payment_id');
        $final_amount = $requestData['price']; //live amount

        if ($request->PAYEE_ACCOUNT == $perfectMoneyInfo['perfect_money_wallet_id'] && $unit == $currencyInfo->base_currency_text && $track == $id && $amo == round($final_amount, 2)) {
            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($request['payment_request_id']);

            $package = Package::find($requestData['package_id']);
            $amount = $requestData['price'];

            $checkout = new VendorCheckoutController();
            $vendor = $checkout->store($requestData, $transaction_id, $transaction_details);
            $lastMemb = $vendor->memberships()->orderBy('id', 'DESC')->first();

            $activation = Carbon::parse($lastMemb->start_date);
            $expire = Carbon::parse($lastMemb->expire_date);
            $file_name = $this->makeInvoice($requestData, 'membership', $vendor, $amount, 'PerfectMoney', $vendor->phone, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $transaction_id, $package->title, $lastMemb);

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
            Session::forget(['request', 'paymentFor', 'payment_id']);
            return redirect()->route('success.page');
        }
        return redirect($cancel_url);
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
