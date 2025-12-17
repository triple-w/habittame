<?php

namespace App\Http\Controllers\Agent;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Http\Requests\Project\ProjectUpdateRequest;
use App\Http\Requests\Project\StoreRequest;
use App\Http\Requests\Project\UpdateRequest;
use App\Models\Admin;
use App\Models\Agent;
use App\Models\BasicSettings\Basic;
use App\Models\Language;
use App\Models\Project\Project;
use App\Models\Project\ProjectAmenities;
use App\Models\Project\ProjectContent;
use App\Models\Project\ProjectFloorplanImage;
use App\Models\Project\ProjectGalleryImage;
use App\Models\Project\Spacification;
use App\Models\Project\SpacificationContent;
use App\Models\Vendor;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Mews\Purifier\Facades\Purifier;


class ProjectController extends Controller
{
    public function index(Request $request)
    {
        $data['langs'] = Language::all();

        if ($request->has('language')) {
            $language = Language::where('code', $request->language)->firstOrFail();
        } else {

            $language = Language::where('is_default', 1)->first();
        }
        $data['language'] = $language;
        $language_id = $language->id;
        $title = null;

        if (request()->filled('title')) {
            $title = $request->title;
        }

        $data['projects'] = Project::where('agent_id', Auth::guard('agent')->user()->id)
            ->join('project_contents', 'projects.id', 'project_contents.project_id')
            ->with([
                'proejctContents' => function ($q) use ($language_id) {
                    $q->where('language_id', $language_id);
                }, 'vendor'
            ])
            ->when($title, function ($query) use ($title, $language_id) {
                return $query->where([['project_contents.language_id', $language_id], ['project_contents.title', 'LIKE', '%' . $title . '%']]);
            })
            ->where('project_contents.language_id', $language_id)
            ->select('projects.*')
            ->orderBy('id', 'desc')
            ->paginate(10);
        return view('agent.project.index', $data);
    }

    public function create(Request $request)
    {
        $information = [];
        $languages = Language::get();
        $information['languages'] = $languages;

        // $information['aminities'] = ProjectAmenities::get();
        return view('agent.project.create', $information);
    }

    public function galleryImagesStore(Request $request)
    {
        $img = $request->file('file');
        $allowedExts = array('jpg', 'png', 'jpeg', 'svg', 'webp');
        $rules = [
            'file' => [
                function ($attribute, $value, $fail) use ($img, $allowedExts) {
                    $ext = $img->getClientOriginalExtension();
                    if (!in_array($ext, $allowedExts)) {
                        return $fail("Only png, jpg, jpeg images are allowed");
                    }
                },
            ]
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $validator->getMessageBag()->add('error', 'true');
            return response()->json($validator->errors());
        }
        $imageName = UploadFile::store(public_path('assets/img/project/gallery-images/'), $request->file('file'));

        $pi = new ProjectGalleryImage();
        if (!empty($request->project_id)) {
            $pi->project_id = $request->project_id;
        }
        $pi->image = $imageName;
        $pi->save();
        return response()->json(['status' => 'success', 'file_id' => $pi->id]);
    }

    public function galleryImageRmv(Request $request)
    {
        $pi = ProjectGalleryImage::findOrFail($request->fileid);
        $imageCount = ProjectGalleryImage::where('project_id', $pi->project_id)->get()->count();
        if ($imageCount > 1) {
            @unlink(public_path('assets/img/project/gallery-images/') . $pi->image);
            $pi->delete();
            return $pi->id;
        } else {
            return 'false';
        }
    }

    //imagedbrmv
    public function galleryImageDbrmv(Request $request)
    {
        $pi = ProjectGalleryImage::findOrFail($request->fileid);
        $imageCount = ProjectGalleryImage::where('project_id', $pi->project_id)->get()->count();
        if ($imageCount > 1) {
            @unlink(public_path('assets/img/project/gallery-images/') . $pi->image);
            $pi->delete();
            return $pi->id;
        } else {
            return 'false';
        }
    }


