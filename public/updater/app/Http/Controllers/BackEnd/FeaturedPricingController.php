<?php

namespace App\Http\Controllers\BackEnd;

use DB;
use PDF;
use App\Models\Vendor;
use App\Models\Language;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\FeaturedPricing;
use App\Models\Property\Content;
use App\Http\Helpers\BasicMailer;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Response;
use App\Models\Property\FeaturedProperty;
use App\Models\BasicSettings\MailTemplate;

class FeaturedPricingController extends Controller
{
    public function index(Request $request)
    {
        if (session()->has('lang')) {
            $currentLang = Language::where('code', session()->get('lang'))->first();
        } else {
            $currentLang = Language::where('is_default', 1)->first();
        }
        $search = $request->search;
        $data['bex'] = $currentLang->basic_extended;
        $data['featuredPricing'] = FeaturedPricing::orderBy('created_at', 'DESC')->get();
        return view('backend.featured-properties.index', $data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'number_of_days' => 'required|numeric',
            'price' => 'required',
            'status' => 'required'
        ]);
        try {

            FeaturedPricing::create([
                'number_of_days' => $request->number_of_days,
                'price' => $request->price,
                'status' => $request->status
            ]);
            Session::flash('success', "Pricing Created Successfully");
            return Response::json(['status' => 'success'], 200);
        } catch (\Throwable $e) {
            return $e;
        }
    }

    public function edit($id)
    {
        if (session()->has('lang')) {
            $currentLang = Language::where('code', session()->get('lang'))->first();
        } else {
            $currentLang = Language::where('is_default', 1)->first();
        }
        $data['bex'] = $currentLang->basic_extended;
        $data['pricing'] = FeaturedPricing::query()->findOrFail($id);
        return view("backend.featured-properties.edit", $data);
    }

    public function update(Request $request)
    {
        $request->validate([
            'number_of_days' => 'required|numeric',
            'price' => 'required',
            'status' => 'required'
        ]);
        try {

            return DB::transaction(function () use ($request) {
                FeaturedPricing::query()->findOrFail($request->pricing_id)
                    ->update([
                        'number_of_days' => $request->number_of_days,
                        'price' => $request->price,
                        'status' => $request->status
                    ]);
                Session::flash('success', "Pricing Update Successfully");
                return Response::json(['status' => 'success'], 200);
            });
        } catch (\Throwable $e) {
            return $e;
        }
    }
    public function destroy(Request $request)
    {
        $pricing = FeaturedPricing::with('feturedProperties')->findOrFail($request->pricing_id);
        $featuedProerties = $pricing->feturedProperties()->get();
        if ($featuedProerties->count() > 0) {
            foreach ($featuedProerties as $featured) {
                $featuredEndDate = Carbon::parse($featured->end_date);
                if (empty($featured->end_date)   || Carbon::now()->lte($featuredEndDate)) {
                    Session::flash('warning', "You can not delete this pricing.Poperties already featured under this pricing!");
                    return redirect()->back();
                } else {
                    $featured->delete();
                }
            }

            $pricing->delete();
            Session::flash('success', 'Successfully delete featured property!');
        } else {
            $pricing->delete();
            Session::flash('success', 'Successfully delete featured property!');
            return redirect()->back();
        }
        return redirect()->back();
    }
    public function requestedForFeatured(Request $request)
    {
        $data['langs'] = Language::all();
        $status = $title = $payment =  $transaction = null;

        if ($request->has('language')) {
            $language = Language::where('code', $request->language)->firstOrFail();
        } else {

            $language = Language::where('is_default', 1)->first();
        }

        $data['language'] = $language;
        if ($request->has('status') && $request->status !== 'all') {
            if ($request->status == 'pending') {
                $status = 0;
            } elseif ($request->status == 'featured') {
                $status = 1;
            } elseif ($request->status == 'rejected') {
                $status = 2;
            }
        }
        if ($request->has('property')) {
            $title = $request->title;
        }
        if ($request->has('transaction')) {
            $transaction = $request->transaction;
        }
        if ($request->has('payment') && $request->payment !== 'all') {
            $payment = $request->payment;
        }

        $featuredRequests = FeaturedProperty::query()
            ->with('property', 'vendor')
            ->join('property_contents', 'featured_properties.property_id', 'property_contents.property_id')
            ->where('property_contents.language_id', $language->id)
            ->where('featured_properties.vendor_id', '!=', 0)
            ->when($payment, function ($q) use ($payment) {
                $q->where('featured_properties.payment_status', $payment);
            })
            ->when(!is_null($status), function ($q) use ($status) {
                $q->where('featured_properties.status', $status);
            })
            ->when($title, function ($query, $title) {
                return $query->where('property_contents.title', 'like', '%' . $title . '%');
            })
            ->when($transaction, function ($query, $transaction) {
                return $query->where('featured_properties.transaction_id', 'like', '%' . $transaction . '%');
            })
            ->select('featured_properties.*')
            ->latest()->get();
        $data['featuredRequests'] = $featuredRequests;
        return view('backend.featured-properties.featured-request', $data);
    }

    public function changeFeaturedStatus(Request $request)
    {
        $featuredRequest = FeaturedProperty::findorFail($request->requestId);
        $bs = Basic::first();
        if ($request->status == 1) {
            $featuredRequest->update([
                'status' => $request->status,
                'start_date' => Carbon::now()->timezone($bs->timezone)->format('Y-m-d H:i:s'),
                'end_date' => Carbon::now()->timezone($bs->timezone)->addDays($featuredRequest->number_of_days)->format('Y-m-d H:i:s'),
            ]);

            if ($featuredRequest->vendor_id != 0) {
                $vendor = Vendor::find($featuredRequest->vendor_id);
                $vendor->name = $vendor->vendor_info->name;
                $popertyContent = Content::where('property_id', $featuredRequest->property_id)->select('title')->first();

                $file_name = $this->createInvoice('featured_pro', $vendor, $featuredRequest->amount, $featuredRequest->gateway_type,  $vendor->phone, $bs->base_currency_symbol,   $bs->base_currency_text, $featuredRequest->transaction_id, $popertyContent->title, $featuredRequest->start_date, $featuredRequest->end_date);
                $this->prepareMailForFeatured($featuredRequest, public_path('assets/front/invoices/' . $file_name));
                @unlink(public_path('assets/front/invoices/' . $file_name));
            } else {
                $this->prepareMailForFeatured($featuredRequest);
            }
        } else {
            $featuredRequest->update([
                'status' => $request->status
            ]);
            $this->prepareMailForFeaturedRequestRejected($featuredRequest);
        }


        Session::flash('success', "Featured Request Update Successfully");
        return redirect()->back();
    }

    public function prepareMailForFeatured($featuredRequest, $invoice = null)
    {
        // get the mail template info from db
        $mailTemplate = MailTemplate::query()->where('mail_type', '=', 'featured_property')->first();
        $mailData['subject'] = $mailTemplate->mail_subject;
        $mailBody = $mailTemplate->mail_body;
        if ($invoice != null) {
            $mailData['invoice'] = $invoice;
        }
        // get the website title info from db
        $info = Basic::select('website_title', 'base_currency_text')->first();
        $vendor = Vendor::find($featuredRequest->vendor_id);
        $vendor->name = $vendor->vendor_info?->name;


        $websiteTitle = $info->website_title;

        $propertyInfo = Content::where('property_id', $featuredRequest->property_id)->select('slug', 'title', 'id')->first();

        $propertyLink = ' <a href=' . route("frontend.property.details", $propertyInfo->slug) . '>' . $propertyInfo->title . '</a>';


        // replacing with actual data
        $mailBody = str_replace('{username}', $vendor->username, $mailBody);
        $mailBody = str_replace('{featured_price}', $featuredRequest->amount . ' ' . $info->base_currency_text, $mailBody);
        $mailBody = str_replace('{start_date}', Carbon::parse($featuredRequest->start_date)->format('d-M-Y H:i:s'), $mailBody);
        $mailBody = str_replace('{end_date}', Carbon::parse($featuredRequest->end_date)->format('d-M-Y H:i:s'), $mailBody);
        $mailBody = str_replace('{website_title}', $websiteTitle, $mailBody);
        $mailBody = str_replace('{number_of_days}', $featuredRequest->number_of_days, $mailBody);
        $mailBody = str_replace('{property_link}', $propertyLink, $mailBody);

        $mailData['body'] = $mailBody;

        $mailData['recipient'] = $vendor->email;

        BasicMailer::sendMail($mailData);

        return;
    }
    public function createInvoice($key, $member,  $amount, $payment_method, $phone,  $base_currency_symbol, $base_currency_text, $transaction_id, $property_title, $startDate, $endDate)
    {
        $file_name = uniqid($key) . ".pdf";
        config(['dompdf.public_path' => base_path('public')]);
        $pdf = PDF::setOptions([
            'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
            'logOutputFile' => storage_path('logs/log.htm'),
            'tempDir' => storage_path('logs/')
        ])->loadView('pdf.featured-property', compact('member', 'amount', 'payment_method', 'phone', 'base_currency_symbol', 'base_currency_text', 'transaction_id', 'property_title', 'startDate', 'endDate'));
        $output = $pdf->output();
        @mkdir(public_path('assets/front/invoices/'), 0775, true);
        file_put_contents(public_path('assets/front/invoices/') . $file_name, $output);
        return $file_name;
    }

    public function prepareMailForFeaturedRequestRejected($featuredRequest)
    {
        // get the mail template info from db
        $mailTemplate = MailTemplate::where('mail_type', '=', 'property_featured_request_rejected')->first();
        $mailData['subject'] = $mailTemplate->mail_subject;
        $mailBody = $mailTemplate->mail_body;

        // get the website title info from db
        $info = Basic::select('website_title')->first();
        $vendor = Vendor::find($featuredRequest->vendor_id);


        $websiteTitle = $info->website_title;

        $propertyInfo = Content::where('property_id', $featuredRequest->property_id)->select('slug', 'title', 'id')->first();

        $propertyLink = ' <a href=' . route("frontend.property.details", $propertyInfo->slug) . '>' . $propertyInfo->title . '</a>';


        // replacing with actual data
        $mailBody = str_replace('{username}', $vendor->username, $mailBody);
        $mailBody = str_replace('{website_title}', $websiteTitle, $mailBody);
        $mailBody = str_replace('{number_of_days}', $featuredRequest->number_of_days, $mailBody);
        $mailBody = str_replace('{property_link}', $propertyLink, $mailBody);

        $mailData['body'] = $mailBody;

        $mailData['recipient'] = $vendor->email;

        BasicMailer::sendMail($mailData);

        return;
    }

    public function changeFeaturedPaymentStatus(Request $request)
    {
        $featuredRequest = FeaturedProperty::findorFail($request->requestId);

        $featuredRequest->update([
            'payment_status' => $request->payment_status
        ]);

        if ($request->payment_status == 'complete') {
            $mailTemplate = MailTemplate::query()->where('mail_type', '=', 'payment_accepted_for_featured_property_offline_gateway')->first();
        } elseif ($request->payment_status == 'rejected') {
            $mailTemplate = MailTemplate::query()->where('mail_type', '=', 'payment_rejected_for_feature_property_offline_gateway')->first();
            $featuredRequest->update([
                'status' => 2
            ]);
        }

        $mailData['subject'] = $mailTemplate->mail_subject;
        $mailBody = $mailTemplate->mail_body;
        // get the website title info from db
        $info = Basic::select('website_title', 'base_currency_text')->first();
        $vendor = Vendor::find($featuredRequest->vendor_id);


        $websiteTitle = $info->website_title;

        $propertyInfo = Content::where('property_id', $featuredRequest->property_id)->select('slug', 'title', 'id')->first();

        $propertyLink = ' <a href=' . route("frontend.property.details", $propertyInfo->slug) . '>' . $propertyInfo->title . '</a>';


        // replacing with actual data
        $mailBody = str_replace('{username}', $vendor->username, $mailBody);
        $mailBody = str_replace('{website_title}', $websiteTitle, $mailBody);
        $mailBody = str_replace('{payment_method}', $featuredRequest->gateway_type, $mailBody);
        $mailBody = str_replace('{number_of_days}', $featuredRequest->number_of_days, $mailBody);
        $mailBody = str_replace('{property_title}', $propertyLink, $mailBody);
        $mailBody = str_replace('{featured_price}', $featuredRequest->amount . ' ' . $info->base_currency_text, $mailBody);

        $mailData['body'] = $mailBody;

        $mailData['recipient'] = $vendor->email;

        BasicMailer::sendMail($mailData);

        Session::flash('success', "Payment Status Update Successfully");
        return redirect()->back();
    }

    public function deleteFeturedRequest(Request $request)
    {
        $featuredRequest = FeaturedProperty::find($request->id);
        if ($featuredRequest) {
            if (!is_null($featuredRequest->attachment)) {
                @unlink(public_path('assets/front/img/feature/attachment/' . $featuredRequest->attachment));
            }
            $featuredRequest->delete();

            Session::flash('success', "Request deleted successfully");
        } else {
            Session::flash('warning', "Something went wrong");
        }
        return redirect()->back();
    }
}
