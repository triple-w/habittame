<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PageHeadingRequest extends FormRequest
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
    return [
      'property_page_title' => 'required',
      'project_page_title' => 'required',
      'agent_page_title' => 'required',
      'agent_login_page_title' => 'required',
      'pricing_page_title' => 'required',
      'vendor_page_title' => 'required', 
      'agent_forget_password_page_title' => 'required',
      'login_page_title' => 'required',
      'signup_page_title' => 'required',
      'forget_password_page_title' => 'required',
      'vendor_login_page_title' => 'required',
      'vendor_signup_page_title' => 'required',
      'vendor_forget_password_page_title' => 'required',
      'error_page_title' => 'required',
      'about_us_title' => 'required',
      'blog_page_title' => 'required',
      'faq_page_title' => 'required',
      'contact_page_title' => 'required',
      'dashboard_page_title' => 'required',
      'support_ticket_page_title' => 'required',
      'support_ticket_create_page_title' => 'required',
      'change_password_page_title' => 'required',
      'edit_profile_page_title' => 'required',
    ];
  }
}
