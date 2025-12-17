<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Payment\MyFatoorahController as PaymentMyFatoorahController;

class MyFatoorahController extends Controller
{
    public function myfatoorah_callback(Request $request)
    {
        $data = new PaymentMyFatoorahController();
        $data = $data->successPayment($request);
        return redirect($data['url']);
    }

    public function myfatoorah_cancel(Request $request)
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
