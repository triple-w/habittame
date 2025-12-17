<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Project\Project;
use App\Models\Project\ProjectAmenities;
use App\Models\Project\ProjectContent;
use App\Models\Project\ProjectTypeContent;
use Auth;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function index(Request $request)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $information['seoInfo'] = $language->seoInfo()->select('meta_keyword_projects', 'meta_description_projects')->first();
        $information['bgImg'] = $misc->getBreadcrumb();
        $information['pageHeading'] = $misc->getPageHeading($language);

        $title = $location =   null;
        if ($request->filled('title') && $request->filled('title')) {
            $title =  $request->title;
        }
        if ($request->filled('location') && $request->filled('location')) {
            $location =  $request->location;
        }
        if ($request->filled('sort')) {
            if ($request['sort'] == 'new') {
                $order_by_column = 'projects.id';
                $order = 'desc';
            } elseif ($request['sort'] == 'old') {
                $order_by_column = 'projects.id';
                $order = 'asc';
            } elseif ($request['sort'] == 'high-to-low') {
                $order_by_column = 'projects.min_price';
                $order = 'desc';
            } elseif ($request['sort'] == 'low-to-high') {
                $order_by_column = 'projects.min_price';
                $order = 'asc';
            } else {
                $order_by_column = 'projects.id';
                $order = 'desc';
            }
        } else {
            $order_by_column = 'projects.id';
            $order = 'desc';
        }

        $projects  = Project::where('projects.approve_status', 1)->join('project_contents', 'projects.id', 'project_contents.project_id')
            ->when('projects.vendor_id' != 0, function ($query) {

                $query->leftJoin('memberships', 'projects.vendor_id', '=', 'memberships.vendor_id')
                    ->where(function ($query) {
                        $query->where([
                            ['memberships.status', '=', 1],
                            ['memberships.start_date', '<=', now()->format('Y-m-d')],
                            ['memberships.expire_date', '>=', now()->format('Y-m-d')],
                        ])->orWhere('projects.vendor_id', '=', 0);
                    });
            })
            ->when('projects.vendor_id' != 0, function ($query) {
                return $query->leftJoin('vendors', 'projects.vendor_id', '=', 'vendors.id')
                    ->where(function ($query) {
                        $query->where('vendors.status', '=', 1)->orWhere('projects.vendor_id', '=', 0);
                    });
            })
            ->where('project_contents.language_id', $language->id)
            ->when($title, function ($query) use ($title) {
                return $query->where('project_contents.title', 'LIKE', '%' . $title . '%');
            })
            ->when($location, function ($query) use ($location) {
                return $query->where('project_contents.address', 'LIKE', '%' . $location . '%');
            })
            ->select('projects.*',  'project_contents.title', 'project_contents.slug', 'project_contents.address')
            ->orderBy($order_by_column, $order)
            ->paginate(6);
        $information['projects'] = $projects;
        $information['contents'] = $projects;


        return view('frontend.project.index', $information);
    }

    public function details(Request $request, $slug)
    {
        $misc = new MiscellaneousController();
        $language = $misc->getLanguage();
        $information['language'] = $language;
        $information['bgImg'] = $misc->getBreadcrumb();
        $information['pageHeading'] = $misc->getPageHeading($language);
        $projectContent = ProjectContent::where('slug', $slug)->firstOrFail();
        $project = Project::query()
            ->where('projects.approve_status', 1)
            ->where('projects.id', $projectContent->project_id)
            ->where('project_contents.language_id', $language->id)
            ->join('project_contents', 'projects.id', 'project_contents.project_id')
            ->when('projects.vendor_id' != 0, function ($query) {

                $query->leftJoin('memberships', 'projects.vendor_id', '=', 'memberships.vendor_id')
                    ->where(function ($query) {
                        $query->where([
                            ['memberships.status', '=', 1],
                            ['memberships.start_date', '<=', now()->format('Y-m-d')],
                            ['memberships.expire_date', '>=', now()->format('Y-m-d')],
                        ])->orWhere('projects.vendor_id', '=', 0);
                    });
            })
            ->when('projects.vendor_id' != 0, function ($query) {
                return $query->leftJoin('vendors', 'projects.vendor_id', '=', 'vendors.id')
                    ->where(function ($query) {
                        $query->where('vendors.status', '=', 1)->orWhere('projects.vendor_id', '=', 0);
                    });
            })

            ->select('projects.*', 'project_contents.id as contentId', 'project_contents.title', 'project_contents.slug', 'project_contents.address', 'project_contents.language_id', 'project_contents.description', 'project_contents.meta_keyword', 'project_contents.meta_description')

            ->with(['projectTypes', 'galleryImages', 'projectTypeContents' => function ($q) use ($language) {
                $q->where('language_id', $language->id);
            }, 'floorplanImages', 'specifications'])
            ->firstOrFail();
        if ($project->vendor_id == 0) {

            $vendor = Admin::where('role_id', null)->select('username')->first();
            $information['username'] = $vendor->username;
        }
        $information['project'] = $project;
        $information['floorPlanImages'] = $information['project']->floorplanImages;
        $information['galleryImages'] =  $information['project']->galleryImages;

        $information['bgImg'] = $misc->getBreadcrumb();
        return view('frontend.project.details', $information);
    }
}
