<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Models\HomePage\PropertySection;
use App\Models\Language;
use Illuminate\Http\Request;

class PropertySectionController extends Controller
{
    public function sectionInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
        $information['language'] = $language;

        $information['data'] = $language->propertySection()->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.property-section', $information);
    }

    public function updateSectionInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->first();
        $property_section = PropertySection::where('language_id', $language->id)->first();

        if ($property_section) {
            $property_section->update([
                'language_id' => $language->id,
                'title' => $request->title
            ]);
        } else {
            PropertySection::create([
                'language_id' => $language->id,
                'title' => $request->title
            ]);
        }

        session()->flash('success', 'Feature section updated successfully!');

        return redirect()->back();
    }
}
