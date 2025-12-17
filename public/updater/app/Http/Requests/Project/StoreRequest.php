<?php

namespace App\Http\Requests\Project;

use App\Http\Helpers\VendorPermissionHelper;
use App\Models\Language;
use App\Rules\ImageMimeTypeRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class StoreRequest extends FormRequest
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

        if (Auth::guard('agent')->check() && Auth::guard('agent')->user() && Auth::guard('agent')->user()->vendor_id != 0) {
            $vendorId = Auth::guard('agent')->user()->vendor_id;
            $vendorCurrentPackage =  VendorPermissionHelper::currentPackagePermission($vendorId);
        } elseif (Auth::guard('vendor')->check() && Auth::guard('vendor')->user()) {
            $vendorId = Auth::guard('vendor')->user()->id;
            $vendorCurrentPackage =  VendorPermissionHelper::currentPackagePermission($vendorId);
        }
        $rules = [];


        $rules = [
            'floor_plan_images' => 'required',
            'featured_image' => [
                'required',
                new ImageMimeTypeRule()
            ],
            'min_price' => 'required|numeric',
            'max_price' => 'nullable|numeric',
            'featured' => 'sometimes',
            'status' => 'required',
            'latitude' => ['nullable', 'numeric', 'regex:/^[-]?((([0-8]?[0-9])\.(\d+))|(90(\.0+)?))$/'],
            'longitude' => ['nullable', 'numeric', 'regex:/^[-]?((([1]?[0-7]?[0-9])\.(\d+))|([0-9]?[0-9])\.(\d+)|(180(\.0+)?))$/']

        ];

        if ((Auth::guard('agent')->check() && Auth::guard('agent')->user()->vendor_id == 0)) {
            $rules['gallery_images'] = 'required|array';
        } else {
            $rules['gallery_images'] = 'required|array|max:' . $vendorCurrentPackage->number_of_project_gallery_images;
        }

        $languages = Language::all();

        foreach ($languages as $language) {
            $rules[$language->code . '_title'] = 'required|max:255';
            $rules[$language->code . '_address'] = 'required';
            $rules[$language->code . '_description'] = 'required|min:15';
            if ((Auth::guard('agent')->check() && Auth::guard('agent')->user()->vendor_id == 0)) {
                $rules[$language->code . '_label'] = 'array';
            } else {
                $rules[$language->code . '_label'] = 'array|max:' . $vendorCurrentPackage->number_of_project_additionl_specifications;
            }
        }

        return $rules;
    }
    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages()
    {
        $message = [];
        $languages = Language::all();

        foreach ($languages as $language) {
            $message[$language->code . '_title.required'] = 'The title field is required for ' . $language->name . ' language.';
            $message[$language->code . '_address.required'] = 'The address field is required for ' . $language->name . ' language.';
            $message[$language->code . '_description.required'] = 'The description field is required for ' . $language->name . ' language.';
            $message[$language->code . '_description.min'] = 'The description  must be at least :min characters for ' . $language->name . ' language.';
            $message[$language->code . '_label.max'] = 'Additional Features for ' . $language->name . ' language shall not exceed :max.';
        }
        $message['gallery_images.required'] = 'The gallery images is required.';
        $message['gallery_images.max'] = 'The gallery images must not have more than :max.';
        return $message;
    }
}