    public function floorPlanImagesStore(Request $request)
    {
        $img = $request->file('file');
        $allowedExts = array('jpg', 'png', 'jpeg', 'svg', 'webp');
        $rules = [
            'file' => [
                function ($attribute, $value, $fail) use ($img, $allowedExts) {
                    $ext = $img->getClientOriginalExtension();
                    if (!in_array($ext, $allowedExts)) {
                        return $fail("Only png, jpg, jpeg images are allowed");
                    }
                },
            ]
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $validator->getMessageBag()->add('error', 'true');
            return response()->json($validator->errors());
        }
        $imageName = UploadFile::store(public_path('assets/img/project/floor-paln-images/'), $request->file('file'));

        $pi = new ProjectFloorplanImage();
        if (!empty($request->project_id)) {
            $pi->project_id = $request->project_id;
        }
        $pi->image = $imageName;
        $pi->save();
        return response()->json(['status' => 'success', 'file_id' => $pi->id]);
    }
    public function floorPlanImageRmv(Request $request)
    {
        $pi = ProjectFloorplanImage::findOrFail($request->fileid);
        $imageCount = ProjectFloorplanImage::where('project_id', $pi->project_id)->get()->count();
        if ($imageCount > 1) {
            @unlink(public_path('assets/img/project/floor-paln-images/') . $pi->image);
            $pi->delete();
            return $pi->id;
        } else {
            return 'false';
        }
    }


    //imagedbrmv
    public function floorPlanImageDbrmv(Request $request)
    {
        $pi = ProjectFloorplanImage::findOrFail($request->fileid);
        $imageCount = ProjectFloorplanImage::where('project_id', $pi->project_id)->get()->count();
        if ($imageCount > 1) {
            @unlink(public_path('assets/img/project/floor-paln-images/') . $pi->image);
            $pi->delete();
            return $pi->id;
        } else {
            return 'false';
        }
    }


    public function store(StoreRequest $request)
    {
        DB::transaction(function () use ($request) {

            $featuredImgURL = $request->featured_image;
            if (request()->hasFile('featured_image')) {
                $featuredImgName = UploadFile::store(public_path('assets/img/project/featured'), $featuredImgURL);
            }
            $agent = Auth::guard('agent')->user();
            $bs = Basic::select('project_approval_status')->first();
            if ($bs->project_approval_status == 1) {
                $approveStatus = 0;
            } else {
                $approveStatus = 1;
            }
            $languages = Language::all();
            $project = Project::create([
                'vendor_id' =>  $agent->vendor_id,
                'agent_id' => $agent->id,
                'featured_image' => $featuredImgName,
                'min_price' => $request->min_price,
                'max_price' => $request->max_price,
                'featured' => $request->featured,
                'status' => $request->status,
                'latitude' => $request->latitude,
                'longitude' => $request->longitude,
                'approve_status' => $approveStatus,
            ]);

            $gallery_images = $request->gallery_images;
            if ($gallery_images) {
                $pis = ProjectGalleryImage::findOrFail($gallery_images);
                foreach ($pis as $key => $pi) {
                    $pi->project_id = $project->id;
                    $pi->save();
                }
            }

            $floor_plan_images = $request->floor_plan_images;
            if ($floor_plan_images) {
                $pis = ProjectFloorplanImage::findOrFail($floor_plan_images);
                foreach ($pis as $key => $pi) {
                    $pi->project_id = $project->id;
                    $pi->save();
                }
            }

            foreach ($languages as $language) {
                $projectContent = new ProjectContent();
                $projectContent->language_id = $language->id;
                $projectContent->project_id = $project->id;
                $projectContent->title = $request[$language->code . '_title'];
                $projectContent->slug = createSlug($request[$language->code . '_title']);

                // $projectContent->amenities = json_encode($request[$language->code . '_amenities']);
                $projectContent->address = $request[$language->code . '_address'];
                $projectContent->description = Purifier::clean($request[$language->code . '_description'], 'youtube');
                $projectContent->meta_keyword = $request[$language->code . '_meta_keyword'];
                $projectContent->meta_description = $request[$language->code . '_meta_description'];
                $projectContent->save();

                $label_datas = $request[$language->code . '_label'];
                foreach ($label_datas as $key => $data) {
                    if (!empty($request[$language->code . '_value'][$key])) {
                        $project_specification = Spacification::where([['project_id', $project->id], ['key', $key]])->first();
                        if (is_null($project_specification)) {
                            $project_specification = new Spacification();
                            $project_specification->project_id = $project->id;
                            $project_specification->key  = $key;
                            $project_specification->save();
                        }
                        $project_specification_content = new SpacificationContent();
                        $project_specification_content->language_id = $language->id;
                        $project_specification_content->project_spacification_id = $project_specification->id;
                        $project_specification_content->label = $data;
                        $project_specification_content->value = $request[$language->code . '_value'][$key];
                        $project_specification_content->save();
                    }
                }
            }
            $projectContent = ProjectContent::where('project_id', $project->id)->select('title')->first();
            if ($agent->vendor_id == 0) {
                $vendor = Admin::where('role_id', null)->first();
            } else {
                $vendor = $agent->vendor;
            }
            $this->mailToAdminForCreateProject($projectContent->title, $vendor);
        });
        Session::flash('success', 'New Property added successfully!');

        return Response::json(['status' => 'success'], 200);
    }


