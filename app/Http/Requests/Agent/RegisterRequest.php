<?php

namespace App\Http\Requests\Agent;

use App\Rules\ImageMimeTypeRule;
use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            'image' => [
                'required',
                new ImageMimeTypeRule()
            ],
            'username' => 'required|max:255|unique:agents,username|regex:/^\S*$/u',
            'email' => 'required|email:rfc,dns|unique:agents,email',
            'first_name' => 'required',
            'last_name' => 'required',
            'password' => 'required|confirmed',
            'password_confirmation' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'username.regex' => 'Space are not allowed in the username field.',
            'password.confirmed' => 'Password confirmation does not match.',
            'password_confirmation.required' => 'The confirm password field is required.'
        ];
    }
}
