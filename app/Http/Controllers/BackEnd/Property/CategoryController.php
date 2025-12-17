<?php

namespace App\Http\Controllers\BackEnd\Property;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Models\BasicSettings\Basic;
use App\Models\Language;
use App\Models\Property\PropertyCategory;
use App\Models\Property\PropertyCategoryContent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class CategoryController extends Controller
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
        $information['categories'] = PropertyCategory::query()
            ->join('property_category_contents', 'property_categories.id', 'property_category_contents.category_id')
            ->where('property_category_contents.language_id', $language->id)
            ->orderBy('property_categories.serial_number', 'asc')
            ->select('property_categories.*', 'property_category_contents.name')->get();
        // also, get all the languages from db
        $information['langs'] = Language::all();
        return view('backend.property.category.index', $information);
    }

    public function store(Request $request)
    {

        $img = $request->file('image');


        $rules = [
            'type' => "required",
            'image' => "required",
            'status' => 'required|numeric',
            'serial_number' => 'required|numeric'
        ];

        $message = [
            'language_id.required' => 'The language field is required.'
        ];

        $languages = Language::all();
        foreach ($languages as $lan) {
            $rules[$lan->code . '_name'] = 'required|unique:property_category_contents,name';
            $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
            $message[$lan->code . '_name.unique'] = 'The name field must be unique for ' . $lan->name . ' language.';
        }
        $validator = Validator::make($request->all(), $rules, $message);


        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }

        if ($request->hasFile('image')) {
            $filename = UploadFile::store(public_path('assets/img/property-category/'), $img);
        }

        DB::beginTransaction();

        try {
            $category = PropertyCategory::create([
                'type' => $request->type,
                'image' => $filename,
                'status' => $request->status,
                'serial_number' => $request->serial_number
            ]);
            foreach ($languages as $lan) {

                PropertyCategoryContent::create([
                    'language_id' => $lan->id,
                    'category_id' => $category->id,
                    'name' => $request[$lan->code . '_name'],
                    'slug' => $request[$lan->code . '_name'],
                ]);
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            Session::flash('warning', 'Something went wrong!');

            return Response::json(['status' => 'success'], 200);
        }
        Session::flash('success', 'New Property category added successfully!');

        return Response::json(['status' => 'success'], 200);
    }
    public function updateFeatured(Request $request)
    {
        $category = PropertyCategory::findOrFail($request->categoryId);

        if ($request->featured == 1) {
            $category->update(['featured' => 1]);

            Session::flash('success', 'Category featured successfully!');
        } else {
            $category->update(['featured' => 0]);

            Session::flash('success', 'Category Unfeatured successfully!');
        }

        return redirect()->back();
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

        $category = PropertyCategory::find($request->id);

        if ($request->hasFile('image')) {
            $img = $request->file('image');
            $filename = UploadFile::update(public_path('assets/img/property-category/'), $img, $category->image);
        } else {
            $filename = $category->image;
        }
        $category->update([

            'image' => $filename,
            'status' => $request->status,
            'serial_number' => $request->serial_number
        ]);

        foreach ($languages as $lan) {

            $categoryContent = PropertyCategoryContent::where([['category_id', $request->id], ['language_id', $lan->id]])->first();
            if (empty($categoryContent)) {
                $categoryContent  = new  PropertyCategoryContent();
                $categoryContent->category_id = $request->id;
                $categoryContent->language_id = $lan->id;
                $categoryContent->save();
            }

            $categoryContent->update([
                'name' => $request[$lan->code . '_name'],
                'slug' => $request[$lan->code . '_name'],
            ]);
        }

        Session::flash('success', 'Property category updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function destroy(Request $request)
    {
        $category = PropertyCategory::find($request->id);

        if ($category->properties()->count() ==  0) {
            @unlink(public_path('assets/img/property-category/') . $category->image);
            $category->categoryContents()->delete();
            $category->delete();
        } else {
            return redirect()->back()->with('warning', 'You can not delete category!! A property included in this category.');
        }


        return redirect()->back()->with('success', 'Category deleted successfully!');
    }

    public function bulkDestroy(Request $request)
    {
        $ids = $request->ids;
        DB::beginTransaction();

        try {
            foreach ($ids as $id) {
                $category = PropertyCategory::find($id);

                if ($category->properties()->count() == 0) {
                    @unlink(public_path('assets/img/property-category/') . $category->image);
                    $category->categoryContents()->delete();
                    $category->delete();
                } else {
                    Session::flash('warning', 'You can not delete all category!!  The property included the category.');
                    return Response::json(['status' => 'success'], 200);
                }
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            Session::flash('warning', 'You can not delete all category!!  The property included the category.');
            return Response::json(['status' => 'error'], 400);
        }

        Session::flash('success', 'Property categories deleted successfully!');

        return Response::json(['status' => 'success'], 200);
    }
}