    public function updateStatus(Request $request)
    {
        $property = Project::findOrFail($request->projectId);

        if ($request->status == 1) {
            $property->update(['status' => 1]);

            Session::flash('success', 'Project Complete successfully');
        } else {
            $property->update(['status' => 0]);

            Session::flash('success', 'Project Under Construction.');
        }

        return redirect()->back();
    }

    public function edit($id)
    {
        $project = Project::with(['galleryImages', 'floorplanImages'])->where('agent_id', Auth::guard('agent')->user()->id)->findOrFail($id);
        $information['project'] = $project;
        $information['gallery_images'] = $project->galleryImages;
        $information['floor_plan_images'] = $project->floorplanImages;
        $information['languages'] = Language::all();

        // $information['allAminities'] = ProjectAmenities::get();
        $information['specifications'] = Spacification::where('project_id', $project->id)->get();

        return view('agent.project.edit', $information);
    }


    public function update(UpdateRequest $request, $id)
    {

        $languages = Language::all();

        $project = Project::where('agent_id', Auth::guard('agent')->user()->id)->findOrFail($request->project_id);

        $featuredImgName = $project->featured_image;

        if ($request->hasFile('featured_image')) {
            $featuredImgName = UploadFile::update('assets/img/project/featured/', $request->featured_image, $project->featured_image);
        }

        $project->update([
            'agent_id' => Auth::guard('agent')->user()->id,
            'featured_image' => $featuredImgName,
            'min_price' => $request->min_price,
            'max_price' => $request->max_price,
            'featured' => $request->featured,
            'status' => $request->status,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude
        ]);

        $d_project_specifications = Spacification::where('project_id', $request->project_id)->get();
        foreach ($d_project_specifications as $d_project_specification) {
            $d_project_specification_contents = SpacificationContent::where('project_spacification_id', $d_project_specification->id)->get();
            foreach ($d_project_specification_contents as $d_project_specification_content) {
                $d_project_specification_content->delete();
            }
            $d_project_specification->delete();
        }

        foreach ($languages as $language) {
            $projectContent =  ProjectContent::where('project_id', $request->project_id)->where('language_id', $language->id)->first();
            if (empty($projectContent)) {
                $projectContent = new ProjectContent();
            }
            $projectContent->language_id = $language->id;
            $projectContent->project_id = $project->id;
            $projectContent->title = $request[$language->code . '_title'];
            $projectContent->slug = createSlug($request[$language->code . '_title']);

            $projectContent->address = $request[$language->code . '_address'];
            // $projectContent->amenities = json_encode($request[$language->code . '_amenities']);
            $projectContent->description = Purifier::clean($request[$language->code . '_description'], 'youtube');
            $projectContent->meta_keyword = $request[$language->code . '_meta_keyword'];
            $projectContent->meta_description = $request[$language->code . '_meta_description'];
            $projectContent->save();

            $label_datas = $request[$language->code . '_label'];
            foreach ($label_datas as $key => $data) {
                if (!empty($request[$language->code . '_value'][$key])) {
                    $project_specification = Spacification::where([['project_id', $project->id], ['key', $key]])->first();
                    if (is_null($project_specification)) {
                        $project_specification = new Spacification();
                        $project_specification->project_id = $project->id;
                        $project_specification->key  = $key;
                        $project_specification->save();
                    }
                    $project_specification_content = new SpacificationContent();
                    $project_specification_content->language_id = $language->id;
                    $project_specification_content->project_spacification_id = $project_specification->id;
                    $project_specification_content->label = $data;
                    $project_specification_content->value = $request[$language->code . '_value'][$key];
                    $project_specification_content->save();
                }
            }
        }

        Session::flash('success', 'Project Updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function specificationDelete(Request $request)
    {
        try {
            $d_project_specification = Spacification::find($request->spacificationId); 
            $d_project_specification_contents = SpacificationContent::where('project_spacification_id', $d_project_specification->id)->get();
            foreach ($d_project_specification_contents as $d_project_specification_content) {
                $d_project_specification_content->delete();
            }
            $d_project_specification->delete();
          
            return Response::json(['status' => 'success'], 200);
        } catch (\Exception $e) {
            return Response::json(['status' => 'error'], 400);
        }
    }


    public function destroy(Request $request)
    {
        try {
            $this->deleteProject($request->project_id);
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong!');
            return redirect()->back();
        }

        Session::flash('success', 'Property deleted successfully!');
        return redirect()->back();
    }

    public function deleteProject($id)
    {

        $project = Project::find($id);


        if (!is_null($project->featured_image)) {
            @unlink(public_path('assets/img/project/featured/' . $project->featured_image));
        }

        $propertyGalleryImages  = $project->galleryImages()->get();
        foreach ($propertyGalleryImages  as  $image) {
            @unlink(public_path('assets/img/project/gallery-images/' . $image->image));
            $image->delete();
        }

        $projectFloorplanImages  = $project->floorplanImages()->get();
        foreach ($projectFloorplanImages  as  $image) {
            @unlink(public_path('assets/img/project/floor-paln-images/' . $image->image));
            $image->delete();
        }

        $projectTypes =  $project->projectTypes()->get();
        foreach ($projectTypes as $type) {
            $typeContents = $type->projectTypeContnents()->get();
            foreach ($typeContents as $content) {
                $content->delete();
            }
            $type->delete();
        }

        $specifications = $project->specifications()->get();
        foreach ($specifications as $specification) {
            $specificationContents = $specification->specificationContents()->get();
            foreach ($specificationContents as $sContent) {
                $sContent->delete();
            }
            $specification->delete();
        }

        $projectContents = $project->proejctContents()->get();
        foreach ($projectContents as $content) {
            $content->delete();
        }
        $project->delete();

        return;
    }

    public function bulkDestroy(Request $request)
    {
        $propertyIds = $request->ids;
        try {
            foreach ($propertyIds as $id) {
                $this->deleteProject($id);
            }
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong!');

            return redirect()->back();
        }

        Session::flash('success', 'Properties deleted successfully!');
        return response()->json(['status' => 'success'], 200);
    }
}
