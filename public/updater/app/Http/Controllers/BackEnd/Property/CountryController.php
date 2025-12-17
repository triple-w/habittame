<?php

namespace App\Http\Controllers\BackEnd\Property;

use DB;
use Response;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Models\Property\State;
use App\Models\Property\Country;
use App\Http\Controllers\Controller;
use App\Models\Property\CountryContent;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class CountryController extends Controller
{
  public function index(Request $request)
  {
    // first, get the language info from db
    $information['languages'] = Language::all();
    if ($request->has('language')) {
      $language = Language::where('code', $request->language)->firstOrFail();
    } else {

      $language = Language::where('is_default', 1)->first();
    }
    $information['language'] = $language;
    $information['countries'] = Country::with(['countryContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->orderByDesc('id')->get();
    // also, get all the languages from db
    $information['langs'] = Language::all();

    return view('backend.property.country.index', $information);
  }

  public function store(Request $request)
  {

    $languages = Language::all();
    $rules = [];
    $message = [];
    foreach ($languages as $lan) {
      $rules[$lan->code . '_name'] = 'required';
      $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
    }

    $validator = Validator::make($request->all(), $rules, $message);
    if ($validator->fails()) {
      return Response::json([
        'errors' => $validator->getMessageBag()->toArray()
      ], 400);
    }
    DB::beginTransaction();
    try {

      $country =  Country::create();
      foreach ($languages as $lan) {
        CountryContent::create([
          'name' => $request[$lan->code . '_name'],
          'country_id' => $country->id,
          'language_id' => $lan->id,
        ]);
      }
      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'Something went wrong!');
      return Response::json(['status' => 'success'], 200);
    }
    Session::flash('success', 'Country added successfully!');
    return Response::json(['status' => 'success'], 200);
  }

  public function update(Request $request)
  {
    $languages = Language::all();
    $rules = [];
    $message = [];
    foreach ($languages as $lan) {
      $rules[$lan->code . '_name'] = 'required';
      $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
    }

    $validator = Validator::make($request->all(), $rules, $message);
    if ($validator->fails()) {
      return Response::json([
        'errors' => $validator->getMessageBag()->toArray()
      ], 400);
    }

    foreach ($languages as $lan) {

      $name = $request[$lan->code . '_name'] ?? null;

      if (!empty($name)) {
        $countryContent = CountryContent::where([['country_id', $request->id], ['language_id', $lan->id]])->first();
        if (empty($countryContent)) {
          $countryContent  = new  CountryContent();
          $countryContent->country_id = $request->id;
          $countryContent->language_id = $lan->id;
          $countryContent->save();
        }

        $countryContent->update([
          'name' => $name
        ]);
      }
    }

    Session::flash('success', 'Country update successfully!');
    return Response::json(['status' => 'success'], 200);
  }


  public function destroy(Request $request)
  {
    $country = Country::find($request->id);
    $delete = true;
    $properties = $country->properties()->get();
    $cities = $country->cities()->get();
    $states = $country->states()->get();
    if (count($properties) || count($cities) || count($states) >  0) {
      $delete = false;
    }
    if ($delete) {

      $country->delete();
      $country->countryContents()->delete();
    } else {
      return redirect()->back()->with('warning', 'First, please delete states, cities & properties under this country.');
    }


    return redirect()->back()->with('success', 'Country deleted successfully!');
  }

  public function bulkDestroy(Request $request)
  {

    $ids = $request->ids;
    DB::beginTransaction();

    try {
      foreach ($ids as $id) {;
        $country = Country::find($id);
        $delete = true;
        $properties = $country->properties()->get();
        $cities = $country->cities()->get();
        $states = $country->states()->get();
        if (count($properties) || count($cities) || count($states) >  0) {
          $delete = false;
        }

        if ($delete) {
          $country->delete();
          $country->countryContents()->delete();
        } else {
          Session::flash('warning', 'First, please delete states, cities & properties under this country.');

          return Response::json(['status' => 'success'], 200);
        }
      }
      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'First, please delete states, cities & properties under this country.');
      return Response::json(['status' => 'success'], 200);
    }

    Session::flash('success', 'Countries deleted successfully!');

    return Response::json(['status' => 'success'], 200);
  }
}
