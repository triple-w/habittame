<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Models\HomePage\AboutSection;
use App\Models\HomePage\WhyChooseUs;
use App\Models\Language;
use App\Rules\ImageMimeTypeRule;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Purifier;
use Validator;

class WhyChooseUsController extends Controller
{
    public function index(Request $request)
    {
        $information['info'] = DB::table('basic_settings')
            ->select('why_choose_us_section_img1', 'why_choose_us_section_img2', 'why_choose_us_section_video_link')
            ->first();

        $language = Language::query()->where('code', '=', $request->language)->first();
        $information['language'] = $language;

        $information['data'] = $language->whyChooseUsSection()->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.whyChooseUsSection', $information);
    }

    public function updateImage(Request $request)
    {
 
        $info = DB::table('basic_settings')->select('why_choose_us_section_img1', 'why_choose_us_section_img2', 'about_section_video_link', 'theme_version')->first();

        $rules = [];

        if (empty($info->why_choose_us_section_img1)) {
            $rules['why_choose_us_section_img1'] = 'required';
        }
        if ($request->hasFile('why_choose_us_section_img1')) {
            $rules['why_choose_us_section_img1'] = new ImageMimeTypeRule();
        }

        if (empty($info->why_choose_us_section_img2)) {
            $rules['why_choose_us_section_img2'] = 'required';
        }
        if ($request->hasFile('why_choose_us_section_img2')) {
            $rules['why_choose_us_section_img2'] = new ImageMimeTypeRule();
        }

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors());
        }

        if ($request->hasFile('why_choose_us_section_img1')) {
            $newImage1 = $request->file('why_choose_us_section_img1');
            $oldImage = $info->why_choose_us_section_img1;

            $imgName1 = UploadFile::update(public_path('/assets/img/why-choose-us/'), $newImage1, $oldImage);
        }

        if ($request->hasFile('why_choose_us_section_img2')) {
            $newImage2 = $request->file('why_choose_us_section_img2');
            $oldImage2 = $info->why_choose_us_section_img2;

            $imgName2 = UploadFile::update(public_path('/assets/img/why-choose-us/'), $newImage2, $oldImage2);
        }

        
        $link = $request->why_choose_us_section_video_link;

        if (strpos($link, '&') != 0) {
            $endPosition = strpos($link, '&');
            $link = substr($link, 0, $endPosition);
        }
    

        DB::table('basic_settings')->update([
            'why_choose_us_section_img1' => isset($imgName1) ? $imgName1 : $info->why_choose_us_section_img1,
            'why_choose_us_section_img2' => isset($imgName2) ? $imgName2 : $info->why_choose_us_section_img2,
            'why_choose_us_section_video_link' => isset($link) ? $link : null
        ]);

        Session::flash('success', 'Information updated successfully!');

        return redirect()->back();
    }


    public function updateInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->first();

        WhyChooseUs::query()->updateOrCreate(
            ['language_id' => $language->id],
            [
                'title' => $request->title,
                'sub_title' => $request->sub_title,
                'description' => Purifier::clean($request->text),

            ]
        );

        $request->session()->flash('success', 'Information updated successfully!');

        return redirect()->back();
    }
}
