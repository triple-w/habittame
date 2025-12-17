<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Models\HomePage\PricingSection;
use App\Models\Language;
use Illuminate\Http\Request;

class PricingSectionController extends Controller
{
    public function sectionInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
        $information['language'] = $language;

        $information['data'] = $language->pricingSection()->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.pricing-section', $information);
    }

    public function updateSectionInfo(Request $request)
    {

        $language = Language::query()->where('code', '=', $request->language)->first();
        $project_section = PricingSection::where('language_id', $language->id)->first();

        if ($project_section) {
            $project_section->update([
                'language_id' => $language->id,
                'title' => $request->title,
                'subtitle' => $request->subtitle,
                'description' => $request->description

            ]);
        } else {
            PricingSection::create([
                'language_id' => $language->id,
                'title' => $request->title,
                'subtitle' => $request->subtitle,
                'description' => $request->description

            ]);
        }

        session()->flash('success', 'Project section updated successfully!');

        return redirect()->back();
    }
}
