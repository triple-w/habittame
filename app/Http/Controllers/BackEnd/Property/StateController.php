<?php

namespace App\Http\Controllers\BackEnd\Property;

use Session;
use Validator;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Models\Property\City;
use App\Models\Property\State;
use App\Models\Property\Country;
use Illuminate\Support\Facades\DB;
use App\Models\BasicSettings\Basic;
use App\Http\Controllers\Controller;
use App\Models\Property\StateContent;
use Illuminate\Support\Facades\Response;

class StateController extends Controller
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
    $information['states'] = State::query()
      ->join('property_state_contents', 'property_states.id', 'property_state_contents.state_id')
      ->where('property_state_contents.language_id', $language->id)
      ->orderByDesc('property_states.id')
      ->select('property_states.*', 'property_state_contents.name')
      ->get();
    // also, get all the languages from db
    $information['langs'] = Language::all();

    return view('backend.property.state.index', $information);
  }
  public function getState(Request $request)
  {
    $language = Language::where('is_default', 1)->first();
    $states = State::where('country_id', $request->id)->with(['stateContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->get();
    return Response::json($states, 200);
  }
  public function getStateCities(Request $request)
  {
    $language = Language::where('is_default', 1)->first();
    $basicSettings = Basic::select('property_state_status', 'property_country_status')->first();
    if ($basicSettings->property_state_status == 1) {
      $states = State::where('country_id', $request->id)->with(['cities', 'stateContent' => function ($q) use ($language) {
        $q->where('language_id', $language->id);
      }])->get();
    } else {
      $states = [];
    }

    $cities = City::where('country_id', $request->id)->with(['cityContent' => function ($q) use ($language) {
      $q->where('language_id', $language->id);
    }])->get();
    return Response::json(['states' => $states, 'cities' => $cities], 200);
  }
  public function store(Request $request)
  {
    $languages = Language::all();
    $rules = [];
    $message = [];

    $basicSettings = Basic::select('property_state_status', 'property_country_status')->first();

    if ($basicSettings->property_country_status == 1) {
      $rules['country'] = 'required|integer';
    }
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
      $state = State::create([
        'country_id' => $request->country,
      ]);
      foreach ($languages as $lang) {
        StateContent::create([
          'name' => $request[$lang->code . '_name'],
          'language_id' => $lang->id,
          'state_id' => $state->id,

        ]);
      }
      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'Something went wrong!');
      return Response::json(['status' => 'success'], 200);
    }
    Session::flash('success', 'State added successfully!');
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
        $state = StateContent::where([['state_id', $request->id], ['language_id', $lan->id]])->first();
        if (empty($state)) {
          $state  = new  StateContent();
          $state->state_id = $request->id;
          $state->language_id = $lan->id;
          $state->save();
        }
        $state->update([
          'name' => $name
        ]);
      }
    }

    Session::flash('success', 'Country update successfully!');
    return Response::json(['status' => 'success'], 200);
  }

  public function destroy(Request $request)
  {
    $state = State::find($request->id);
    $delete = true;
    $propertyContents = $state->properties()->get();
    $cities = $state->cities()->get();
    if (count($propertyContents) > 0  || count($cities) >  0) {
      $delete = false;
    }
    if ($delete) {

      $state->delete();
      $state->stateContents()->delete();
    } else {
      return redirect()->back()->with('warning', 'First, please delete cities & properties under this state.');
    }


    return redirect()->back()->with('success', 'State deleted successfully!');
  }

  public function bulkDestroy(Request $request)
  {

    $ids = $request->ids;
    DB::beginTransaction();

    try {
      foreach ($ids as $id) {;
        $state = State::find($id);
        $delete = true;
        $propertyContents = $state->properties()->get();
        $cities = $state->cities()->get();
        if (count($propertyContents) > 0 || count($cities) >  0) {
          $delete = false;
        }
        if ($delete) {
          $state->delete();
          $state->stateContents()->delete();
        } else {
          Session::flash('warning', 'First, please delete cities & properties under this state.');

          return Response::json(['status' => 'success'], 200);
        }
      }
      DB::commit();
    } catch (\Exception $e) {
      DB::rollback();
      Session::flash('warning', 'First, please delete cities & properties under this state.');
      return Response::json(['status' => 'success'], 200);
    }

    Session::flash('success', 'States deleted successfully!');

    return Response::json(['status' => 'success'], 200);
  }
}
