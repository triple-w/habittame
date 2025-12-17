<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Helpers\BasicMailer;
use App\Http\Helpers\UploadFile;
use App\Http\Requests\Agent\RegisterRequest;
use App\Http\Requests\Agent\updateRequest;
use App\Models\Agent;
use App\Models\AgentInfo;
use App\Models\BasicSettings\Basic;
use App\Models\BasicSettings\MailTemplate;
use App\Models\Language;
use Auth;
use DB;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AgentController extends Controller
{
    public function index()
    {
        $agents = Agent::where('vendor_id', Auth::guard('vendor')->user()->id)->paginate(10);
        return view('vendors.agent.index', compact('agents'));
    }
    public function store(RegisterRequest $request)
    {
        DB::beginTransaction();
        $imageName = UploadFile::store(public_path('assets/img/agents/'), $request->file('image'));
        try {
            $agent =  Agent::create([
                'vendor_id' => Auth::guard('vendor')->user()->id,
                'username' => $request->username,
                'email' => $request->email,
                'image' => $imageName,
                'status' => 1,
                'password' => Hash::make($request->password)
            ]);

            $languages = Language::all();
            foreach ($languages as $lang) {
                AgentInfo::create([
                    'agent_id' => $agent->id,
                    'language_id' => $lang->id,
                    'first_name' => $request->first_name,
                    'last_name' => $request->last_name,
                ]);
            }
            DB::commit();
            $this->sendmailToAgent($request->username, $request->password, $request->email);
        } catch (\Exception $e) {
            DB::rollback();
            Session::flash('warning', 'Something went wrong.');
            return response()->json(['status' => 'error'], 200);
        }

        Session::flash('success', 'New agent added successfully!');

        return response()->json(['status' => 'success'], 200);
    }
    public function update(updateRequest $request)
    {
        $agent = Agent::where('vendor_id', Auth::guard('vendor')->user()->id)->find($request->id);

        if ($request->hasFile('image')) {
            $imageName = UploadFile::update(public_path('assets/img/agents/'), $request->file('image'), $agent->image);
        }

        $agent->update($request->except('image') + [
            'image' => $request->hasFile('image') ? $imageName : $agent->image
        ]);

        Session::flash('success', 'Agent updated successfully!');

        return response()->json(['status' => 'success'], 200);
    }

    //secrtet login
    public function secret_login($id)
    {
        Session::put('vendor_secret_login', 1);
        $agent = Agent::where('id', $id)->first();
        Auth::guard('agent')->login($agent);

        return redirect()->route('agent.dashboard');
    }
    public function sendmailToAgent($username, $password, $email)
    {
        // get the mail template info from db
        $mailTemplate = MailTemplate::query()->where('mail_type', '=', 'registered_agent')->first();
        $mailData['subject'] = $mailTemplate->mail_subject;
        $mailBody = $mailTemplate->mail_body;

        // get the website title info from db
        $info = Basic::select('website_title')->first();

        $websiteTitle = $info->website_title;

        $loginurl  = '<a href=' . route("agent.login") . '> Click Here  </a>';

        // replacing with actual data
        $mailBody = str_replace('{username}', $username, $mailBody);
        $mailBody = str_replace('{password}', $password, $mailBody);
        $mailBody = str_replace('{website_title}', $websiteTitle, $mailBody);
        $mailBody = str_replace('{login_url}', $loginurl, $mailBody);

        $mailData['body'] = $mailBody;

        $mailData['recipient'] = $email;
        BasicMailer::sendMail($mailData);

        return;
    }

    public function changeStatus(Request $request, $id)
    {
        $agent = Agent::where('vendor_id', Auth::guard('vendor')->user()->id)->findOrFail($id);
        $agent->status = $request->status;
        $agent->save();
        Session::flash('success', 'Agent status update successfully!');
        return redirect()->back();
    }

    public function destroy($id)
    {
        $agent = Agent::findOrFail($id);

        //agent infos 
        $agent_infos = $agent->agent_infos()->get();
        foreach ($agent_infos as $info) {
            $info->delete();
        }
        // all properties delete 
        $properties = $agent->properties()->get();
        foreach ($properties as $property) {

            if (!is_null($property->featured_image)) {
                @unlink(public_path('assets/img/property/featureds/' . $property->featured_image));
            }

            if (!is_null($property->floor_planning_image)) {
                @unlink(public_path('assets/img/property/plannings/' . $property->floor_planning_image));
            }
            if (!is_null($property->video_image)) {
                @unlink(public_path('assets/img/property/video/' . $property->video_image));
            }
            $property->propertyContents()->delete();

            $galleryImages = $property->galleryImages()->get();
            foreach ($galleryImages as $image) {
                @unlink(public_path('assets/img/property/slider-images/' . $image->image));
                $image->delete();
            }

            $property->proertyAmenities()->delete();

            $specifications = $property->specifications()->get();
            foreach ($specifications as  $specification) {
                $specification->specificationContents()->delete();
            }

            $featuredProperties = $property->featuredProperties()->get();

            foreach ($featuredProperties as $featured) {
                if ($featured->attachment != null) {
                    @unlink(public_path('assets/front/img/feature/attachment/' . $featured->attachment));
                }
                $featured->delete();
            }
            // delete wishlists
            $property->wishlists()->delete();

            $property->delete();
        }
        // all property message delete 
        $agent->property_messages()->delete();

        // all project delete 
        $projects = $agent->projects()->get();
        foreach ($projects as $project) {
            @unlink(public_path('assets/img/project/featured/' . $project->featured_image));
            $project->proejctContents()->delete();

            $projectGalleryImages = $project->galleryImages()->get();
            foreach ($projectGalleryImages as $image) {
                @unlink(public_path('assets/img/project/gallery-images/' . $image->image));
                $image->delete();
            }

            $projectFloorplanImages = $project->floorplanImages()->get();
            foreach ($projectFloorplanImages as $image) {
                @unlink(public_path('assets/img/project/floor-paln-images/' . $image->image));
                $image->delete();
            }

            $specifications = $project->specifications()->get();
            foreach ($specifications as  $specification) {
                $specification->specificationContents()->delete();
            }

            $projectTypes = $project->projectTypes()->get();
            foreach ($projectTypes as $type) {
                $type->projectTypeContnents()->delete();
                $type->delete();
            }

            $project->delete();
        }




        //finally delete the vendor
        @unlink(public_path('assets/img/agents/') . $agent->image);
        $agent->delete();

        return redirect()->back()->with('success', 'Agent delete successfully!');
    }
}
