<?php

namespace App\Http\Requests\Testimonial;

use App\Rules\ImageMimeTypeRule;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Http\FormRequest;
use App\Models\HomePage\Testimony\Testimonial;

class UpdateRequest extends FormRequest
{
  /**
   * Determine if the user is authorized to make this request.
   *
   * @return bool
   */
  public function authorize()
  {
    return true;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array
   */
  public function rules()
  {
    $themeInfo = DB::table('basic_settings')->select('theme_version')->first();

    $ruleArray = [];

    if ($themeInfo->theme_version == 2) {
      $testimonial = Testimonial::query()->find($this->id);

      if (is_null($testimonial->image)) {
        $ruleArray['image'] = 'required';
      } else if ($this->hasFile('image')) {
        $ruleArray['image'] = new ImageMimeTypeRule();
      }
    }

    $ruleArray['name'] = 'required|max:255';
    $ruleArray['occupation'] = 'required|max:255';
    $ruleArray['comment'] = 'required';
    $ruleArray['rating'] = 'required|numeric|min:1|max:5';

    return $ruleArray;
  }
}
