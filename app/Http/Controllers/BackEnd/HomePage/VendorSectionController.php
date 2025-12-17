<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Models\HomePage\VendorSection;
use App\Models\Language;
use Illuminate\Http\Request;

class VendorSectionController extends Controller
{
    public function sectionInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
        $information['language'] = $language;

        $information['data'] = $language->vendorSection()->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.vendor-section', $information);
    }

    public function updateSectionInfo(Request $request)
    {
        $request->validate([
            'button_name' => 'required',
        ]);
        $language = Language::query()->where('code', '=', $request->language)->first();
        $vendor_section = VendorSection::where('language_id', $language->id)->first();

        if ($vendor_section) {
            $vendor_section->update([
                'language_id' => $language->id,
                'title' => $request->title,
                'subtitle' => $request->subtitle,
                'btn_name' => $request->button_name
            ]);
        } else {
            VendorSection::create([
                'language_id' => $language->id,
                'title' => $request->title,
                'subtitle' => $request->subtitle,
                'btn_name' => $request->button_name
            ]);
        }

         session()->flash('success', 'Vendor section updated successfully!');

        return redirect()->back();
    }
}
