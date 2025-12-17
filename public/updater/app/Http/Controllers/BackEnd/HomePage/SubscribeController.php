<?php

namespace App\Http\Controllers\BackEnd\HomePage;

use DB;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Helpers\UploadFile;
use App\Rules\ImageMimeTypeRule;
use App\Http\Controllers\Controller;
use App\Models\HomePage\SubscribeSection;
use Illuminate\Support\Facades\Validator;

class SubscribeController extends Controller
{
  public function index(Request $request)
  {
    $language = Language::query()->where('code', '=', $request->language)->firstOrFail();
    $information['language'] = $language;

    $information['data'] = $language->subscribeSection()->first();

    $information['info'] = DB::table('basic_settings')->select('theme_version', 'subscribe_section_img')->first();

    $information['langs'] = Language::all();

    return view('backend.home-page.subscribe-section', $information);
  }

  public function updateSectionBackground(Request $request)
  {

    $data = DB::table('basic_settings')->select('subscribe_section_img')->first();

    $rules = [];

    if (empty($data->subscribe_section_img)) {
      $rules['subscribe_section_img'] = 'required';
    }
    if ($request->hasFile('subscribe_section_img')) {
      $rules['subscribe_section_img'] = new ImageMimeTypeRule();
    }

    $validator = Validator::make($request->all(), $rules);

    if ($validator->fails()) {
      return redirect()->back()->withErrors($validator->errors());
    }

    if ($request->hasFile('subscribe_section_img')) {
      $newImage = $request->file('subscribe_section_img');
      $oldImage = $data->subscribe_section_img;

      $imgName = UploadFile::update(public_path('assets/img/'), $newImage, $oldImage);

      // finally, store the image into db
      DB::table('basic_settings')->updateOrInsert(
        ['uniqid' => 12345],
        ['subscribe_section_img' => $imgName]
      );

      session()->flash('success', 'Image updated successfully!');
    }
    return redirect()->back();
  }
  public function updateSectionInfo(Request $request)
  {
    $request->validate([
      'button_name' => 'required',
    ]);
    $language = Language::query()->where('code', '=', $request->language)->first();

    $subscribeSection = SubscribeSection::where('language_id', $language->id)->first();

    if ($subscribeSection) {
      $subscribeSection->update(
        [
          'subtitle' => $request->subtitle,
          'title' => $request->title,
          'btn_name' => $request->button_name,
        ]
      );
    } else {
      SubscribeSection::create(
        [
          'language_id' => $language->id,
          'subtitle' => $request->subtitle,
          'title' => $request->title,
          'btn_name' => $request->button_name,
        ]
      );
    }



    session()->flash('success', 'Subscribe section updated successfully!');

    return redirect()->back();
  }
}
