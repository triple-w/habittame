<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Models\HomePage\CitySection;
use App\Models\Language;
use App\Models\Property\City;
use Illuminate\Http\Request;

class CitySectionController extends Controller
{
    public function sectionInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
        $information['language'] = $language;

        $information['data'] = $language->citySection()->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.city-section', $information);
    }

    public function updateSectionInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->first();
        $city_section = CitySection::where('language_id', $language->id)->first();

        if ($city_section) {
            $city_section->update([
                'language_id' => $language->id,
                'title' => $request->title,
                'subtitle' => $request->subtitle
            ]);
        } else {
            CitySection::create([
                'language_id' => $language->id,
                'title' => $request->title,
                'subtitle' => $request->subtitle
            ]);
        }

         session()->flash('success', 'City section updated successfully!');

        return redirect()->back();
    }
}
