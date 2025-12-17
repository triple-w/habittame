<?php

namespace App\Http\Controllers;

use PDF;
use Carbon\Carbon;
use App\Models\Vendor;
use App\Models\Package;
use App\Models\Membership;
use App\Http\Helpers\MegaMailer;
use App\Models\BasicSettings\Basic;
use Illuminate\Support\Facades\Http;
use App\Jobs\SubscriptionExpiredMail;
use App\Jobs\SubscriptionReminderMail;
use App\Models\Project\ProjectGalleryImage;
use App\Http\Helpers\VendorPermissionHelper;
use App\Models\PaymentGateway\OnlineGateway;
use App\Models\Property\PropertySliderImage;
use App\Models\Project\ProjectFloorplanImage;

class CronJobController extends Controller
{
    public function expired()
    {
        try {
            $bs = Basic::first();

            $expired_members = Membership::whereDate('expire_date', Carbon::now()->subDays(1))->get();
            foreach ($expired_members as $key => $expired_member) {
                if (!empty($expired_member->vendor)) {
                    $vendor = $expired_member->vendor;
                    $current_package = VendorPermissionHelper::userPackage($vendor->id);
                    if (is_null($current_package)) {
                        SubscriptionExpiredMail::dispatch($vendor, $bs);
                    }
                }
            }

            $remind_members = Membership::whereDate('expire_date', Carbon::now()->addDays($bs->expiration_reminder))->get();
            foreach ($remind_members as $key => $remind_member) {
                if (!empty($remind_member->vendor)) {
                    $vendor = $remind_member->vendor;

                    $nextPacakgeCount = Membership::where([['vendor_id', $vendor->id], ['start_date', '>', Carbon::now()->toDateString()]])
                        ->where('status', '<>', 2)
                        ->count();

                    if ($nextPacakgeCount == 0) {
                        SubscriptionReminderMail::dispatch($vendor, $bs, $remind_member->expire_date);
                    }
                }
                \Artisan::call('queue:work --stop-when-empty');
            }

            // delete unnecessary images
            $propertyGalleryImage = PropertySliderImage::where('property_id', null)->get();
            $projectGalleryImage = ProjectGalleryImage::where('project_id', null)->get();
            $projectFloorplanImage = ProjectFloorplanImage::where('project_id', null)->get();
            if ($propertyGalleryImage) {
                $now = Carbon::now();
                foreach ($propertyGalleryImage as $image) {
                    $imagesDateTime = Carbon::parse($image->created_at);

                    if ($imagesDateTime->lt($now->subHour())) {
                        @unlink(public_path('assets/img/property/slider-images/' . $image->image));
                        $image->delete();
                    }
                }
            }

            if ($projectGalleryImage) {
                $now = Carbon::now();
                foreach ($projectGalleryImage as $image) {
                    $imagesDateTime = Carbon::parse($image->created_at);
                    if ($imagesDateTime->lt($now->subHour())) {
                        @unlink(public_path('assets/img/project/gallery-images/' . $image->image));
                        $image->delete();
                    }
                }
            }

            if ($projectFloorplanImage) {
                $now = Carbon::now();
                foreach ($projectFloorplanImage as $image) {
                    $imagesDateTime = Carbon::parse($image->created_at);
                    if ($imagesDateTime->lt($now->subHour())) {
                        @unlink(public_path('assets/img/project/floor-paln-images/' . $image->image));
                        $image->delete();
                    }
                }
            }
        } catch (\Exception $e) {
        }
    }

    public function checkPayment()
    {
        //check iyzico pending  membership
        $this->checkPendingMemberships();
    }

