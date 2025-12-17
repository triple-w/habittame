<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Models\BasicSettings\Basic;
use App\Models\HomePage\BrandSection;
use App\Models\HomePage\Hero\Slider;
use App\Models\Language;
use App\Rules\ImageMimeTypeRule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{
    public function index(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
        $information['language'] = $language;

        $information['brands'] = BrandSection::orderByDesc('id')->get();

        $information['langs'] = Language::all();

        return view('backend.home-page.brand.index', $information);
    }

    public function store(Request $request)
    {
        $rules = [

            'image' => [
                'required',
                new ImageMimeTypeRule()
            ],
            'url' => 'nullable|url',
        ];


        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }

        // store image in storage
        $imgName = UploadFile::store(public_path('assets/img/brands/'), $request->file('image'));

        BrandSection::query()->create([
            'image' => $imgName,
            'url' => $request->url,
        ]);

        $request->session()->flash('success', 'New Brand added successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function update(Request $request)
    {
        $rule = [
            'image' => $request->hasFile('image') ? new ImageMimeTypeRule() : '',
            'url' => 'nullable|url',
        ];

        $validator = Validator::make($request->all(), $rule);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }

        $brand = BrandSection::find($request['id']);

        if ($request->hasFile('image')) {
            $newImage = $request->file('image');
            $oldImage = $brand->image;
            $imgName = UploadFile::update(public_path('assets/img/brands/'), $newImage, $oldImage);
        }

        $brand->update([
            'image' => $request->hasFile('image') ? $imgName : $brand->image,
            'url' => $request->url
        ]);

        $request->session()->flash('success', 'Brand updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function destroy($id)
    {
        $brand = BrandSection::query()->find($id);

        @unlink(public_path('assets/img/brands/') . $brand->image);

        $brand->delete();

        return redirect()->back()->with('success', 'Brand deleted successfully!');
    }
}
