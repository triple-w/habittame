<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Models\HomePage\CategorySection;
use App\Models\Language;
use App\Rules\ImageMimeTypeRule;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class CategorySectionController extends Controller
{
    public function index(Request $request)
    {
        $information['info'] = DB::table('basic_settings')->select('category_section_background')->first();

        $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
        $information['language'] = $language;

        $information['data'] = CategorySection::where('language_id', $language->id)->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.category-section', $information);
    }

    public function update(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->first();

        CategorySection::query()->updateOrCreate(
            ['language_id' => $language->id],
            [
                'subtitle' => $request->subtitle,
                'title' => $request->title,
            ]
        );

        Session::flash('success', 'About section updated successfully!');

        return redirect()->back();
    }
}
