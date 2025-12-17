<?php

namespace App\Http\Controllers\Agent;

use App\Http\Controllers\Controller;
use App\Http\Controllers\FrontEnd\MiscellaneousController;
use App\Http\Helpers\UploadFile;
use App\Models\Agent;
use App\Models\AgentInfo;
use App\Models\BasicSettings\Basic;
use App\Models\BasicSettings\MailTemplate;
use App\Models\Language;
use App\Models\Project\Project;
use App\Models\Property\Property;
use App\Rules\MatchEmailRule;
use App\Rules\MatchOldPasswordRule;
use Auth;
use DB;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Mail\Message;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Str;

class AgentController extends Controller
{
    public function dashboard()
    {
        $agent_id = Auth::guard('agent')->user()->id;
        $information['totalProperties'] = Property::query()->where('agent_id', $agent_id)->count();
        $information['totalProjects'] = Project::query()->where('agent_id', $agent_id)->count();

        $totalProperties = DB::table('properties')
            ->select(DB::raw('month(created_at) as month'), DB::raw('count(id) as total'))
            ->groupBy('month')
            ->where('agent_id', $agent_id)
            ->whereYear('created_at', '=', date('Y'))
            ->get();

        $totalProjects = DB::table('projects')
            ->select(DB::raw('month(created_at) as month'), DB::raw('count(id) as total'))
            ->groupBy('month')
            ->where('agent_id', $agent_id)
            ->whereYear('created_at', '=', date('Y'))
            ->get();


        $months = [];
        $totalPropertyArr = [];
        $totalProjectsArr = [];


        //event icome calculation
        for ($i = 1; $i <= 12; $i++) {
            // get all 12 months name
            $monthNum = $i;
            $dateObj = DateTime::createFromFormat('!m', $monthNum);
            $monthName = $dateObj->format('M');
            array_push($months, $monthName);

            // get all 12 months's property posts
            $propertyFound = false;
            foreach ($totalProperties as $totalProperty) {
                if ($totalProperty->month == $i) {
                    $propertyFound = true;
                    array_push($totalPropertyArr, $totalProperty->total);
                    break;
                }
            }
            if ($propertyFound == false) {
                array_push($totalPropertyArr, 0);
            }

            // // get all 12 months's project post
            $projectFound = false;
            foreach ($totalProjects as $totalProject) {
                if ($totalProject->month == $i) {
                    $projectFound = true;
                    array_push($totalProjectsArr, $totalProject->total);
                    break;
                }
            }
            if ($projectFound == false) {
                array_push($totalProjectsArr, 0);
            }
        }


        $information['monthArr'] = $months;
        $information['totalPropertiesArr'] = $totalPropertyArr;
        $information['totalProjectsArr'] = $totalProjectsArr;
        return view('agent.index', $information);
    }

