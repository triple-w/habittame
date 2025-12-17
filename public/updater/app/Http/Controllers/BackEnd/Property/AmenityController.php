<?php

namespace App\Http\Controllers\BackEnd\Property;

use App\Http\Controllers\Controller;
use App\Models\Amenity;
use App\Models\AmenityContent;
use App\Models\Language;
use App\Models\Property\PropertyAmenity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\Rule;
use Session;
use Validator;

class AmenityController extends Controller
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

        // then, get the equipment categories of that language from db
        $information['amenityContents'] = $language->amenityContents()->orderByDesc('id')->get();

        // also, get all the languages from db
        $information['langs'] = Language::all();

        return view('backend.property.amenity.index', $information);
    }

    public function store(Request $request)
    {
        $rules = [
            'icon' => 'required',
            'status' => 'required|numeric',
            'serial_number' => 'required|numeric'
        ];

        $message = [
            'language_id.required' => 'The language field is required.'
        ];

        $languages = Language::all();
        foreach ($languages as $lan) {
            $rules[$lan->code . '_name'] = 'required|unique:amenity_contents,name';
            $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
            $message[$lan->code . '_name.unique'] = 'The name field must be unique for ' . $lan->name . ' language.';
        }

        $validator = Validator::make($request->all(), $rules, $message);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }
        DB::beginTransaction();
        try {
            $amenity =  Amenity::create([
                'status' => $request->status,
                'icon' => $request->icon,
                'serial_number' => $request->serial_number
            ]);
            foreach ($languages as $lang) {

                AmenityContent::create([
                    'language_id' => $lang->id,
                    'amenity_id' => $amenity->id,
                    'name' => $request[$lang->code . '_name'],
                ]);
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            Session::flash('warning', 'Something went wrong!');
            return Response::json(['status' => 'success'], 200);
        }

        Session::flash('success', 'New Amenity added successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function update(Request $request)
    {
        $rules = [
            'status' => 'required|numeric',
            'serial_number' => 'required|numeric'
        ];

        $languages = Language::all();
        $message = [];
        foreach ($languages as $lan) {
            $rules[$lan->code . '_name'] = 'required';
            $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
        }

        $validator = Validator::make($request->all(), $rules, $message);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }

        DB::beginTransaction();
        try {

            $amenity =  Amenity::find($request->amenity_id);
            $amenity->update([
                'status' => $request->status,
                'icon' => $request->icon,
                'serial_number' => $request->serial_number
            ]);

            foreach ($languages as $lan) {
                $aminityContent = AmenityContent::where([['language_id', $lan->id], ['amenity_id', $request->amenity_id]])->first();
                if (empty($aminityContent)) {
                    $aminityContent  = new  AmenityContent();
                    $aminityContent->amenity_id = $amenity->id;
                    $aminityContent->language_id = $lan->id;
                    $aminityContent->save();
                }

                $aminityContent->update([
                    'name' => $request[$lan->code . '_name'],

                ]);
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            Session::flash('warning', 'Something went wrong!');
            return Response::json(['status' => 'success'], 200);
        }
        Session::flash('success', 'Amenity updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function destroy(Request $request)
    {
        $amenity = Amenity::find($request->id);
        $propertyAmenities = $amenity->propertyAmenities()->count();
        if ($propertyAmenities == 0) {
            $amenity->amenityContents()->delete();
            $amenity->delete();
        } else {
            return redirect()->back()->with('warning', 'You can not delete this amenity!! A property included in this amenity.');
        }

        return redirect()->back()->with('success', 'Amenity deleted successfully!');
    }


    public function bulkDestroy(Request $request)
    {
        $ids = $request->ids;

        foreach ($ids as $id) {
            $amenity = Amenity::find($id);
            $propertyAmenities = $amenity->propertyAmenities()->count();
            if ($propertyAmenities == 0) {
                $amenity->amenityContents()->delete();
                $amenity->delete();
            } else {
                Session::flash('warning', 'You can not delete all amenity!! A property included in this amenity.');
                return Response::json(['status' => 'success'], 200);
            }
        }
        Session::flash('success', 'All amenities delete successfully!');

        return Response::json(['status' => 'success'], 200);
    }
}