    protected function checkPendingMemberships()
    {
        $iyzico_pending_memberships = Membership::where([['status', 0], ['payment_method', 'Iyzico']])->get();

        foreach ($iyzico_pending_memberships as $iyzico_pending_membership) {
            if (!is_null($iyzico_pending_membership->conversation_id)) {
                $result = $this->IyzicoPaymentStatus($iyzico_pending_membership->conversation_id);
                if ($result == 'success') {
                    $this->updateIyzicoPendingMemership($iyzico_pending_membership->id, 1);
                } else {
                    $this->updateIyzicoPendingMemership($iyzico_pending_membership->id, 2);
                }
            }
        }

        // NowPament start
        try {
         
            $nowPaymentMemberships = Membership::where([
                'payment_method' => 'NOWPayments',
                'status' => 0,
            ])->get();
            
            foreach ($nowPaymentMemberships as $membership) {
                $activation = Carbon::parse($membership->start_date);
                $expire = Carbon::parse($membership->expire_date);
                $package = Package::find($membership->package_id);
                $bs = Basic::first();
                $transaction_id = $membership->transaction_id;
                $amount = $membership->price;
                $vendor = Vendor::find($membership->vendor_id);
                $paymentId = (int) $membership->transaction_id;
                $responseData = $this->currentPaymentActivity($paymentId);
          
                if (array_key_exists('payment_status', $responseData) && $responseData['payment_status'] == 'waiting') {
                    $request = [];
                    $request['payment_method'] = $membership->payment_method;
                    $request['start_date'] = $membership->start_date;
                    $request['expire_date'] = $membership->expire_date;

                    $file_name = $this->makeInvoice($request, 'membership', $vendor, $amount, 'NOWPayments', $vendor->phone, $bs->base_currency_symbol_position, $bs->base_currency_symbol, $bs->base_currency_text, $transaction_id, $package->title, $membership);
                    $membership->update([
                        'status' => 1,
                    ]);
                    $mailer = new MegaMailer();
                    $data = [
                        'toMail' => $vendor->email,
                        'toName' => $vendor->fname,
                        'username' => $vendor->username,
                        'package_title' => $package->title,
                        'package_price' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $package->price . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                        'discount' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $membership->discount . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                        'total' => ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $membership->price . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : ''),
                        'activation_date' => $activation->toFormattedDateString(),
                        'expire_date' => Carbon::parse($expire->toFormattedDateString())->format('Y') == '9999' ? 'Lifetime' : $expire->toFormattedDateString(),
                        'membership_invoice' => $file_name,
                        'website_title' => $bs->website_title,
                        'templateType' => 'package_purchase',
                        'type' => 'packagePurchase',
                    ];
                    $mailer->mailFromAdmin($data);
                    @unlink(public_path('assets/front/invoices/' . $file_name));
                }
            }
        } catch (\Exception $e) {
            \Log::info($e->getMessage());
        }
    }
    


    public function currentPaymentActivity($paymentId)
    {
        $response = Http::withHeaders([
            'x-api-key' => env('NOWPAYMENT_API_KEY'),
        ])->get('https://api.nowpayments.io/v1/payment/' . $paymentId);
        return $response->json();
    }


    // get iyzico payment status from iyzico server

    private function IyzicoPaymentStatus($conversation_id)
    {
        // dd($conversation_id);
        $paymentMethod = OnlineGateway::where('keyword', 'iyzico')->first();
        $paydata = json_decode($paymentMethod->information, true);

        $options = new \Iyzipay\Options();
        $options->setApiKey($paydata['api_key']);
        $options->setSecretKey($paydata['secret_key']);
        if ($paydata['iyzico_mode'] == 1) {
            $options->setBaseUrl('https://sandbox-api.iyzipay.com');
        } else {
            $options->setBaseUrl('https://api.iyzipay.com');
        }

        $request = new \Iyzipay\Request\ReportingPaymentDetailRequest();
        $request->setPaymentConversationId($conversation_id);

        $paymentResponse = \Iyzipay\Model\ReportingPaymentDetail::create($request, $options);
        $result = (array) $paymentResponse;

        foreach ($result as $key => $data) {
            $data = json_decode($data, true);
            if ($data['status'] == 'success' && !empty($data['payments'])) {
                if (is_array($data['payments'])) {
                    if ($data['payments'][0]['paymentStatus'] == 1) {
                        return 'success';
                    } else {
                        return 'not found';
                    }
                } else {
                    return 'not found';
                }
            } else {
                return 'not found';
            }
        }
        return 'not found';
    }

    //update pending memberships if payment is successfull
    private function updateIyzicoPendingMemership($id, $status)
    {
        $bs = Basic::first();
        $membership = Membership::query()->findOrFail($id);
        $vendor = Vendor::query()->findOrFail($membership->vendor_id);

        // Get vendor info
        $vendorInfo = $this->getVendorDetails($membership->vendor_id);
        $package = Package::query()->findOrFail($membership->package_id);

        $count_membership = Membership::query()->where('vendor_id', $membership->vendor_id)->count();

        //comparison date
        $date1 = Carbon::createFromFormat('m/d/Y', \Carbon\Carbon::parse($membership->start_date)->format('m/d/Y'));
        $date2 = Carbon::createFromFormat('m/d/Y', \Carbon\Carbon::now()->format('m/d/Y'));

        $result = $date1->gte($date2);

        if ($result) {
            $data['start_date'] = $membership->start_date;
            $data['expire_date'] = $membership->expire_date;
        } else {
            $data['start_date'] = Carbon::today()->format('d-m-Y');
            if ($package->term === 'daily') {
                $data['expire_date'] = Carbon::today()->addDay()->format('d-m-Y');
            } elseif ($package->term === 'weekly') {
                $data['expire_date'] = Carbon::today()->addWeek()->format('d-m-Y');
            } elseif ($package->term === 'monthly') {
                $data['expire_date'] = Carbon::today()->addMonth()->format('d-m-Y');
            } elseif ($package->term === 'lifetime') {
                $data['expire_date'] = Carbon::maxValue()->format('d-m-Y');
            } else {
                $data['expire_date'] = Carbon::today()->addYear()->format('d-m-Y');
            }
            $membership->update(['start_date' => Carbon::parse($data['start_date'])]);
            $membership->update(['expire_date' => Carbon::parse($data['expire_date'])]);
        }

        // if previous membership package is lifetime, then exipre that membership
        $previousMembership = Membership::query()
            ->where([['vendor_id', $vendorInfo->id], ['start_date', '<=', Carbon::now()->toDateString()], ['expire_date', '>=', Carbon::now()->toDateString()]])
            ->where('status', 1)
            ->orderBy('created_at', 'DESC')
            ->first();

        if (!is_null($previousMembership)) {
            $previousPackage = Package::query()->select('term')->where('id', $previousMembership->package_id)->first();
            if ($previousPackage->term === 'lifetime' || $previousMembership->is_trial == 1) {
                $yesterday = Carbon::yesterday()->format('d-m-Y');
                $previousMembership->expire_date = Carbon::parse($yesterday);
                $previousMembership->save();
            }
        }

        // Update vendor status to 1 (active) only for new memberships
        if ($count_membership <= 1) {
            $vendor->update(['status' => 1]);
            $paymentFor = 'membership';
        } else {
            $paymentFor = 'extend';
        }

        // process invoice data
        $membershipInvoiceData = [
            'name' => $vendorInfo->vendor_name,
            'username' => $vendorInfo->username,
            'email' => $vendorInfo->email,
            'phone' => $vendorInfo->phone,
            'order_id' => $membership->transaction_id,
            'base_currency_text_position' => $bs->base_currency_text_position,
            'base_currency_text' => $bs->base_currency_text,
            'base_currency_symbol' => $bs->base_currency_symbol,
            'base_currency_symbol_position' => $bs->base_currency_symbol_position,
            'amount' => $package->price,
            'payment_method' => 'Iyzico',
            'package_title' => $package->title,
            'start_date' => $data['start_date'] ?? $membership->start_date,
            'expire_date' => $data['expire_date'] ?? $membership->expire_date,
            'website_title' => $bs->website_title,
            'logo' => $bs->logo,
        ];

        $request = [];
        $member = [];
        $request['payment_method'] = $membershipInvoiceData['payment_method'];
        $request['start_date'] = $membershipInvoiceData['start_date'];
        $request['expire_date'] = $membershipInvoiceData['expire_date'];

        $member['first_name'] = $membershipInvoiceData['name'];
        $member['last_name'] = $membershipInvoiceData['name'];
        $member['username'] = $membershipInvoiceData['username'];
        $member['email'] = $membershipInvoiceData['email'];

        $amount = $membershipInvoiceData['amount'];
        $payment_method = $membershipInvoiceData['payment_method'];
        $phone = $membershipInvoiceData['phone'];
        $base_currency_symbol_position = $membershipInvoiceData['base_currency_symbol_position'];
        $base_currency_symbol = $membershipInvoiceData['base_currency_symbol'];
        $base_currency_text = $membershipInvoiceData['base_currency_text'];
        $order_id = $membershipInvoiceData['order_id'];
        $package_title = $membershipInvoiceData['package_title'];

        $file_name = $this->makeInvoice($request, 'membership', $member, $amount, $payment_method, $phone, $base_currency_symbol_position, $base_currency_symbol, $base_currency_text, $order_id, $package_title, $membership);

        $currencyFormat = function ($amount) use ($bs) {
            return ($bs->base_currency_text_position == 'left' ? $bs->base_currency_text . ' ' : '') . $amount . ($bs->base_currency_text_position == 'right' ? ' ' . $bs->base_currency_text : '');
        };

        //process mail data
        $mailData = [
            'toMail' => $vendorInfo->email,
            'toName' => $vendorInfo->fname,
            'username' => $vendorInfo->username,
            'package_title' => $package->title,
            'package_price' => $currencyFormat($package->price),
            'total' => $currencyFormat($membership->price),
            'activation_date' => $data['start_date'] ?? $membership->start_date,
            'expire_date' => $data['expire_date'] ?? $membership->expire_date,
            'membership_invoice' => $file_name,
            'website_title' => $bs->website_title,
            'templateType' => 'package_purchase',
        ];

        $mail = new MegaMailer();
        $mail->mailFromAdmin($mailData);
        @unlink(public_path('assets/front/invoices/' . $file_name));

        $membership->update(['status' => $status]);
    }

    protected function getVendorDetails($vendorId)
    {
        return Vendor::select('vendors.*', 'vendor_infos.name as vendor_name')
            ->leftJoin('vendor_infos', function ($join) use ($vendorId) {
                $join->on('vendors.id', '=', 'vendor_infos.vendor_id')->where('vendors.id', $vendorId);
            })
            ->where('vendors.id', '=', $vendorId)
            ->first();
    }
}
