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
use App\Http\Helpers\MegaMailer;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\BasicSettings\Basic;
use Mollie\Laravel\Facades\Mollie;
use App\Models\Language;
use App\Models\Membership;
use App\Models\PaymentGateway\OnlineGateway;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Config;

class MollieController extends Controller
{
    public $public_key;

    public function __construct()
    {
        $data = OnlineGateway::whereKeyword('mollie')->first();
        $paydata = $data->convertAutoData();
        $this->public_key = $paydata['key'];
        Config::set('mollie.key', $paydata['key']);
    }

    public function paymentProcess(Request $request, $_amount, $_success_url, $_cancel_url, $_title, $bex)
    {
        $notify_url = $_success_url;
        $payment = Mollie::api()->payments()->create([
            'amount' => [
                'currency' => $bex->base_currency_text,
                'value' => '' . sprintf('%0.2f', $_amount) . '', // You must send the correct number of decimals, thus we enforce the use of strings
            ],
            'description' => $_title,
            'redirectUrl' => $notify_url,
        ]);

        /** add payment ID to session **/
        Session::put('request', $request->all());
        Session::put('payment_id', $payment->id);
        Session::put('success_url', $_success_url);
        Session::put('cancel_url', $_cancel_url);

        $payment = Mollie::api()->payments()->get($payment->id);
        return redirect($payment->getCheckoutUrl(), 303);
    }

    public function notify(Request $request)
    {
        $requestData = Session::get('request');
        $cancel_url = Session::get('cancel_url');
        $payment_id = Session::get('payment_id');
        /** Get the payment ID before session clear **/

        $payment = Mollie::api()->payments()->get($payment_id);

        if ($payment->status == 'paid') {

            $transaction_id = VendorPermissionHelper::uniqidReal(8);
            $transaction_details = json_encode($payment);

            $requestData['gateway_type'] = 'mollie';

            $checkout = new PaymentController();

            $checkout->store($requestData, $transaction_id, $transaction_details);

            $checkout->mailToAdminForFeaturedRequest($requestData);
            session()->flash('success', 'Your payment has been completed.');
            Session::forget('request');
            Session::forget('success_url');
            Session::forget('payment_id');
            Session::forget('cancel_url');
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
