<?php

namespace App\Http\Controllers\BackEnd\Project;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Project\Project;
use App\Models\Project\ProjectType;
use App\Models\Project\ProjectTypeContent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Validator;

class TypeController extends Controller
{
    public function index(Request $request, $id)
    {
        if ($request->has('language')) {
            $language = Language::where('code', $request->language)->firstOrFail();
        } else {

            $language = Language::where('is_default', 1)->first();
        }

        $data['langs'] = Language::all();

        $data['language'] = $language;
        $languages = Language::get();
        $data['languages'] = $languages;

        $language_id = $language->id;
        $project = Project::findOrFail($id);
        $data['project_id'] = $id;
        $data['vendor_id'] = $project->vendor_id;
        $data['types'] = ProjectType::where('project_id', $id)->paginate(10);
        return view('backend.project.type.index', $data);
    }

    public function store(Request $request)
    {
        $languages = Language::all();

        foreach ($languages as $language) {
            $rules[$language->code . '_name'] = 'required|max:255';
            $rules[$language->code . '_total_unit'] = 'required';
            $rules[$language->code . '_min_price'] = 'required';
            $rules[$language->code . '_min_area'] = 'required';

            $messages[$language->code . '_name.required'] = "The name field is required for " . $language->name . " language";
            $messages[$language->code . '_total_unit.required'] = "The total unit field is required for " . $language->name . " language";
            $messages[$language->code . '_min_price.required'] = "The min price field is required for " . $language->name . " language";
            $messages[$language->code . '_min_area.required'] = "The min area field is required for " . $language->name . " language";
        }


        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }
        DB::beginTransaction();
        try {
            $projectType = new ProjectType();
            $projectType->project_id = $request->project_id;
            $projectType->save();


            foreach ($languages as $language) {
                $projectTypeContent = new ProjectTypeContent();
                $projectTypeContent->project_type_id = $projectType->id;
                $projectTypeContent->language_id = $language->id;
                $projectTypeContent->name = $request[$language->code . '_name'];
                $projectTypeContent->unit = $request[$language->code . '_total_unit'];
                $projectTypeContent->min_area =  $request[$language->code . '_min_area'];
                $projectTypeContent->max_area =  $request[$language->code . '_max_area'];
                $projectTypeContent->min_price =  $request[$language->code . '_min_price'];
                $projectTypeContent->max_price =  $request[$language->code . '_max_price'];
                $projectTypeContent->save();
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();

            Session::flash('warning', 'Something went wrong!');
            return Response::json(['status' => 'success'], 200);
        }
        Session::flash('success', 'New Property Type successfully!');

        return Response::json(['status' => 'success'], 200);
    }


    public function update(Request $request)
    {
        $languages = Language::all();

        foreach ($languages as $language) {
            $rules[$language->code . '_name'] = 'required|max:255';
            $rules[$language->code . '_total_unit'] = 'required';
            $rules[$language->code . '_min_price'] = 'required';
            $rules[$language->code . '_min_area'] = 'required';

            $messages[$language->code . '_name.required'] = "The name field is required for " . $language->name . " language";
            $messages[$language->code . '_total_unit.required'] = "The total unit field is required for " . $language->name . " language";
            $messages[$language->code . '_min_price.required'] = "The min price field is required for " . $language->name . " language";
            $messages[$language->code . '_min_area.required'] = "The min area field is required for " . $language->name . " language";
        }


        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return Response::json([
                'errors' => $validator->getMessageBag()
            ], 400);
        }




        foreach ($languages as $language) {

            $projectType =  ProjectTypeContent::where('project_type_id', $request->type_id)->where('language_id', $language->id)->first();

            if (empty($projectType)) {
                $projectType = new ProjectTypeContent();
                $projectType->project_type_id =  $request->type_id;
                $projectType->language_id =  $language->id; 
            }
            $projectType->name = $request[$language->code . '_name'];
            $projectType->unit = $request[$language->code . '_total_unit'];
            $projectType->min_area =  $request[$language->code . '_min_area'];
            $projectType->max_area =  $request[$language->code . '_max_area'];
            $projectType->min_price =  $request[$language->code . '_min_price'];
            $projectType->max_price =  $request[$language->code . '_max_price'];
            $projectType->save();
        }

        Session::flash('success', 'Project Type  Updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function delete(Request $request)
    {
        try {
            $this->deleteType($request->id);
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong!');

            return redirect()->back();
        }

        Session::flash('success', 'Project type deleted successfully!');
        return redirect()->back();
    }

    public function deleteType($id)
    {
        $type = ProjectType::find($id);
        $typeContents =  $type->projectTypeContnents()->get();
        foreach ($typeContents as $content) {
            $content->delete();
        }
        $type->delete();
        return;
    }

    public function bulkDelete(Request $request)
    {
        $propertyIds = $request->ids;
        try {
            foreach ($propertyIds as $id) {
                $this->deleteType($id);
            }
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong!');

            return redirect()->back();
        }
        Session::flash('success', 'Project type deleted successfully!');
        return response()->json(['status' => 'success'], 200);
    }
}
