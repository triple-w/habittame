<?php

namespace App\Providers;

use App\Models\Language;
use App\Models\Project\Project;
use App\Models\HomePage\Section;
use App\Models\Property\Content;
use App\Models\Property\Property;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\ServiceProvider;
use App\Models\BasicSettings\SocialMedia;
use App\Http\Helpers\VendorPermissionHelper;

class AppServiceProvider extends ServiceProvider
{
  /**
   * Register any application services.
   *
   * @return void
   */
  public function register()
  {
    //
  }

  /**
   * Bootstrap any application services.
   *
   * @return void
   */
  public function boot()
  {
    Paginator::useBootstrap();

    if (!app()->runningInConsole()) {

      $data = DB::table('basic_settings')->select('favicon', 'website_title', 'logo', 'base_currency_text', 'base_currency_text_position')->first();


      // send this information to only back-end view files
      View::composer('backend.*', function ($view) {
        if (Auth::guard('admin')->check() == true) {
          $authAdmin = Auth::guard('admin')->user();
          $role = null;

          if (!is_null($authAdmin->role_id)) {
            $role = $authAdmin->role()->first();
          }
        }

        $language = Language::query()->where('is_default', '=', 1)->first();

        $websiteSettings = DB::table('basic_settings')->select('admin_theme_version', 'base_currency_symbol', 'base_currency_symbol_position', 'base_currency_symbol_position', 'property_country_status', 'property_state_status', 'base_currency_text_position', 'base_currency_text', 'base_currency_rate', 'theme_version', 'timezone')->first();

        $footerText = $language->footerContent()->first();

        if (Auth::guard('admin')->check() == true) {
          $view->with('roleInfo', $role);
        }

        $view->with('defaultLang', $language);
        $view->with('settings', $websiteSettings);
        $view->with('footerTextInfo', $footerText);
      });

      // send this information to only back-end view files
      View::composer('vendors.*', function ($view) {

        if (is_null(Session::get('vendor_theme_version'))) {
          Session::put('vendor_theme_version', 'light');
        }

        $language = Language::query()->where('is_default', '=', 1)->first();

        $footerText = $language->footerContent()->first();

        $websiteSettings = DB::table('basic_settings')->select('admin_theme_version', 'base_currency_symbol', 'base_currency_symbol_position', 'base_currency_text', 'property_country_status', 'property_state_status', 'base_currency_text_position', 'base_currency_rate', 'theme_version', 'timezone')->first();


        $dowgraded = VendorPermissionHelper::packagesDowngraded(Auth::guard('vendor')->user()->id);

        $view->with('currentPackage', $dowgraded['userCurrentPackage']);
        $view->with(['proGalImgDown' => $dowgraded['proGalImgDown'], 'proSpeciDown' => $dowgraded['proSpeciDown']]);

        $view->with(['proImgCount' => $dowgraded['proImgCount'], 'proSpeciCount' => $dowgraded['proSpeciCount']]);

        $view->with(['projectImgCount' => $dowgraded['projectImgCount'], 'projectSpeciCount' => $dowgraded['projectSpeciCount']]);
        $view->with(['projectGalImgDown' => $dowgraded['projectGalImgDown'], 'projectSpeciDown' => $dowgraded['projectSpeciDown']]);
        $view->with(['projectTypeDown' => $dowgraded['projectTypeDown'], 'projectTypeCount' => $dowgraded['projectTypeCount']]);

        $view->with('userCurrentPackage', $dowgraded['userCurrentPackage']);
        $view->with('featuresCount', $dowgraded['userFeaturesCount']);

        $view->with('defaultLang', $language);
        $view->with('settings', $websiteSettings);
        $view->with('footerTextInfo', $footerText);
      });
      // send this information to only back-end view files
      View::composer('agent.*', function ($view) {

        if (is_null(Session::get('agent_theme_version'))) {
          Session::put('agent_theme_version', 'light');
        }
        $language = Language::query()->where('is_default', '=', 1)->first();

        $footerText = $language->footerContent()->first();
        $agent = Auth::guard('agent')->user();

        $websiteSettings = DB::table('basic_settings')->select('admin_theme_version', 'base_currency_symbol', 'base_currency_symbol_position', 'base_currency_text', 'base_currency_text_position', 'base_currency_rate', 'property_country_status', 'property_state_status', 'theme_version', 'timezone')->first();
        if ($agent->vendor_id != 0) {

          $dowgraded = VendorPermissionHelper::packagesDowngraded($agent->vendor_id);
          $view->with('currentPackage', $dowgraded['userCurrentPackage']);
          $view->with(['proGalImgDown' => $dowgraded['proGalImgDown'], 'proSpeciDown' => $dowgraded['proSpeciDown']]);

          $view->with(['proImgCount' => $dowgraded['proImgCount'], 'proSpeciCount' => $dowgraded['proSpeciCount']]);

          $view->with(['projectImgCount' => $dowgraded['projectImgCount'], 'projectSpeciCount' => $dowgraded['projectSpeciCount']]);
          $view->with(['projectGalImgDown' => $dowgraded['projectGalImgDown'], 'projectSpeciDown' => $dowgraded['projectSpeciDown']]);
          $view->with(['projectTypeDown' => $dowgraded['projectTypeDown'], 'projectTypeCount' => $dowgraded['projectTypeCount']]);

          $view->with('userCurrentPackage', $dowgraded['userCurrentPackage']);
          $view->with('featuresCount', $dowgraded['userFeaturesCount']);
        } else {
          $view->with('userCurrentPackage', true);
        }
        $view->with('defaultLang', $language);
        $view->with('settings', $websiteSettings);
        $view->with('agent', $agent);
        $view->with('footerTextInfo', $footerText);
      });


      // send this information to only front-end view files
      View::composer('frontend.*', function ($view) {
        // get basic info
        $basicData = DB::table('basic_settings')
          ->select('theme_version', 'footer_logo', 'footer_background_image', 'email_address', 'contact_number', 'address', 'primary_color', 'secondary_color', 'whatsapp_status', 'whatsapp_number', 'whatsapp_header_title', 'whatsapp_popup_status', 'whatsapp_popup_message', 'tawkto_status', 'tawkto_direct_chat_link', 'base_currency_symbol', 'base_currency_symbol_position', 'base_currency_text', 'base_currency_text_position', 'hero_section_video_url', 'preloader_status', 'preloader',  'timezone', 'property_country_status', 'property_state_status',  'theme_version', 'google_login_status', 'facebook_login_status')
          ->first();
        if (!Session::has('theme_version')) {
          Session::put('theme_version', $basicData->theme_version);
        }
        // get all the languages of this system
        $allLanguages = Language::all();

        // get the current locale of this website
        if (Session::has('currentLocaleCode')) {
          $language = Language::query()->where('code', '=', Session::get('currentLocaleCode'))->first();
          if (is_null($language)) {
            $language = Language::query()->where('is_default', '=', 1)->first();
          }
        } else {
          $language = Language::query()->where('is_default', '=', 1)->first();
        }
        app()->setLocale($language->code);
        Session::put('currentLocaleCode', $language->code);
        // get the menus of this website
        $siteMenuInfo = $language->menuInfo;

        $menus = [];
        if (!is_null($siteMenuInfo)) {
          // if the menus are not null, decode the JSON data
          $jsonString = $siteMenuInfo->menus;
          $menus = json_decode($jsonString, true);
        }
        // get all the social medias
        $socialMedias = SocialMedia::query()->orderBy('serial_number', 'asc')->get();
        // get the announcement popups
        $popups = $language->announcementPopup()->where('status', 1)->orderBy('serial_number', 'asc')->get();

        // get the cookie alert info
        $cookieAlert = $language->cookieAlertInfo()->first();

        $footerSectionStatus = Section::query()->pluck('footer_section_status')->first();

        if ($footerSectionStatus == 1) {
          // get the footer info
          $footerData = $language->footerContent()->first();

          // get the quick links of footer
          $quickLinks = $language->footerQuickLink()->orderBy('serial_number', 'asc')->get();
        }

        $view->with([
          'basicInfo' => $basicData,
          'allLanguageInfos' => $allLanguages,
          'currentLanguageInfo' => $language,
          'socialMediaInfos' => $socialMedias,
          'menuDatas' => $menus,
          'popupInfos' => $popups,
          'cookieAlertInfo' => $cookieAlert,
          'footerInfo' => ($footerSectionStatus == 1) ? $footerData : NULL,
          'quickLinkInfos' => ($footerSectionStatus == 1) ? $quickLinks : [],
          'footerSectionStatus' => $footerSectionStatus
        ]);
      });


      // send this information to both front-end & back-end view files
      View::share(['websiteInfo' => $data]);
    }
  }
}
