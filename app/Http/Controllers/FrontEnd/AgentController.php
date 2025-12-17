<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use App\Models\Agent;
use App\Models\AgentInfo;
use App\Models\BasicSettings\Basic;
use App\Models\HomePage\Section;
use App\Models\Project\Project;
use App\Models\Property\Property;
use App\Models\Property\PropertyCategory;
use Carbon\Carbon;
use Illuminate\Http\Request;

class AgentController extends Controller
{
    public function details(Request $request)
    {

        $misc = new MiscellaneousController();

        $language = $misc->getLanguage();
        $queryResult['language'] = $language;

        $queryResult['bgImg'] = $misc->getBreadcrumb();
        $queryResult['pageHeading'] = $misc->getPageHeading($language);


        $agent = Agent::query()
            ->leftJoin('vendors', 'agents.vendor_id', '=', 'vendors.id')
            ->leftJoin('memberships', function ($join) {
                $join->on('agents.vendor_id', '=', 'memberships.vendor_id')
                    ->where('memberships.status', '=', 1)
                    ->where('memberships.start_date', '<=', Carbon::now()->format('Y-m-d'))
                    ->where('memberships.expire_date', '>=', Carbon::now()->format('Y-m-d'));
            })

            ->where('agents.username', $request->username)->select('agents.*')->firstOrFail();

        $agentInfo = AgentInfo::where([['agent_id', $agent->id], ['language_id', $language->id]])->first();
        $queryResult['agentInfo'] = $agentInfo;
        $agent_id = $agent->id;

        $queryResult['agent'] = $agent;



        $queryResult['all_properties'] = Property::where([['properties.agent_id', $agent_id], ['properties.status', 1], ['properties.approve_status', 1]])
            ->where('property_contents.language_id', $language->id)
            ->join('property_contents', 'property_contents.property_id', 'properties.id')
            ->select('properties.*', 'property_contents.language_id')
            ->orderBy('properties.id', 'desc')
            ->get();
        $queryResult['all_projects'] = Project::where([['projects.agent_id', $agent_id], ['projects.approve_status', 1]])
            ->join('project_contents', 'project_contents.project_id', 'projects.id')
            ->where('project_contents.language_id', $language->id)
            ->select('projects.*', 'project_contents.language_id', 'project_contents.title', 'project_contents.slug', 'project_contents.address', 'project_contents.description')
            ->orderBy('id', 'desc')
            ->get();

        $uniqueCategoryIds = $queryResult['all_properties']->pluck('categoryContent.category_id')->unique();


        $queryResult['categories'] = PropertyCategory::with(['categoryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->where('status', 1)->whereIn('id', $uniqueCategoryIds)->get();

        $secInfo = Section::query()->select('subscribe_section_status')->first();
        $queryResult['secInfo'] = $secInfo;
        $queryResult['currencyInfo'] = $this->getCurrencyInfo();
        $queryResult['info'] = Basic::select('google_recaptcha_status')->first();
        return view('frontend.agent.details', $queryResult);
    }
}
