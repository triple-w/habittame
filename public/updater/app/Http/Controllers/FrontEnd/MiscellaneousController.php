<?php

namespace App\Http\Controllers\FrontEnd;

use App\Models\Language;
use App\Models\Subscriber;
use Illuminate\Http\Request;
use App\Models\Advertisement;
use Illuminate\Validation\Rule;
use App\Models\BasicSettings\Basic;
use Illuminate\Support\Facades\URL;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class MiscellaneousController extends Controller
{
  public function getLanguage()
  {
    // get the current locale of this system
    if (Session::has('currentLocaleCode')) {
      $locale = Session::get('currentLocaleCode');
    }

    if (empty($locale)) {
      $language = Language::where('is_default', 1)->first();
    } else {
      $language = Language::where('code', $locale)->first();
      if (empty($language)) {
        $language = Language::where('is_default', 1)->first();
      }
    }


    return $language;
  }


  public function storeSubscriber(Request $request)
  {
    if ($request->email_id == null) {
      session()->flash('error', 'Email address is required.');
      return redirect()->back();
    }

    if (Subscriber::where('email_id', $request->email_id)->exists()) {
      session()->flash('error', 'You have already subscribed to our newsletter');
      return redirect()->back();
    }


    Subscriber::create([
      'email_id' => $request->email_id
    ]);

    session()->flash('success', 'You have successfully subscribed to our newsletter');
    return redirect()->back();
  }


  public function changeLanguage(Request $request)
  {
    // put the selected language in session
    $langCode = $request['lang_code'];

    $request->session()->put('currentLocaleCode', $langCode);

    return redirect()->back();
  }

  public function getPageHeading($language)
  {
    if (URL::current() == Route::is('frontend.properties')) {
      $pageHeading = $language->pageName()->select('property_page_title')->first();
    } elseif (URL::current() == Route::is('frontend.projects')) {
      $pageHeading = $language->pageName()->select('project_page_title')->first();
    } elseif (URL::current() == Route::is('frontend.agent.details')) {
      $pageHeading = $language->pageName()->select('agent_page_title')->first();
    } elseif (URL::current() == Route::is('agent.login')) {
      $pageHeading = $language->pageName()->select('agent_login_page_title')->first();
    } elseif (URL::current() == Route::is('frontend.vendors')) {
      $pageHeading = $language->pageName()->select('vendor_page_title')->first();
    } elseif (URL::current() == Route::is('pricing')) {
      $pageHeading = $language->pageName()->select('pricing_page_title')->first();
    } elseif (URL::current() == Route::is('user.login')) {
      $pageHeading = $language->pageName()->select('login_page_title')->first();
    } elseif (URL::current() == Route::is('user.signup')) {
      $pageHeading = $language->pageName()->select('signup_page_title')->first();
    } elseif (URL::current() == Route::is('about_us')) {
      $pageHeading = $language->pageName()->select('about_us_title')->first();
    } elseif (URL::current() == Route::is('blog')) {
      $pageHeading = $language->pageName()->select('blog_page_title')->first();
    } elseif (URL::current() == Route::is('faq')) {
      $pageHeading = $language->pageName()->select('faq_page_title')->first();
    } elseif (URL::current() == Route::is('contact')) {
      $pageHeading = $language->pageName()->select('contact_page_title')->first();
    } elseif (URL::current() == Route::is('vendor.login')) {
      $pageHeading = $language->pageName()->select('vendor_login_page_title')->first();
    } elseif (URL::current() == Route::is('vendor.signup')) {
      $pageHeading = $language->pageName()->select('vendor_signup_page_title')->first();
    } elseif (URL::current() == Route::is('user.forget_password')) {
      $pageHeading = $language->pageName()->select('forget_password_page_title')->first();
    } elseif (URL::current() == Route::is('vendor.forget.password')) {
      $pageHeading = $language->pageName()->select('vendor_forget_password_page_title')->first();
    } elseif (URL::current() == Route::is('user.wishlist')) {
      $pageHeading = $language->pageName()->select('wishlist_page_title')->first();
    } elseif (URL::current() == Route::is('user.dashboard')) {
      $pageHeading = $language->pageName()->select('dashboard_page_title')->first();
    } elseif (URL::current() == Route::is('user.order.index')) {
      $pageHeading = $language->pageName()->select('orders_page_title')->first();
    } elseif (URL::current() == Route::is('user.support_ticket')) {
      $pageHeading = $language->pageName()->select('support_ticket_page_title')->first();
    } elseif (URL::current() == Route::is('user.support_ticket.create')) {
      $pageHeading = $language->pageName()->select('support_ticket_create_page_title')->first();
    } elseif (URL::current() == Route::is('user.change_password')) {
      $pageHeading = $language->pageName()->select('change_password_page_title')->first();
    } elseif (URL::current() == Route::is('user.edit_profile')) {
      $pageHeading = $language->pageName()->select('edit_profile_page_title')->first();
    } else {
      $pageHeading = null;
    }


    return $pageHeading;
  }


  public static function getBreadcrumb()
  {
    $breadcrumb = Basic::select('breadcrumb')->first();

    return $breadcrumb;
  }


  public function countAdView($id)
  {
    try {
      $ad = Advertisement::findOrFail($id);

      $ad->update([
        'views' => $ad->views + 1
      ]);

      return response()->json(['success' => 'Advertisement view counted successfully.']);
    } catch (ModelNotFoundException $e) {
      return response()->json(['error' => 'Sorry, something went wrong!']);
    }
  }


  public function serviceUnavailable()
  {
    $info = Basic::select('maintenance_img', 'maintenance_msg')->first();

    return view('errors.503', compact('info'));
  }
}
