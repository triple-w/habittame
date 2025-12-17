<?php

namespace App\Http\Controllers\Vendor;

use Carbon\Carbon;
use App\Models\Vendor;
use App\Models\Package;
use App\Models\Language;
use App\Models\Membership;
use Illuminate\Http\Request;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;
use App\Http\Helpers\VendorPermissionHelper;
use App\Http\Requests\Checkout\ExtendRequest;
use App\Models\PaymentGateway\OfflineGateway;
use App\Http\Controllers\Payment\YocoController;
use App\Http\Controllers\Payment\PaytmController;
use App\Http\Controllers\Payment\IyzicoController;
use App\Http\Controllers\Payment\MollieController;
use App\Http\Controllers\Payment\PaypalController;
use App\Http\Controllers\Payment\StripeController;
use App\Http\Controllers\Payment\XenditController;
use App\Http\Controllers\Payment\PaytabsController;
use App\Http\Controllers\Payment\PhonePeController;
use App\Http\Controllers\Payment\MidtransController;
use App\Http\Controllers\Payment\PaystackController;
use App\Http\Controllers\Payment\RazorpayController;
use App\Http\Controllers\Payment\AuthorizeController;
use App\Http\Controllers\Payment\InstamojoController;
use App\Http\Controllers\Payment\ToyyibpayController;
use App\Http\Controllers\Payment\MyFatoorahController;
use App\Http\Controllers\Payment\NowpaymentController;
use App\Http\Controllers\Payment\FlutterWaveController;
use App\Http\Controllers\Payment\MercadopagoController;
use App\Http\Controllers\Payment\PerfectMoneyController;

