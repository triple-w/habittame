<?php

namespace App\Http\Controllers\BackEnd\HomePage\Hero;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Models\BasicSettings\Basic;
use App\Models\HomePage\Hero\HeroStatic;
use App\Models\Language;
use App\Rules\ImageMimeTypeRule;
use Illuminate\Http\Request;

class StaticController extends Controller
{
    public function index(Request $request)
    {


        $language = Language::query()->where('code', '=', $request->language)->first();
        $information['language'] = $language;

        $information['langs'] = Language::all();


        $information['heroImg'] = Basic::query()->pluck('hero_static_img')->first();

        $information['heroInfo'] = $language->heroStatic()->first();

        return view('backend.home-page.hero-section.static-version.index', $information);
    }

    public function updateImage(Request $request)
    {
        $img = Basic::query()->pluck('hero_static_img')->first();

        $rules = [];

        if (empty($img)) {
            $rules['image'] = 'required';
        }
        if ($request->hasFile('image')) {
            $rules['image'] = new ImageMimeTypeRule();
        }

        $request->validate($rules);

        if ($request->hasFile('image')) {
            $newImage = $request->file('image');
            $oldImage = $img;

            $imgName = UploadFile::update(public_path('assets/img/hero/static/'), $newImage, $oldImage);

            Basic::query()->updateOrCreate(
                ['uniqid' => 12345],
                ['hero_static_img' => $imgName]
            );

            $request->session()->flash('success', 'Image updated successfully.');
        }

        return redirect()->back();
    }

    public function updateInformation(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->first();

        HeroStatic::query()->updateOrCreate(
            ['language_id' => $language->id],
            [
                'title' => $request->title,
                'text' => $request->text
            ]
        );

        $request->session()->flash('success', 'Information updated successfully!');

        return redirect()->back();
    }
}
