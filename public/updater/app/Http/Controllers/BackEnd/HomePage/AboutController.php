<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Models\HomePage\AboutSection;
use App\Models\Language;
use App\Rules\ImageMimeTypeRule;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Purifier;
use Validator;

class AboutController extends Controller
{
    public function index(Request $request)
    {
        $information['info'] = DB::table('basic_settings')
            ->select('about_section_image1', 'about_section_image2', 'about_section_video_link')
            ->first();

        $language = Language::query()->where('code', '=', $request->language)->first();
        $information['language'] = $language;

        $information['data'] = $language->aboutSection()->first();

        $information['langs'] = Language::all();

        return view('backend.home-page.about-section', $information);
    }

    public function updateImage(Request $request)
    {
         
        $info = DB::table('basic_settings')->select('about_section_image1', 'about_section_image2', 'about_section_video_link', 'theme_version')->first();

        $rules = [];

        if (empty($info->about_section_image1)) {
            $rules['about_section_image1'] = 'required';
        }
        if ($request->hasFile('about_section_image1')) {
            $rules['about_section_image1'] = new ImageMimeTypeRule();
        }

        if (empty($info->about_section_image2)) {
            $rules['about_section_image2'] = 'required';
        }
        if ($request->hasFile('about_section_image2')) {
            $rules['about_section_image2'] = new ImageMimeTypeRule();
        }

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors());
        }

        if ($request->hasFile('about_section_image1')) {
            $newImage1 = $request->file('about_section_image1');
            $oldImage = $info->about_section_image1;

            $imgName1 = UploadFile::update(public_path('/assets/img/about_section/'), $newImage1, $oldImage);
        }

        if ($request->hasFile('about_section_image2')) {
            $newImage2 = $request->file('about_section_image2');
            $oldImage2 = $info->about_section_image2;

            $imgName2 = UploadFile::update(public_path('/assets/img/about_section/'), $newImage2, $oldImage2);
        }

      
        $link = $request->about_section_video_link;

        if (strpos($link, '&') != 0) {
            $endPosition = strpos($link, '&');
            $link = substr($link, 0, $endPosition);
        }
      

        DB::table('basic_settings')->update([
            'about_section_image1' => isset($imgName1) ? $imgName1 : $info->about_section_image1,
            'about_section_image2' => isset($imgName2) ? $imgName2 : $info->about_section_image2,
            'about_section_video_link' => isset($link) ? $link : null
        ]);

        Session::flash('success', 'Information updated successfully!');

        return redirect()->back();
    }


    public function updateInfo(Request $request)
    {
        $language = Language::query()->where('code', '=', $request->language)->first();

        AboutSection::query()->updateOrCreate(
            ['language_id' => $language->id],
            [
                'title' => $request->title,
                'sub_title' => $request->sub_title,
                'description' => Purifier::clean($request->text),
                'client_text' => $request->client_text,
                'btn_name' => $request->button_name,
                'btn_url' => $request->button_url,
                'years_of_expricence' => $request->years_of_expricence
            ]
        );

        $request->session()->flash('success', 'Information updated successfully!');

        return redirect()->back();
    }
}
