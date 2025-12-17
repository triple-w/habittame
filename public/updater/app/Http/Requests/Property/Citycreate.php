<?php

namespace App\Http\Requests\Property;

use App\Models\BasicSettings\Basic;
use App\Models\Language;
use App\Models\Property\Country;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class Citycreate extends FormRequest
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
     * @return array<string, mixed>
     */
    public function rules()
    {
        $country =  $this->country;
        $basicSettings = Basic::select('property_state_status', 'property_country_status')->first();
        $rules = [
            'state' => [
                Rule::requiredIf(function () use ($country, $basicSettings) {
                    if ($country) {
                        $scountry = Country::findOrFail($country);
                        if (count($scountry->states) > 0 && $basicSettings->property_state_status == 1) {
                            
                            return true;
                        } else {
                            return false;
                        }
                    }
                    return false;
                })
            ],
            'image' => "required|mimes:jpg,png,svg,jpeg,webp",
            'status' => 'required|numeric',
            'serial_number' => 'required|numeric'
        ];

        if ($basicSettings->property_country_status == 1) {
            $rules['country'] = 'required';
        }

        if ($basicSettings->property_country_status != 1 && $basicSettings->property_state_status == 1  ) {
            $rules['state'] = 'required';
        }

        $languages = Language::all();
        foreach ($languages as $lan) {
            $rules[$lan->code . '_name'] = 'required|unique:property_city_contents,name';
        }

        return $rules;
    }
    public function messages()
    {
        $languages = Language::all();
        $message['state.required_if'] = 'The state field is required.';
        foreach ($languages as $lan) {
            $message[$lan->code . '_name.required'] = 'The name field is required for ' . $lan->name . ' language.';
        }
        return $message;
    }
}