    //login
    public function login()
    {
        $misc = new MiscellaneousController();

        $language = $misc->getLanguage();

        $queryResult['seoInfo'] = $language->seoInfo()->select('meta_keyword_agent_login', 'meta_description_agent_login')->first();

        $queryResult['pageHeading'] = $misc->getPageHeading($language);

        $queryResult['bgImg'] = $misc->getBreadcrumb();

        $queryResult['bs'] = Basic::query()->select('google_recaptcha_status', 'facebook_login_status', 'google_login_status')->first();
        return view('frontend.agent.auth.login', $queryResult);
    }
    public function logout(Request $request)
    {
        Auth::guard('agent')->logout();
        Session::forget('agent_theme_version');
        return redirect()->route('agent.login');
    }
    //authenticate
    public function authentication(Request $request)
    {
        $rules = [
            'username' => 'required',
            'password' => 'required'
        ];
        $info = Basic::select('google_recaptcha_status')->first();
        if ($info->google_recaptcha_status == 1) {
            $rules['g-recaptcha-response'] = 'required|captcha';
        }

        $messages = [];

        if ($info->google_recaptcha_status == 1) {
            $messages['g-recaptcha-response.required'] = 'Please verify that you are not a robot.';
            $messages['g-recaptcha-response.captcha'] = 'Captcha error! try again later or contact site admin.';
        }

        $validator = Validator::make($request->all(), $rules, $messages);


        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors());
        }
        if (Auth::guard('agent')->attempt([
            'username' => $request->username,
            'password' => $request->password
        ])) {

            Session::put('secret_login', 0);
            return redirect()->route('agent.dashboard');
        } else {
            return redirect()->back()->with('error', 'Incorrect username or password');
        }
    }

    //change_password
    public function change_password()
    {
        return view('agent.auth.change-password');
    }

    //update_password
    public function updated_password(Request $request)
    {
        $rules = [
            'current_password' => [
                'required',
                new MatchOldPasswordRule('agent')

            ],
            'new_password' => 'required|confirmed',
            'new_password_confirmation' => 'required'
        ];

        $messages = [
            'new_password.confirmed' => 'Password confirmation does not match.',
            'new_password_confirmation.required' => 'The confirm new password field is required.'
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()->toArray()
            ], 400);
        }

        $agent = Auth::guard('agent')->user();

        $agent->update([
            'password' => Hash::make($request->new_password)
        ]);

        Session::flash('success', 'Password updated successfully!');

        return response()->json(['status' => 'success'], 200);
    }

    //edit_profile
    public function edit_profile()
    {
        $information = [];
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $information['language'] = $language;
        $information['languages'] = Language::get();

        $agent_id = Auth::guard('agent')->user()->id;
        $information['agent'] = Agent::with('agent_info')->where('id', $agent_id)->first();
        return view('agent.auth.edit-profile', $information);
    }
    //update_profile
    public function update_profile(Request $request, Agent $vendor)
    {
        $id = Auth::guard('agent')->user()->id;
        $rules = [
            'username' => [
                'required',
                'not_in:admin',
                Rule::unique('agents', 'username')->ignore($id),
            ],
            'email' => [
                'required',
                'email',
                Rule::unique('agents', 'email')->ignore($id)
            ],
            'phone' => 'required'
        ];

        if ($request->hasFile('photo')) {
            $rules['photo'] = 'mimes:png,jpeg,jpg,svg';
        }

        $languages = Language::get();
        foreach ($languages as $language) {
            $rules[$language->code . '_first_name'] = 'required';
            $rules[$language->code . '_last_name'] = 'required';
        }

        $messages = [];

        foreach ($languages as $language) {
            $messages[$language->code . '_first_name.required'] = 'The First Name field is required for ' . $language->name . ' language.';
            $messages[$language->code . '_last_name.required'] = 'The Last Name field is required for ' . $language->names . ' language.';
        }

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }
        $in = $request->all();
        $agent  = Agent::where('id', $id)->first();
        $file = $request->file('photo');
        $fileName = $agent->image;
        if ($file) {
            $fileName = UploadFile::update(public_path('assets/img/agents/'), $request->photo, $agent->image);
            $in['image'] = $fileName;
        }

        if ($request->show_email_addresss) {
            $in['show_email_addresss'] = 1;
        } else {
            $in['show_email_addresss'] = 0;
        }
        if ($request->show_phone_number) {
            $in['show_phone_number'] = 1;
        } else {
            $in['show_phone_number'] = 0;
        }
        if ($request->show_contact_form) {
            $in['show_contact_form'] = 1;
        } else {
            $in['show_contact_form'] = 0;
        }
        DB::beginTransaction();
        try {


            $agent->update([
                'email' => $request->email,
                'phone' => $request->phone,
                'image' => $fileName,
                'show_email_addresss' => $request->show_email_addresss ? 1 : 0,
                'show_phone_number' => $request->show_phone_number ? 1 : 0,
                'show_contact_form' => $request->show_contact_form ? 1 : 0
            ]);

            $languages = Language::get();
            $agent_id = $agent->id;
            foreach ($languages as $language) {
                $agentInfo = AgentInfo::where('agent_id', $agent_id)->where('language_id', $language->id)->first();
                if ($agentInfo == NULL) {
                    $agentInfo = new AgentInfo();
                }
                $agentInfo->language_id = $language->id;
                $agentInfo->agent_id = $agent_id;
                $agentInfo->first_name = $request[$language->code . '_first_name'];
                $agentInfo->last_name = $request[$language->code . '_last_name'];
                $agentInfo->country = $request[$language->code . '_country'];
                $agentInfo->city = $request[$language->code . '_city'];
                $agentInfo->state = $request[$language->code . '_state'];
                $agentInfo->zip_code = $request[$language->code . '_zip_code'];
                $agentInfo->address = $request[$language->code . '_address'];
                $agentInfo->details = $request[$language->code . '_details'];
                $agentInfo->save();
            }
            DB::commit();
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong.');

            return Response::json(['status' => 'error'], 200);
        }

        Session::flash('success', 'Agent updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    //forget_passord
    public function forget_passord()
    {
        $misc = new MiscellaneousController();

        $language = $misc->getLanguage();

        $queryResult['seoInfo'] = $language->seoInfo()->select('meta_keywords_vendor_forget_password', 'meta_descriptions_vendor_forget_password')->first();

        $queryResult['pageHeading'] = $misc->getPageHeading($language);

        $queryResult['bgImg'] = $misc->getBreadcrumb();
        $queryResult['bs'] = Basic::query()->select('google_recaptcha_status', 'facebook_login_status', 'google_login_status')->first();
        return view('frontend.agent.auth.forget-password', $queryResult);
    }

    //forget_mail
    public function forget_mail(Request $request)
    {
        $rules = [
            'email' => [
                'required',
                'email:rfc,dns',
                new MatchEmailRule('agent')
            ]
        ];

        $info = Basic::select('google_recaptcha_status')->first();
        if ($info->google_recaptcha_status == 1) {
            $rules['g-recaptcha-response'] = 'required|captcha';
        }

        $messages = [];

        if ($info->google_recaptcha_status == 1) {
            $messages['g-recaptcha-response.required'] = 'Please verify that you are not a robot.';
            $messages['g-recaptcha-response.captcha'] = 'Captcha error! try again later or contact site admin.';
        }

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $user = Agent::where('email', $request->email)->first();

        // first, get the mail template information from db
        $mailTemplate = MailTemplate::where('mail_type', 'reset_password')->first();
        $mailSubject = $mailTemplate->mail_subject;
        $mailBody = $mailTemplate->mail_body;

        // second, send a password reset link to user via email
        $info = DB::table('basic_settings')
            ->select('website_title', 'smtp_status', 'smtp_host', 'smtp_port', 'encryption', 'smtp_username', 'smtp_password', 'from_mail', 'from_name')
            ->first();

        $name = $user->username;
        $token =  Str::random(32);
        DB::table('password_resets')->insert([
            'email' => $user->email,
            'token' => $token,
        ]);

        $link = '<a href=' . url("agent/reset-password?token=" . $token) . '>Click Here</a>';

        $mailBody = str_replace('{customer_name}', $name, $mailBody);
        $mailBody = str_replace('{password_reset_link}', $link, $mailBody);
        $mailBody = str_replace('{website_title}', $info->website_title, $mailBody);

        $data = [
            'to' => $request->email,
            'subject' => $mailSubject,
            'body' => $mailBody,
        ];

        // if smtp status == 1, then set some value for PHPMailer
        if ($info->smtp_status == 1) {
            try {
                $smtp = [
                    'transport' => 'smtp',
                    'host' => $info->smtp_host,
                    'port' => $info->smtp_port,
                    'encryption' => $info->encryption,
                    'username' => $info->smtp_username,
                    'password' => $info->smtp_password,
                    'timeout' => null,
                    'auth_mode' => null,
                ];
                Config::set('mail.mailers.smtp', $smtp);
            } catch (\Exception $e) {
                Session::flash('error', $e->getMessage());
                return back();
            }
        }

        // finally add other informations and send the mail
        try {
            Mail::send([], [], function (Message $message) use ($data, $info) {
                $fromMail = $info->from_mail;
                $fromName = $info->from_name;
                $message->to($data['to'])
                    ->subject($data['subject'])
                    ->from($fromMail, $fromName)
                    ->html($data['body'], 'text/html');
            });

            Session::flash('success', 'A mail has been sent to your email address');
        } catch (\Exception $e) {

            // Session::flash('error', $e->getMessage());
            Session::flash('error', 'Mail could not be sent!');
        }

        // store user email in session to use it later
        $request->session()->put('userEmail', $user->email);
        return redirect()->back();
    }
    //reset_password
    public function reset_password()
    {
        $misc = new MiscellaneousController();

        $language = $misc->getLanguage();

        $queryResult['seoInfo'] = $language->seoInfo()->select('meta_keywords_vendor_forget_password', 'meta_descriptions_vendor_forget_password')->first();

        $queryResult['bgImg'] = $misc->getBreadcrumb();
        return view('agent.auth.reset-password', $queryResult);
    }
    //update_password
    public function update_password(Request $request)
    {
        $rules = [
            'new_password' => 'required|confirmed',
            'new_password_confirmation' => 'required'
        ];

        $messages = [
            'new_password.confirmed' => 'Password confirmation failed.',
            'new_password_confirmation.required' => 'The confirm new password field is required.'
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        }

        $reset = DB::table('password_resets')->where('token', $request->token)->first();
        $email = $reset->email;

        $vendor = Agent::where('email',  $email)->first();

        $vendor->update([
            'password' => Hash::make($request->new_password)
        ]);
        DB::table('password_resets')->where('token', $request->token)->delete();
        Session::flash('success', 'Reset Your Password Successfully Completed.Please Login Now');

        return redirect()->route('agent.login');
    }
    public function changeTheme(Request $request)
    {
        Session::put('agent_theme_version', $request->agent_theme_version);
        return redirect()->back();
    }
}
