<?php

namespace App\Http\Requests\Package;

use Illuminate\Foundation\Http\FormRequest;

class PackageStoreRequest extends FormRequest
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
    public function rules(): array
    {
        return [
            'icon' => 'required',
            'title' => 'required|max:255',
            'term' => 'required',
            'price' => 'required|numeric',

            'number_of_agent' => 'required|numeric',
            'number_of_property' => 'required|numeric',
            'number_of_property_gallery_images' => 'required|numeric',
            'number_of_property_adittionl_specifications' => 'required|numeric',
            'number_of_projects' => 'required|numeric',
            'number_of_project_types' => 'required|numeric',
            'number_of_project_gallery_images' => 'required|numeric',
            'number_of_project_additionl_specifications' => 'required|numeric',

            'status' => 'required',
            'trial_days' => 'required_if:is_trial,1'
        ];
    }
    public function messages(): array
    {
        return [
            'trial_days.required_if' => 'Trial days is required',
            'number_of_agent.required' => 'The number of agents field is required.',
            'number_of_property.required' => 'The number of propeties field is required.',
            'number_of_property_adittionl_specifications.required' => 'The number of property additionl features field is required.',
            'number_of_project_additionl_specifications.required' => 'The number of project additionl features field is required.'
        ];
    }
}
