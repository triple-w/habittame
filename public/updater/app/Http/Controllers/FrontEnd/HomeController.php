<?php

namespace App\Http\Controllers\FrontEnd;

use Session;
use Carbon\Carbon;
use App\Models\Vendor;
use App\Models\Package;
use App\Models\Journal\Blog;
use Illuminate\Http\Request;
use App\Models\Property\City;
use App\Models\CounterSection;
use App\Models\Property\State;
use App\Models\HomePage\Banner;
use App\Models\Project\Project;
use App\Models\HomePage\Partner;
use App\Models\HomePage\Section;
use App\Models\Property\Country;
use App\Models\Property\Property;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use App\Models\HomePage\CitySection;
use App\Models\HomePage\WhyChooseUs;
use App\Models\HomePage\AboutSection;
use App\Models\HomePage\BrandSection;
use App\Models\HomePage\VendorSection;
use App\Models\HomePage\ProjectSection;
use App\Models\HomePage\CategorySection;
use App\Models\HomePage\PropertySection;
use App\Models\Prominence\FeatureSection;
use App\Models\Property\FeaturedProperty;
use App\Models\Property\PropertyCategory;
use App\Http\Controllers\FrontEnd\MiscellaneousController;

class HomeController extends Controller
{

  public function index(Request $request)
  {
    $themeVersion = Basic::query()->pluck('theme_version')->first();

    $secInfo = Section::query()->first();

    $misc = new MiscellaneousController();

    $language = $misc->getLanguage();

    $queryResult['language'] = $language;

    $queryResult['seoInfo'] = $language->seoInfo()->select('meta_keyword_home', 'meta_description_home')->first();

    if ($secInfo->counter_section_status == 1) {
      $queryResult['counterSectionImage'] = Basic::query()->pluck('counter_section_image')->first();
      $queryResult['counterSectionInfo'] = CounterSection::where('language_id', $language->id)->first();
      $queryResult['counters'] = $language->counterInfo()->orderByDesc('id')->get();
    }

    $queryResult['currencyInfo'] = $this->getCurrencyInfo();

    $queryResult['secInfo'] = $secInfo;


    // for real estate query

    if ($themeVersion == 2) {
      $queryResult['sliderInfos'] = $language->sliderInfo()->orderByDesc('id')->get();
      $queryResult['packages'] = Package::where([['status', 1], ['is_featured', 1]])->get();
      $queryResult['pricingSecInfo'] = $language->pricingSection()->first();
    }

    if ($themeVersion != 2) {
      $queryResult['heroStatic'] = $language->heroStatic()->first();
      $queryResult['heroImg'] = Basic::query()->pluck('hero_static_img')->first();
    }

    if ($secInfo->property_section_status == 1) {
      $queryResult['propertySecInfo'] = PropertySection::where('language_id', $language->id)->first();
    }


    if ($themeVersion != 3) {
      $queryResult['featuredSecInfo'] = FeatureSection::where('language_id', $language->id)->first();
    }
    if ($themeVersion == 2 || $themeVersion == 3) {
      $queryResult['catgorySecInfo'] = CategorySection::where('language_id', $language->id)->first();
    }
    if ($themeVersion == 1) {
      $queryResult['citySecInfo'] = CitySection::where('language_id', $language->id)->first();
    }

    if ($secInfo->testimonial_section_status == 1) {
      $queryResult['testimonialSecInfo'] = $language->testimonialSection()->first();
      $queryResult['testimonials'] = $language->testimonial()->orderByDesc('id')->get();
      $queryResult['testimonialSecImage'] = Basic::query()->pluck('testimonial_section_image')->first();
    }

    if ($themeVersion == 2 && $secInfo->call_to_action_section_status == 1) {
      $queryResult['callToActionSectionImage'] = Basic::query()->pluck('call_to_action_section_image')->first();
      $queryResult['callToActionSecInfo'] = $language->callToActionSection()->first();
    }

    if ($themeVersion == 1 && $secInfo->subscribe_section_status == 1) {
      $queryResult['subscribeSectionImage'] = Basic::query()->pluck('subscribe_section_img')->first();
      $queryResult['subscribeSecInfo'] = $language->subscribeSection()->first();
    }

    if ($secInfo->work_process_section_status == 1 && ($themeVersion == 2 || $themeVersion == 3)) {
      $queryResult['workProcessSecInfo'] = $language->workProcessSection()->first();
      $queryResult['processes'] = $language->workProcess()->orderBy('serial_number', 'asc')->get();
    }

    $proeprty_categories = PropertyCategory::where([['status', 1], ['featured', 1]])->with(['categoryContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->orderBy('serial_number', 'asc')->get();

    $all_proeprty_categories = PropertyCategory::where('status', 1)->with(['categoryContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->orderBy('serial_number', 'asc')->get();

    $queryResult['all_cities'] = City::where('status', 1)->with(['cityContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->get();
    $queryResult['all_states'] = State::with(['stateContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->get();
    $queryResult['all_countries'] = Country::with(['countryContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->get();
    $queryResult['property_categories'] = $proeprty_categories;
    $queryResult['all_proeprty_categories'] = $all_proeprty_categories;

    $properties = Property::where([['properties.status', 1], ['properties.approve_status', 1]])
      ->where('property_contents.language_id', $language->id)
      ->join('property_contents', 'property_contents.property_id', 'properties.id')
      ->join('property_categories', 'property_categories.id', 'properties.category_id')
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
      ->select('properties.*', 'property_contents.language_id', 'property_contents.slug', 'property_contents.title', 'property_contents.address', 'property_contents.language_id')->latest()->take(8)->get();

    $queryResult['properties'] = $properties;
    $timezone = Basic::pluck('timezone')->first();


    $queryResult['featured_properties'] = Property::where([['properties.status', 1], ['properties.approve_status', 1]])->leftJoin('featured_properties', 'featured_properties.property_id', 'properties.id')
      ->leftJoin('property_contents', 'property_contents.property_id', 'properties.id')
      ->leftJoin('property_categories', 'property_categories.id', 'properties.category_id')
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
      ->where([
        ['featured_properties.status', 1],
        ['featured_properties.start_date', '<=', Carbon::now()->timezone($timezone)->format('Y-m-d H:i:s')],
        ['featured_properties.end_date', '>=', Carbon::now()->timezone($timezone)->format('Y-m-d H:i:s')],
      ])
      ->where('property_contents.language_id', $language->id)
      ->select(
        'properties.*',
        'featured_properties.id as featured_id',
        'property_contents.slug',
        'property_contents.title',
        'property_contents.address',
        'property_contents.language_id'
      )
      ->inRandomOrder()
      ->take(10)
      ->get();

    if ($themeVersion == 3 && $secInfo->project_section_status == 1) {

      $queryResult['projects'] = Project::where('projects.approve_status', 1)->leftJoin('project_contents', 'project_contents.project_id', 'projects.id')
        ->when('projects.vendor_id' != 0, function ($query) {

          $query->leftJoin('memberships', 'projects.vendor_id', '=', 'memberships.vendor_id')
            ->where(function ($query) {
              $query->where([
                ['memberships.status', '=', 1],
                ['memberships.start_date', '<=', now()->format('Y-m-d')],
                ['memberships.expire_date', '>=', now()->format('Y-m-d')],
              ])->orWhere('projects.vendor_id', '=', 0);
            });
        })
        ->when('projects.vendor_id' != 0, function ($query) {
          return $query->leftJoin('vendors', 'projects.vendor_id', '=', 'vendors.id')
            ->where(function ($query) {
              $query->where('vendors.status', '=', 1)->orWhere('projects.vendor_id', '=', 0);
            });
        })
        ->where('projects.featured', 1)
        ->where('project_contents.language_id', $language->id)
        ->select('projects.*', 'project_contents.slug', 'project_contents.title', 'project_contents.address')->inRandomOrder()->latest()->take(8)->get();
      $queryResult['projectInfo'] =  ProjectSection::where('language_id', $language->id)->first();
    }

    $queryResult['aboutImg'] = Basic::query()->select('about_section_image1', 'about_section_image2', 'about_section_video_link')->first();
    $queryResult['aboutInfo'] =  AboutSection::where('language_id', $language->id)->first();

    if ($themeVersion == 1 && $secInfo->vendor_section_status == 1) {

      $queryResult['vendorInfo'] =  VendorSection::where('language_id', $language->id)->first();

      $queryResult['vendors'] = Vendor::join('memberships', 'memberships.vendor_id', 'vendors.id')
        ->where([
          ['memberships.status', 1],
          ['memberships.start_date', '<=', Carbon::now()->format('Y-m-d')],
          ['memberships.expire_date', '>=', Carbon::now()->format('Y-m-d')],
        ])->where([['vendors.status', 1], ['vendors.id', '!=', 0]])
        ->with(['properties' => function ($q) {
          $q->where([['approve_status', 1], ['status', 1]]);
        }, 'projects' => function ($q) {
          $q->where('approve_status', 1);
        }, 'agents'])
        ->select('vendors.*')->inRandomOrder()->take(5)->get();
    }

    if ($themeVersion == 1 && $secInfo->why_choose_us_section_status == 1) {
      $queryResult['whyChooseUsImg'] = Basic::query()->select('why_choose_us_section_img1', 'why_choose_us_section_img2', 'why_choose_us_section_video_link')->first();
      $queryResult['whyChooseUsInfo'] =  WhyChooseUs::where('language_id', $language->id)->first();
    }


    if ($themeVersion == 1 && $secInfo->cities_section_status == 1) {
      $cities =  City::where([['status', 1], ['featured', 1]])->limit(6)->orderBy('serial_number', 'asc')->get();
      $cities->map(function ($city) use ($language) {
        $city['propertyCount'] = $city->properties()->count();
        $city['name'] = @$city->getContent($language->id)->name;
        $city['slug'] = @$city->getContent($language->id)->slug;
      });

      $queryResult['cities'] =  $cities;
    }

    if (($themeVersion == 2 || $themeVersion == 3) && $secInfo->brand_section_status == 1) {
      $queryResult['brands'] = BrandSection::get();
    }
    $min =  Property::where([['status', 1], ['approve_status', 1]])->min('price');
    $max = Property::where([['status', 1], ['approve_status', 1]])->max('price');
    $queryResult['min'] = intval($min);
    $queryResult['max'] = intval($max);


    if ($themeVersion == 1) {
      return view('frontend.home.index-v1', $queryResult);
    } elseif ($themeVersion == 2) {
      return view('frontend.home.index-v2', $queryResult);
    } elseif ($themeVersion == 3) {
      return view('frontend.home.index-v3', $queryResult);
    }
  }


  //about
  public function about()
  {
    $misc = new MiscellaneousController();

    $language = $misc->getLanguage();

    $queryResult['seoInfo'] = $language->seoInfo()->select('meta_keywords_about_page', 'meta_description_about_page')->first();

    $queryResult['pageHeading'] = $misc->getPageHeading($language);

    $queryResult['bgImg'] = $misc->getBreadcrumb();
    $secInfo = Section::query()->first();
    $queryResult['secInfo'] = $secInfo;


    if ($secInfo->about_section_status == 1) {
      $queryResult['aboutImg'] = Basic::query()->select('about_section_image1', 'about_section_image2', 'about_section_video_link')->first();
      $queryResult['aboutInfo'] =  AboutSection::where('language_id', $language->id)->first();
    }
    if ($secInfo->property_section_status == 1) {
      $queryResult['whyChooseUsImg'] = Basic::query()->select('why_choose_us_section_img1', 'why_choose_us_section_img2', 'why_choose_us_section_video_link')->first();
      $queryResult['whyChooseUsInfo'] =  WhyChooseUs::where('language_id', $language->id)->first();
    }

    if ($secInfo->work_process_section_status == 1) {
      $queryResult['workProcessSecInfo'] = $language->workProcessSection()->first();
      $queryResult['processes'] = $language->workProcess()->orderBy('serial_number', 'asc')->get();
    }


    if ($secInfo->testimonial_section_status == 1) {
      $queryResult['testimonialSecInfo'] = $language->testimonialSection()->first();
      $queryResult['testimonials'] = $language->testimonial()->orderByDesc('id')->get();
      $queryResult['testimonialSecImage'] = Basic::query()->pluck('testimonial_section_image')->first();
    }

    return view('frontend.about', $queryResult);
  }
  public function pricing()
  {
    $misc = new MiscellaneousController();

    $language = $misc->getLanguage();

    $queryResult['seoInfo'] = $language->seoInfo()->select('meta_keywords_pricing_page', 'meta_description_pricing_page')->first();

    $queryResult['pageHeading'] = $misc->getPageHeading($language);

    $queryResult['bgImg'] = $misc->getBreadcrumb();
    $queryResult['packages'] = Package::where('status', 1)->get();
    return view('frontend.pricing', $queryResult);
  }
  //offline
  public function offline()
  {
    return view('frontend.offline');
  }
}
