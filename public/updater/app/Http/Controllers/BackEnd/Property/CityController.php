<?php

namespace App\Http\Controllers\BackEnd\Property;

use App\Models\Language;
use Illuminate\Http\Request;
use App\Models\Property\City;
use App\Models\Property\State;
use App\Http\Helpers\UploadFile;
use App\Models\Property\Country;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Property\CityContent;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\Property\Citycreate;

class CityController extends Controller
{
  public function index(Request $request)
  {
    // first, get the language info from db
    if ($request->has('language')) {
      $language = Language::where('code', $request->language)->firstOrFail();
    } else {

      $language = Language::where('is_default', 1)->first();
    }
    $information['language'] = $language;
    $information['countries'] = Country::with(['countryContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->orderByDesc('id')->get();

    $information['states'] = State::with(['stateContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->orderByDesc('id')->get();

    $information['cities'] = City::query()
      ->join('property_city_contents', 'property_cities.id', 'property_city_contents.city_id')
      ->where('property_city_contents.language_id', $language->id)
      ->orderBy('property_cities.created_at', 'desc')
      ->select('property_cities.*', 'property_city_contents.name')
      ->get();



    // also, get all the languages from db
    $information['langs'] = Language::all();

    return view('backend.property.city.index', $information);
  }

  public function getCities(Request $request)
  {
    $language = Language::where('is_default', 1)->first();
    $cities = City::where('state_id', $request->state_id)->with(['cityContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->get();
    return Response::json(['cities' => $cities], 200);
  }

  public function store(Citycreate $request)
  {
    $languages = Language::all();
    $img = $request->file('image');

    if ($request->hasFile('image')) {
      $filename = UploadFile::store(public_path('assets/img/property-city/'), $img);
    }
    DB::beginTransaction();

    try {

      if ($request->has('state') && $request->has('country')) {

        $state = State::findOrFail($request->state);
        $city =  City::create([
          'country_id' => $state->country->id ?? null,
          'state_id' => $state->id,
          'image' => $filename,
          'status' => $request->status,
          'serial_number' => $request->serial_number
        ]);
      } elseif ($request->has('country')) {

        $country = Country::findOrFail($request->country);
        $city =  City::create([
          'country_id' => $country->id,
          'state_id' => null,
          'image' => $filename,
          'status' => $request->status,
          'serial_number' => $request->serial_number
        ]);
      } elseif ($request->has('state')) {

        $state = State::findOrFail($request->state);
        $city =  City::create([
          'country_id' => null,
          'state_id' => $state->id,
          'image' => $filename,
          'status' => $request->status,
          'serial_number' => $request->serial_number
        ]);
      } else {
        $city =  City::create([
          'country_id' => null,
          'state_id' => null,
          'image' => $filename,
          'status' => $request->status,
          'serial_number' => $request->serial_number
        ]);
      }

      foreach ($languages as $lang) {

        CityContent::create([
          'name' => $request[$lang->code . '_name'],
          'slug' => createSlug($request[$lang->code . '_name']),
          'language_id' => $lang->id,
          'city_id' => $city->id,
        ]);
      }
      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'Something went wrong!');
      return Response::json(['status' => 'success'], 200);
    }
    Session::flash('success', 'New City added successfully!');

    return Response::json(['status' => 'success'], 200);
  }

  public function update(Request $request)
  {
    $languages = Language::all();
    $rules = [

      'status' => 'required|numeric',
      'serial_number' => 'required|numeric'
    ];
    if ($request->hasFile('image')) {
      $rules['image'] = "nullable|mimes:jpg,jpeg,svg,png,webp";
    }

    $message = [];
    foreach ($languages as $lan) {
      $rules[$lan->code . '_name'] = 'required';
      $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
    }

    $validator = Validator::make($request->all(), $rules);

    if ($validator->fails()) {
      return Response::json([
        'errors' => $validator->getMessageBag()
      ], 400);
    }

    DB::beginTransaction();
    try {
      $city = City::find($request->id);
      $filename = $city->image;
      if ($request->hasFile('image')) {
        $filename = UploadFile::update(public_path('assets/img/property-city/'), $request->file('image'), $city->image);
      }

      $city->update([
        'image' => $filename,
        'status' => $request->status,
        'serial_number' => $request->serial_number
      ]);

      foreach ($languages as $lan) {
        $name = $request[$lan->code . '_name'] ?? null;

        if (!empty($name)) {
          $content = CityContent::where([['city_id', $request->id], ['language_id', $lan->id]])->first();

          if (empty($content)) {
            $content  = new  CityContent();
            $content->city_id = $request->id;
            $content->language_id = $lan->id;
            $content->save();
          }
          $content->update([
            'name' => $name,
            'slug' => createSlug($request->name),
          ]);
        }
      }

      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'Something went wrong!');
      return Response::json(['status' => 'success'], 200);
    }

    Session::flash('success', 'Property category updated successfully!');

    return Response::json(['status' => 'success'], 200);
  }

  public function updateFeatured(Request $request)
  {
    $city = City::findOrFail($request->cityId);

    if ($request->featured == 1) {
      $city->update(['featured' => 1]);

      Session::flash('success', 'City featured successfully!');
    } else {
      $city->update(['featured' => 0]);

      Session::flash('success', 'City Unfeatured successfully!');
    }

    return redirect()->back();
  }



  public function destroy(Request $request)
  {
    $city = City::find($request->id);
    $delete = true;
    $propertyContents = $city->properties()->count();
    if ($propertyContents >  0) {
      $delete = false;
    }

    if ($delete) {
      @unlink(public_path('assets/img/property-city/') . $city->image);

      $city->cityContents()->delete();
      $city->delete();
    } else {
      return redirect()->back()->with('warning', 'First, please delete properties under this city.');
    }


    return redirect()->back()->with('success', 'City deleted successfully!');
  }


  public function bulkDestroy(Request $request)
  {
    $ids = $request->ids;
    DB::beginTransaction();

    try {
      foreach ($ids as $id) {
        $city = City::find($id);
        $delete = true;
        $properties = $city->properties()->count();
        if ($properties >  0) {
          $delete = false;
        }
        if ($delete) {
          @unlink(public_path('assets/img/property-city/') . $city->image);
          $city->cityContents()->delete();
          $city->delete();
        } else {
          Session::flash('warning', 'First, please delete properties under this city.');
          return Response::json(['status' => 'success'], 200);
        }
      }
      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'First, please delete properties under this city.');
      return Response::json(['status' => 'success'], 200);
    }

    Session::flash('success', 'Cities deleted successfully!');

    return Response::json(['status' => 'success'], 200);
  }
}
