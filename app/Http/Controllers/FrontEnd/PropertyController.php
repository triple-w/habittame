<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Agent;
use App\Models\Amenity;
use App\Models\AmenityContent;
use App\Models\BasicSettings\Basic;
use App\Models\Property\City;
use App\Models\Property\CityContent;
use App\Models\Property\Content;
use App\Models\Property\Country;
use App\Models\Property\CountryContent;
use App\Models\Property\Property;
use App\Models\Property\PropertyAmenity;
use App\Models\Property\PropertyCategory;
use App\Models\Property\PropertyCategoryContent;
use App\Models\Property\PropertyContact;
use App\Models\Property\State;
use App\Models\Property\StateContent;
use App\Models\Vendor;
use Auth;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Config;
use Session;
use Illuminate\Support\Facades\Mail;
use Illuminate\Mail\Message;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;
use PhpOffice\PhpSpreadsheet\Calculation\Category;
use View;

class PropertyController extends Controller
{
    public function index(Request $request)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $information['seoInfo'] = $language->seoInfo()->select('meta_keyword_properties', 'meta_description_properties')->first();

        if ($request->has('type') && ($request->type == 'commercial' || $request->type == 'residential')) {
            $information['categories'] = PropertyCategory::with(['categoryContent' => function ($q) use ($language) {
                $q->where('language_id', $language->id);
            }, 'properties'])->where([['status', 1], ['type', $request->type]])->get();
        } else {
            $information['categories'] = PropertyCategory::with(['categoryContent' => function ($q) use ($language) {
                $q->where('language_id', $language->id);
            }, 'properties'])->where('status', 1)->get();
        }


