<?php

namespace App\Http\Requests\Agent;

use App\Rules\ImageMimeTypeRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class updateRequest extends FormRequest
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
        return [
            'image' => $this->hasFile('image') ? new ImageMimeTypeRule() : '',

            'username' => [
                'required',
                'max:255',
                Rule::unique('agents')->ignore($this->id),
                'regex:/^\S*$/u'
            ],
            'email' => [
                'required',
                'email:rfc,dns',
                Rule::unique('agents')->ignore($this->id)
            ],
        ];
    }
    public function messages()
    {
        return [

            'username.regex' => 'Space are not allowed in the username field.',
        ];
    }
}