class VendorCheckoutController extends Controller
{
    public function checkout(ExtendRequest $request)
    {
        // dd($request->payment_method);
        try {
            $offline_payment_gateways = OfflineGateway::all()->pluck('name')->toArray();
            $currentLang = session()->has('lang') ? Language::where('code', session()->get('lang'))->first() : Language::where('is_default', 1)->first();
            $bs = Basic::first();
            $request['status'] = '1';
            $request['receipt_name'] = null;
            $request['email'] = auth()->user()->email;
            Session::put('paymentFor', 'extend');
            $title = 'You are purchasing a package';
            $description = 'Congratulation you are going to join our membership.Please make a payment for confirming your membership now!';
            if ($request->price == 0) {
                $request['price'] = 0.0;
                $request['payment_method'] = '-';
                $transaction_details = 'Free';
                $password = uniqid('qrcode');
                $package = Package::find($request['package_id']);
                $transaction_id = VendorPermissionHelper::uniqidReal(8);
                $vendor = $this->store($request->all(), $transaction_id, $transaction_details, $request['price'], $bs, $password);
                $subject = 'You made your membership purchase successful';
                $body = 'You made a payment. This is a confirmation mail from us. Please see the invoice attachment below';

                $lastMemb = $vendor->memberships()->orderBy('id', 'DESC')->first();

                $file_name = $this->makeInvoice($request->all(), 'extend', $vendor, $password, $request['price'], $request['payment_method'], $vendor->phone_number, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $transaction_id, $package->title, $lastMemb);
                $this->sendMailWithPhpMailer($request->all(), $file_name, $bs, $subject, $body, $vendor->email, $vendor->first_name . ' ' . $vendor->last_name);
                Session::forget('request');
                Session::forget('paymentFor');
                return redirect()->route('success.page');
            } elseif ($request->payment_method == 'PayPal') {
                if ($bs->base_currency_text !== 'USD') {
                    $rate = floatval($bs->base_currency_rate);
                    $amount = round($request->price / $rate, 2);
                } else {
                    $amount = $request->price;
                }

                $paypal = new PaypalController();
                $cancel_url = route('membership.paypal.cancel');
                $success_url = route('membership.paypal.success');
                return $paypal->paymentProcess($request, $amount, $title, $success_url, $cancel_url);
            } elseif ($request->payment_method == 'Stripe') {
                if ($bs->base_currency_text !== 'USD') {
                    $rate = floatval($bs->base_currency_rate);
                    $amount = round($request->price / $rate, 2);
                } else {
                    $amount = $request->price;
                }
                $stripe = new StripeController();
                $cancel_url = route('membership.stripe.cancel');
                return $stripe->paymentProcess($request, $amount, $title, null, $cancel_url);
            } elseif ($request->payment_method == 'Paytm') {
                if ($bs->base_currency_text != 'INR') {
                    session()->flash('warning', 'Only INR is supported currency for Paystack');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $item_number = uniqid('paytm-') . time();
                $callback_url = route('membership.paytm.status');
                $paytm = new PaytmController();
                return $paytm->paymentProcess($request, $amount, $item_number, $callback_url);
            } elseif ($request->payment_method == 'Paystack') {
                if ($bs->base_currency_text != 'NGN') {
                    session()->flash('warning', 'Only NGN is supported currency for Paystack');
                    return back()->withInput($request->all());
                }
                $amount = $request->price * 100;
                $email = $request->email;
                $success_url = route('membership.paystack.success');
                $payStack = new PaystackController();
                return $payStack->paymentProcess($request, $amount, $email, $success_url, $bs);
            } elseif ($request->payment_method == 'Razorpay') {
                if ($bs->base_currency_text != 'INR') {
                    session()->flash('warning', $bs->base_currency_text . ' is not allowed for Razorpay');
                    return back()->with($request->all());
                }
                $amount = $request->price;
                $item_number = uniqid('razorpay-') . time();
                $cancel_url = route('membership.razorpay.cancel');
                $success_url = route('membership.razorpay.success');
                $razorpay = new RazorpayController();
                return $razorpay->paymentProcess($request, $amount, $item_number, $cancel_url, $success_url, $title, $description, $bs);
            } elseif ($request->payment_method == 'Instamojo') {
                if ($bs->base_currency_text != 'INR') {
                    session()->flash('warning', $bs->base_currency_text . ' is not allowed for Instamojo');
                    return back()->withInput($request->all());
                }
                if ($request->price < 9) {
                    return redirect()->back()->with('error', 'Minimum 10 INR required for this payment gateway')->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.instamojo.success');
                $cancel_url = route('membership.instamojo.cancel');
                $instaMojo = new InstamojoController();
                return $instaMojo->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'MercadoPago') {
                if ($bs->base_currency_text != 'BRL') {
                    session()->flash('warning', $bs->base_currency_text . ' is not allowed for MercadoPago');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $email = $request->email;
                $success_url = route('membership.mercadopago.success');
                $cancel_url = route('membership.mercadopago.cancel');
                $mercadopagoPayment = new MercadopagoController();
                return $mercadopagoPayment->paymentProcess($request, $amount, $success_url, $cancel_url, $email, $title, $description, $bs);
            } elseif ($request->payment_method == 'Flutterwave') {
                $available_currency = ['BIF', 'CAD', 'CDF', 'CVE', 'EUR', 'GBP', 'GHS', 'GMD', 'GNF', 'KES', 'LRD', 'MWK', 'NGN', 'RWF', 'SLL', 'STD', 'TZS', 'UGX', 'USD', 'XAF', 'XOF', 'ZMK', 'ZMW', 'ZWD'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' is not allowed for Flutterwave.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $email = $request->email;
                $item_number = uniqid('flutterwave-') . time();
                $cancel_url = route('membership.flutterwave.cancel');
                $success_url = route('membership.flutterwave.success');
                $flutterWave = new FlutterWaveController();
                return $flutterWave->paymentProcess($request, $amount, $email, $item_number, $success_url, $cancel_url, $bs);
            } elseif ($request->payment_method == 'Authorize.net') {
                $available_currency = ['USD', 'CAD', 'CHF', 'DKK', 'EUR', 'GBP', 'NOK', 'PLN', 'SEK', 'AUD', 'NZD'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' is not allowed for Mollie');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.mollie.success');
                $cancel_url = route('membership.anet.cancel');
                $authorizePayment = new AuthorizeController();
                return $authorizePayment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'Mollie') {
                $available_currency = ['AED', 'AUD', 'BGN', 'BRL', 'CAD', 'CHF', 'CZK', 'DKK', 'EUR', 'GBP', 'HKD', 'HRK', 'HUF', 'ILS', 'ISK', 'JPY', 'MXN', 'MYR', 'NOK', 'NZD', 'PHP', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'THB', 'TWD', 'USD', 'ZAR'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' is not allowed for Mollie');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.mollie.success');
                $cancel_url = route('membership.mollie.cancel');
                $molliePayment = new MollieController();
                return $molliePayment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'Midtrans') {
                $available_currency = ['IDR'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Midtrans') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = null;
                $cancel_url = route('membership.midtrans.cancel');
                $payment = new MidtransController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'Iyzico') {
                $available_currency = ['TRY'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Iyzico') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.iyzico.success');
                $cancel_url = route('membership.iyzico.cancel');
                $payment = new IyzicoController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'Paytabs') {
                $paytabInfo = paytabInfo();
                if ($bs->base_currency_text != $paytabInfo['currency']) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Paytabs') . '.');
                    return back()->withInput($request->all());
                }

                $amount = $request->price;
                $success_url = route('membership.paytabs.success');
                $cancel_url = route('membership.paytabs.cancel');
                $payment = new PaytabsController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url);
            } elseif ($request->payment_method == 'Toyyibpay') {
                $available_currency = ['RM'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Toyyibpay') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.toyyibpay.success');
                $cancel_url = route('membership.toyyibpay.cancel');
                $payment = new ToyyibpayController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url);
            } elseif ($request->payment_method == 'Phonepe') {
                $available_currency = ['INR'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for PhonePe') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.phonepe.success');
                $cancel_url = route('membership.phonepe.cancel');
                $payment = new PhonePeController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url);
            } elseif ($request->payment_method == 'Yoco') {
                $available_currency = ['ZAR'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Yoco') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.yoco.success');
                $cancel_url = route('membership.yoco.cancel');
                $payment = new YocoController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'Myfatoorah') {
                $available_currency = ['KWD', 'SAR', 'BHD', 'AED', 'QAR', 'OMR', 'JOD'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Myfatoorah') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                // $cancel_url = route('membership.myfatoorah.cancel');
                $payment = new MyFatoorahController();
                return $payment->paymentProcess($request, $amount, $cancel_url = null);
            } elseif ($request->payment_method == 'Xendit') {
                $available_currency = ['IDR', 'PHP', 'USD', 'SGD', 'MYR'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Xendit') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.xendit.success');
                $cancel_url = route('membership.xendit.cancel');
                $payment = new XenditController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'Perfect Money') {
                // dd(32423);
                $available_currency = ['USD'];
                if (!in_array($bs->base_currency_text, $available_currency)) {
                    session()->flash('warning', $bs->base_currency_text . ' ' . __('is not allowed for Perfect Money') . '.');
                    return back()->withInput($request->all());
                }
                $amount = $request->price;
                $success_url = route('membership.perfect_money.success');
                $cancel_url = route('membership.perfect_money.cancel');
                $payment = new PerfectMoneyController();
                return $payment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif ($request->payment_method == 'NOWPayments') {
                $amount = $request->price;
                $nowpayment = new NowpaymentController();
                $success_url = route('nowpayment.payment.success');
                $cancel_url = route('nowpayment.payment.cancel');
                return $nowpayment->paymentProcess($request, $amount, $success_url, $cancel_url, $title, $bs);
            } elseif (in_array($request->payment_method, $offline_payment_gateways)) {
                $request['status'] = '0';
                if ($request->hasFile('receipt')) {
                    $filename = time() . '.' . $request->file('receipt')->getClientOriginalExtension();
                    $directory = public_path('assets/front/img/membership/receipt');
                    @mkdir($directory, 0777, true);
                    $request->file('receipt')->move($directory, $filename);
                    $request['receipt_name'] = $filename;
                }
                $amount = $request->price;
                $transaction_id = \App\Http\Helpers\VendorPermissionHelper::uniqidReal(8);
                $transaction_details = 'offline';
                $password = uniqid('qrcode');
                $this->store($request, $transaction_id, json_encode($transaction_details), $amount, $bs, $password);
                return view('vendors.offline-success');
            }
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong');
        }
    }

    public function store($request, $transaction_id, $transaction_details)
    {
        $abs = Basic::first();
        Config::set('app.timezone', $abs->timezone);

        $vendor = Vendor::query()->find($request['vendor_id']);
        $previousMembership = Membership::query()
            ->select('id', 'package_id', 'is_trial')
            ->where([['vendor_id', $vendor->id], ['start_date', '<=', Carbon::now()->toDateString()], ['expire_date', '>=', Carbon::now()->toDateString()]])
            ->where('status', 1)
            ->orderBy('created_at', 'DESC')
            ->first();
        if (!is_null($previousMembership)) {
            $previousPackage = Package::query()->select('term')->where('id', $previousMembership->package_id)->first();

            if (($previousPackage->term === 'lifetime' || $previousMembership->is_trial == 1) && $transaction_details != '"offline"') {
                $membership = Membership::find($previousMembership->id);
                $membership->expire_date = Carbon::parse($request['start_date']);
                $membership->save();
            }
        }

        if ($vendor) {
            $membership = Membership::create([
                'price' => $request['price'],
                'currency' => $abs->base_currency_text,
                'currency_symbol' => $abs->base_currency_symbol,
                'payment_method' => $request['payment_method'],
                'transaction_id' => $transaction_id,
                'status' => $transaction_details != '"offline"' ? $request['status'] : 0,
                'receipt' => $request['receipt_name'],
                'transaction_details' => $transaction_details,
                'settings' => json_encode($abs),
                'package_id' => $request['package_id'],
                'vendor_id' => $vendor->id,
                'start_date' => Carbon::parse($request['start_date']),
                'expire_date' => Carbon::parse($request['expire_date']),
                'is_trial' => 0,
                'trial_days' => 0,
                'conversation_id' => array_key_exists('conversation_id', $request) ? $request['conversation_id'] : null,
                'nowpayment_invoice_id' => is_array($request) && array_key_exists('nowpayment_invoice_id', $request) ? $request['nowpayment_invoice_id'] : null,
                'nowpayment_request_data' => is_array($request) && array_key_exists('nowpayment_request_data', $request) ? $request['nowpayment_request_data'] : null,
            ]);
        }
        return $vendor;
    }

    //onlineSuccess
    public function onlineSuccess()
    {
        return view('vendors.success');
    }

    public function paymentInstruction(Request $request)
    {
        $offline = OfflineGateway::where('name', $request->name)->select('short_description', 'instructions', 'has_attachment')->first();
        return response()->json([
            'description' => $offline->short_description,
            'instructions' => $offline->instructions,
            'has_attachment' => $offline->has_attachment,
        ]);
    }
}