        $information['bgImg'] = $misc->getBreadcrumb();
        $information['pageHeading'] = $misc->getPageHeading($language);
        $information['amenities'] = Amenity::where('status', 1)->with(['amenityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->orderBy('serial_number')->get();

        $propertyCategory = null;
        $category = null;
        if ($request->filled('category') && $request->category != 'all') {
            $category = $request->category;
            $propertyCategory = PropertyCategoryContent::where([['language_id', $language->id], ['slug', $category]])->first();
        }

        $amenities = [];
        $amenityInContentId = [];
        if ($request->filled('amenities')) {
            $amenities = $request->amenities;
            foreach ($amenities as $amenity) {
                $amenConId = AmenityContent::where('name', $amenity)->where('language_id', $language->id)->pluck('amenity_id')->first();
                array_push($amenityInContentId, $amenConId);
            }
        }

        $amenityInContentId = array_unique($amenityInContentId);
        $type = null;
        if ($request->filled('type') && $request->type != 'all') {
            $type = $request->type;
        }

        $price = null;
        if ($request->filled('price') && $request->price != 'all') {
            $price = $request->price;
        }

        $purpose = null;
        if ($request->filled('purpose') && $request->purpose != 'all') {
            $purpose = $request->purpose;
        }

        $min = $max = null;
        if ($request->filled('min') && $request->filled('max')) {
            $min = intval($request->min);
            $max = intval(($request->max));
        }

        $title = $location = $beds = $baths = $area = $countryId = $stateId = $cityId = null;
        if ($request->filled('country') && $request->filled('country')) {

            $country = CountryContent::where([['name', $request->country], ['language_id', $language->id]])->first();
            if ($country) {
                $countryId = $country->country_id;
            }
        }
        if ($request->filled('state') && $request->filled('state')) {

            $state = StateContent::where([['name', $request->state], ['language_id', $language->id]])->first();
            if ($state) {
                $stateId = $state->state_id;
            }
        }
        if ($request->filled('city') && $request->filled('city')) {

            $city = CityContent::where([['name', $request->city], ['language_id', $language->id]])->first();
            if ($city) {
                $cityId = $city->city_id;
            }
        }
        if ($request->filled('title') && $request->filled('title')) {
            $title =  $request->title;
        }

        if ($request->filled('location') && $request->filled('location')) {
            $location =  $request->location;
        }
        if ($request->filled('beds') && $request->filled('beds')) {
            $beds =  $request->beds;
        }
        if ($request->filled('baths') && $request->filled('baths')) {
            $baths =  $request->baths;
        }
        if ($request->filled('area') && $request->filled('area')) {
            $area =  $request->area;
        }


        if ($request->filled('sort')) {
            if ($request['sort'] == 'new') {
                $order_by_column = 'properties.id';
                $order = 'desc';
            } elseif ($request['sort'] == 'old') {
                $order_by_column = 'properties.id';
                $order = 'asc';
            } elseif ($request['sort'] == 'high-to-low') {
                $order_by_column = 'properties.price';
                $order = 'desc';
            } elseif ($request['sort'] == 'low-to-high') {
                $order_by_column = 'properties.price';
                $order = 'asc';
            } else {
                $order_by_column = 'properties.id';
                $order = 'desc';
            }
        } else {
            $order_by_column = 'properties.id';
            $order = 'desc';
        }

        $property_contents = Property::where([['properties.status', 1], ['properties.approve_status', 1]])
            ->join('property_contents', 'properties.id', 'property_contents.property_id')
            ->join('property_categories', 'property_categories.id', 'properties.category_id')
            ->where('property_contents.language_id', $language->id)
            ->leftJoin('vendors', 'properties.vendor_id', '=', 'vendors.id')
            ->leftJoin('memberships', function ($join) {
                $join->on('properties.vendor_id', '=', 'memberships.vendor_id')
                    ->where('memberships.status', '=', 1)
                    ->where('memberships.start_date', '<=', Carbon::now()->format('Y-m-d'))
                    ->where('memberships.expire_date', '>=', Carbon::now()->format('Y-m-d'));
            })
            ->where(function ($query) {
                $query->where('properties.vendor_id', '=', 0)
                    ->orWhere(function ($query) {
                        $query->where('vendors.status', '=', 1)->whereNotNull('memberships.id');
                    });
            })

            ->when($type, function ($query) use ($type) {
                return $query->where('properties.type', $type);
            })
            ->when($purpose, function ($query) use ($purpose) {
                return $query->where('properties.purpose', $purpose);
            })
            ->when($countryId, function ($query) use ($countryId) {
                return $query->where('properties.country_id', $countryId);
            })
            ->when($stateId, function ($query) use ($stateId) {
                return $query->where('properties.state_id', $stateId);
            })
            ->when($cityId, function ($query) use ($cityId) {
                return $query->where('properties.city_id', $cityId);
            })
            ->when($category && $propertyCategory, function ($query) use ($propertyCategory) {
                return $query->where('properties.category_id', $propertyCategory->category_id);
            })

            ->when(!empty($amenityInContentId), function ($query) use ($amenityInContentId) {
                $query->whereHas(
                    'proertyAmenities',
                    function ($q) use ($amenityInContentId) {
                        $q->whereIn('amenity_id', $amenityInContentId);
                    },
                    '=',
                    count($amenityInContentId)
                );
            })
            ->when($price, function ($query) use ($price) {
                if ($price == 'negotiable') {
                    return $query->where('properties.price', null);
                } elseif ($price == 'fixed') {

                    return $query->where('properties.price', '!=', null);
                } else {
                    return $query;
                }
            })

            ->when($min, function ($query) use ($min, $max, $price) {
                if ($price == 'fixed' || empty($price)) {
                    return $query->where('properties.price', '>=', $min)
                        ->where('properties.price', '<=', $max);
                } else {
                    return $query;
                }
            })
            ->when($beds, function ($query) use ($beds) {
                return $query->where('properties.beds', $beds);
            })
            ->when($baths, function ($query) use ($baths) {
                return $query->where('properties.bath', $baths);
            })
            ->when($area, function ($query) use ($area) {
                return $query->where('properties.area', $area);
            })
            ->when($title, function ($query) use ($title) {
                return $query->where('property_contents.title', 'LIKE', '%' . $title . '%');
            })
            ->when($location, function ($query) use ($location) {
                return $query->where('property_contents.address', 'LIKE', '%' . $location . '%');
            })
            ->with(['categoryContent' => function ($q) use ($language) {
                $q->where('language_id', $language->id);
            }])

            ->select('properties.*', 'property_categories.id as categoryId', 'property_contents.title', 'property_contents.slug', 'property_contents.address', 'property_contents.description', 'property_contents.language_id')
            ->orderBy($order_by_column, $order)
            ->paginate(12);
        $information['property_contents'] = $property_contents;
        $information['contents'] = $property_contents;

        $information['all_cities'] = City::where('status', 1)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['all_states'] = State::with(['stateContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['all_countries'] = Country::with(['countryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();

        $min = Property::where([['status', 1], ['approve_status', 1]])->min('price');
        $max = Property::where([['status', 1], ['approve_status', 1]])->max('price');
        $information['min'] = intval($min);
        $information['max'] = intval($max);
        if ($request->ajax()) {
            $viewContent = View::make('frontend.property.property',  $information);
            $viewContent = $viewContent->render();

            return response()->json(['propertyContents' => $viewContent, 'properties' => $property_contents])->header('Cache-Control', 'no-cache, no-store, must-revalidate');
        }

        return view('frontend.property.index', $information);
    }

    public function details($slug)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $information['language'] = $language;

        $information['bgImg'] = $misc->getBreadcrumb();
        $information['pageHeading'] = $misc->getPageHeading($language);
        $propertyContent = Content::where('slug', $slug)->firstOrFail();
        $property = Content::query()
            ->where('property_contents.language_id', $language->id)
            ->where('property_contents.property_id', $propertyContent->property_id)
            ->leftJoin('properties', 'property_contents.property_id', 'properties.id')
            ->where([['properties.status', 1], ['properties.approve_status', 1]])
            ->when('properties.vendor_id' != 0, function ($query) {

                $query->leftJoin('memberships', 'properties.vendor_id', '=', 'memberships.vendor_id')
                    ->where(function ($query) {
                        $query->where([
                            ['memberships.status', '=', 1],
                            ['memberships.start_date', '<=', now()->format('Y-m-d')],
                            ['memberships.expire_date', '>=', now()->format('Y-m-d')],
                        ])->orWhere('properties.vendor_id', '=', 0);
                    });
            })
            ->when('properties.vendor_id' != 0, function ($query) {
                return $query->leftJoin('vendors', 'properties.vendor_id', '=', 'vendors.id')
                    ->where(function ($query) {
                        $query->where('vendors.status', '=', 1)->orWhere('properties.vendor_id', '=', 0);
                    });
            })

            ->with(['propertySpacifications', 'galleryImages'])
            ->select('properties.*', 'property_contents.*', 'properties.id as propertyId', 'property_contents.id as contentId')->firstOrFail();


        $information['propertyContent'] = $property;
        $information['sliders'] =  $property->galleryImages;
        $information['amenities'] = PropertyAmenity::with(['amenityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->where('property_id', $property->property_id)->get();
        $information['agent'] = Agent::with(['agent_info' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->find($property->agent_id);


        $information['vendor'] = Vendor::with(['vendor_info' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->find($property->vendor_id);

        $information['admin']  = Admin::where('role_id', null)->first();


        $categories = PropertyCategory::where('status', 1)->with(['categoryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $categories->map(function ($category) {
            $category['propertiesCount'] = $category->properties()->where([['status', 1], ['approve_status', 1]])->count();
        });
        $information['categories'] = $categories;


        $information['relatedProperty'] = Property::where([['properties.status', 1], ['properties.approve_status', 1]])->leftJoin('property_contents', 'properties.id', 'property_contents.property_id')
            ->leftJoin('vendors', 'properties.vendor_id', '=', 'vendors.id')
            ->leftJoin('memberships', function ($join) {
                $join->on('properties.vendor_id', '=', 'memberships.vendor_id')
                    ->where('memberships.status', '=', 1)
                    ->where('memberships.start_date', '<=', Carbon::now()->format('Y-m-d'))
                    ->where('memberships.expire_date', '>=', Carbon::now()->format('Y-m-d'));
            })
            ->where(function ($query) {
                $query->where('properties.vendor_id', '=', 0)
                    ->orWhere(function ($query) {
                        $query->where([
                            ['vendors.status', '=', 1],

                        ]);
                    });
            })->where([['properties.id', '!=', $property->property_id], ['properties.category_id', $property->category_id]])
            ->where('property_contents.language_id', $language->id)->latest('properties.created_at')
            ->select('properties.*', 'property_contents.title', 'property_contents.slug', 'property_contents.address', 'property_contents.language_id')
            ->take(5)->get();
        $information['info'] = Basic::select('google_recaptcha_status')->first();
        return view('frontend.property.details', $information);
    }

    public function contact(Request $request)
    {
        $rules = [
            'name' => 'required',
            'email' => 'required|email:rfc,dns',
            'phone' => 'required|numeric',
            'message' => 'required'
        ];
        $info = Basic::select('google_recaptcha_status')->first();
        if ($info->google_recaptcha_status == 1) {
            $rules['g-recaptcha-response'] = 'required|captcha';
        }

        $messages = [];

        if ($info->google_recaptcha_status == 1) {
            $messages['g-recaptcha-response.required'] = 'Please verify that you are not a robot.';
            $messages['g-recaptcha-response.captcha'] = 'Captcha error! try again later or contact site admin.';
        }

        $validator = Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors())->withInput();
        }
        if ($request->vendor_id != 0) {

            if ($request->vendor_id) {
                $vendor = Vendor::find($request->vendor_id);

                if (empty($vendor)) {

                    return back()->with('error', 'Something went wrong!');
                }
                $request['to_mail'] = $vendor->email;
            }
            if ($request->agent_id) {
                $agent = Agent::find($request->agent_id);
                if (empty($agent)) {
                    return back()->with('error', 'Something went wrong!');
                }
                $request['to_mail'] = $agent->email;
            }
        } elseif ($request->vendor_id == 0 && !empty($request->agent_id)) {
            $agent = Agent::find($request->agent_id);
            if (empty($agent)) {
                return back()->with('error', 'Something went wrong!');
            }
            $request['to_mail'] = $agent->email;
        } else {

            $admin = Admin::where('role_id', null)->first();
            $request['to_mail'] = $admin->email;
        }

        try {
            PropertyContact::create([
                'vendor_id' => $request->vendor_id,
                'agent_id' => $request->agent_id,
                'property_id' => $request->property_id,
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'message' => $request->message,

            ]);
            $this->sendMail($request);
        } catch (\Exception $e) {
            return back()->with('error', 'Something went wrong!');
        }



        return back()->with('success', 'Message sent successfully');
    }
    public function contactUser(Request $request)
    {

        $rules = [
            'name' => 'required',
            'email' => 'required|email:rfc,dns',
            'phone' => 'required|numeric',
            'message' => 'required'
        ];
        $info = Basic::select('google_recaptcha_status')->first();
        if ($info->google_recaptcha_status == 1) {
            $rules['g-recaptcha-response'] = 'required|captcha';
        }

        $messages = [];

        if ($info->google_recaptcha_status == 1) {
            $messages['g-recaptcha-response.required'] = 'Please verify that you are not a robot.';
            $messages['g-recaptcha-response.captcha'] = 'Captcha error! try again later or contact site admin.';
        }

        $validator = Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors())->withInput();
        }
        if ($request->vendor_id != 0) {

            if ($request->vendor_id) {
                $vendor = Vendor::find($request->vendor_id);

                if (empty($vendor)) {

                    return back()->with('error', 'Something went wrong!');
                }
                $request['to_mail'] = $vendor->email;
            }
        } else {
            $admin = Admin::where('role_id', null)->first();
            $request['to_mail'] = $admin->email;
        }
        if (!empty($request->agent_id)) {
            $agent = Agent::find($request->agent_id);
            if (empty($agent)) {
                return back()->with('error', 'Something went wrong!');
            }
            $request['to_mail'] = $agent->email;
        }

        try {
            $this->sendMail($request);
        } catch (\Exception $e) {
            return back()->with('error', 'Something went wrong!');
        }



        return back()->with('success', 'Message sent successfully');
    }
    public function sendMail($request)
    {
 
        $info = DB::table('basic_settings')
            ->select('website_title', 'smtp_status', 'smtp_host', 'smtp_port', 'encryption', 'smtp_username', 'smtp_password', 'from_mail', 'from_name', 'to_mail')
            ->first();
        $name = $request->name;
        $to = $request->to_mail;
      
        $subject = 'Contact for property';

        $message = '<p>A new message has been sent.<br/><strong>Client Name: </strong>' . $name . '<br/><strong>Client Mail: </strong>' . $request->email . '<br/><strong>Client Phone: </strong>' . $request->phone . '</p><p>Message : ' . $request->message . '</p>';

        if ($info->smtp_status == 1) {
            try {
                $smtp = [
                    'transport' => 'smtp',
                    'host' => $info->smtp_host,
                    'port' => $info->smtp_port,
                    'encryption' => $info->encryption,
                    'username' => $info->smtp_username,
                    'password' => $info->smtp_password,
                    'timeout' => null,
                    'auth_mode' => null,
                ];
                Config::set('mail.mailers.smtp', $smtp);
            } catch (\Exception $e) {
                Session::flash('error', $e->getMessage());

                return;
            }
        }
        $data = [
            'to' => $to,
            'subject' => $subject,
            'message' => $message,
        ];
        try {
            Mail::send([], [], function (Message $message) use ($data, $info) {
                $fromMail = $info->from_mail;
                $fromName = $info->from_name;
                $message->to($data['to'])
                    ->subject($data['subject'])
                    ->from($fromMail, $fromName)
                    ->html($data['message'], 'text/html');
            });
        } catch (\Exception $e) {
            Session::flash('error', 'Something went wrong.');
            return;
        }
    }

    public function getStateCities(Request $request)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $states = State::where('country_id', $request->id)->with(['cities', 'stateContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $cities = City::where('country_id', $request->id)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        return Response::json(['states' => $states, 'cities' => $cities], 200);
    }

    public function getCities(Request $request)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $cities = City::where('state_id', $request->state_id)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        return Response::json(['cities' => $cities], 200);
    }

    public function getCategories(Request $request)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        if ($request->type != 'all') {
            $categories = PropertyCategory::where([['type', $request->type], ['status', 1]])->with(['categoryContent' => function ($q) use ($language) {
                $q->where('language_id', $language->id);
            }])->get();
        } else {
            $categories = PropertyCategory::where('status', 1)->with(['categoryContent' => function ($q) use ($language) {
                $q->where('language_id', $language->id);
            }])->get();
        }

        return Response::json(['categories' => $categories], 200);
    }
}
