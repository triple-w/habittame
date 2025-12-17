<?php

namespace App\Http\Controllers\Agent;

use App\Http\Controllers\Controller;
use App\Http\Helpers\UploadFile;
use App\Http\Requests\Property\PropertyStoreRequest;
use App\Http\Requests\Property\PropertyUpdateRequest;
use App\Http\Requests\Property\StoreRequest;
use App\Http\Requests\Property\UpdateRequest;
use App\Models\Admin;
use App\Models\Agent;
use App\Models\Amenity;
use App\Models\BasicSettings\Basic;
use App\Models\Language;
use App\Models\Property\City;
use App\Models\Property\Content;
use App\Models\Property\Country;
use App\Models\Property\Property;
use App\Models\Property\PropertyAmenity;
use App\Models\Property\PropertyCategory;
use App\Models\Property\PropertyContact;
use App\Models\Property\PropertySliderImage;
use App\Models\Property\Spacification;
use App\Models\Property\SpacificationCotent;
use App\Models\Property\State;
use App\Models\Vendor;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Purifier;

class PropertyController extends Controller
{
    public function type(Request $request)
    {
        $data['commertialCount'] = Property::where([['type', 'commercial'], ['agent_id', Auth::guard('agent')->user()->id]])->count();
        $data['residentialCount'] = Property::where([['type', 'residential'], ['agent_id', Auth::guard('agent')->user()->id]])->count();
        return view('agent.property.type', $data);
    }
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

        $data['properties'] = Property::where('agent_id', Auth::guard('agent')->user()->id)
            ->join('property_contents', 'properties.id', 'property_contents.property_id')
            ->with([
                'propertyContents' => function ($q) use ($language_id) {
                    $q->where('language_id', $language_id);
                },
                'vendor', 'cityContent' => function ($q) use ($language) {
                    $q->where('language_id', $language->id);
                }
            ])
            ->when($title, function ($query) use ($title, $language_id) {
                return $query->where('property_contents.title', 'LIKE', '%' . $title . '%');
            })
            ->where('property_contents.language_id', $language_id)
            ->select('properties.*')
            ->orderBy('id', 'desc')
            ->paginate(10);

        return view('agent.property.index', $data);
    }
    public function create(Request $request)
    {
        $information = [];
        $language = Language::where('is_default', 1)->first();
        $languages = Language::get();
        $information['languages'] = $languages;
        $information['propertyCategories'] = PropertyCategory::where([['type', $request->type], ['status', 1]])->with(['categoryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['propertyCountries'] = Country::with(['countryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['states'] = State::with(['stateContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['cities'] = City::where('status', 1)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['amenities'] = Amenity::with(['amenityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->where('status', 1)->get();
        return view('agent.property.create', $information);
    }
    public function updateFeatured(Request $request)
    {


        return redirect()->back();
    }

    public function imagesstore(Request $request)
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
        $imageName = UploadFile::store(public_path('assets/img/property/slider-images/'), $request->file('file'));

        $pi = new PropertySliderImage();
        if (!empty($request->property_id)) {
            $pi->property_id = $request->property_id;
        }
        $pi->image = $imageName;
        $pi->save();
        return response()->json(['status' => 'success', 'file_id' => $pi->id]);
    }
    public function imagermv(Request $request)
    {

        $pi = PropertySliderImage::findOrFail($request->fileid);
        $imageCount = PropertySliderImage::where('property_id', $pi->property_id)->get()->count();
        if ($imageCount > 1) {
            @unlink(public_path('assets/img/property/slider-images/') . $pi->image);
            $pi->delete();
            return $pi->id;
        } else {
            return 'false';
        }
    }

    //imagedbrmv
    public function imagedbrmv(Request $request)
    {
        $pi = PropertySliderImage::findOrFail($request->fileid);
        $imageCount = PropertySliderImage::where('property_id', $pi->property_id)->get()->count();
        if ($imageCount > 1) {
            @unlink(public_path('assets/img/property/slider-images/') . $pi->image);
            $pi->delete();
            return $pi->id;
        } else {
            return 'false';
        }
    }
    public function store(StoreRequest $request)
    {
        DB::transaction(function () use ($request) {
            $agent = Agent::findorFail(Auth::guard('agent')->user()->id);

            $featuredImgURL = $request->featured_image;
            if (request()->hasFile('featured_image')) {
                $featuredImgName = UploadFile::store(public_path('assets/img/property/featureds'), $featuredImgURL);
            }

            $languages = Language::all();

            $floorPlanningImage = null;
            $videoImage = null;
            if (request()->hasFile('floor_planning_image')) {
                $floorPlanningImage = UploadFile::store(public_path('assets/img/property/plannings'), $request->floor_planning_image);
            }
            if ($request->hasFile('video_image')) {
                $videoImage = UploadFile::store('assets/img/property/video/', $request->video_image);
            }
            $bs = Basic::select('property_approval_status')->first();
            if ($bs->property_approval_status == 1) {
                $approveStatus = 0;
            } else {
                $approveStatus = 1;
            }
            $property = Property::create([
                'vendor_id' => $agent->vendor->id ?? 0,
                'agent_id' =>  $agent->id,
                'category_id' => $request->category_id,
                'country_id' => $request->country_id,
                'state_id' => $request->state_id,
                'city_id' => $request->city_id,
                'featured_image' => $featuredImgName,
                'floor_planning_image' => $floorPlanningImage,
                'video_image' => $videoImage,
                'price' => $request->price,
                'purpose' => $request->purpose,
                'type' => $request->type,
                'beds' => $request->beds,
                'bath' => $request->bath,
                'area' => $request->area,
                'video_url' => $request->video_url,
                'status' => $request->status,
                'latitude' => $request->latitude,
                'longitude' => $request->longitude,
                'approve_status' => $approveStatus,

            ]);

            $slders = $request->slider_images;
            if ($slders) {
                $pis = PropertySliderImage::findOrFail($slders);
                foreach ($pis as $key => $pi) {
                    $pi->property_id = $property->id;
                    $pi->save();
                }
            }

            if ($request->has('amenities')) {
                foreach ($request->amenities as $amenity) {
                    PropertyAmenity::create([
                        'property_id' => $property->id,
                        'amenity_id' => $amenity
                    ]);
                }
            }

            foreach ($languages as $language) {
                $propertyContent = new Content();
                $propertyContent->language_id = $language->id;
                $propertyContent->property_id = $property->id;
                $propertyContent->title = $request[$language->code . '_title'];
                $propertyContent->slug = createSlug($request[$language->code . '_title']);
                $propertyContent->address = $request[$language->code . '_address'];
                $propertyContent->description = Purifier::clean($request[$language->code . '_description'], 'youtube');
                $propertyContent->meta_keyword = $request[$language->code . '_meta_keyword'];
                $propertyContent->meta_description = $request[$language->code . '_meta_description'];
                $propertyContent->save();

                $label_datas = $request[$language->code . '_label'];
                foreach ($label_datas as $key => $data) {
                    if (!empty($request[$language->code . '_value'][$key])) {
                        $property_specification = Spacification::where([['property_id', $property->id], ['key', $key]])->first();
                        if (is_null($property_specification)) {
                            $property_specification = new Spacification();
                            $property_specification->property_id = $property->id;
                            $property_specification->key  = $key;
                            $property_specification->save();
                        }
                        $property_specification_content = new SpacificationCotent();
                        $property_specification_content->language_id = $language->id;
                        $property_specification_content->property_spacification_id = $property_specification->id;
                        $property_specification_content->label = $data;
                        $property_specification_content->value = $request[$language->code . '_value'][$key];
                        $property_specification_content->save();
                    }
                }
            }
            $propertyContent = Content::where('property_id', $property->id)->select('title')->first();
            if ($agent->vendor_id == 0) {
                $vendor = Admin::where('role_id', null)->first();
            } else {
                $vendor = $agent->vendor;
            }
            $this->mailToAdminForCreateProperty($propertyContent->title, $vendor);
        });
        Session::flash('success', 'New Property added successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function updateStatus(Request $request)
    {
        $property = Property::findOrFail($request->propertyId);

        if ($request->status == 1) {
            $property->update(['status' => 1]);

            Session::flash('success', 'Property Active successfully!');
        } else {
            $property->update(['status' => 0]);

            Session::flash('success', 'Property Inactive  successfully!');
        }

        return redirect()->back();
    }
    public function edit($id)
    {
        $property = Property::with('galleryImages')->where('agent_id', Auth::guard('agent')->user()->id)->findOrFail($id);
        $information['property'] = $property;
        $information['galleryImages'] = $property->galleryImages;
        $information['languages'] = Language::all();
        $language = Language::where('is_default', 1)->first();
        $information['propertyCategories'] = PropertyCategory::where([['type', $property->type], ['status', 1]])->with(['categoryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['propertyCountries'] = Country::with(['countryContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['propertyStates'] = State::where('country_id', $property->country_id)->with(['stateContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();

        $information['propertyCities'] = City::where('state_id', $property->state_id)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $information['propertyAmenities'] = PropertyAmenity::where('property_id', $property->id)->get();
        $information['amenities'] = Amenity::with(['amenityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->where('status', 1)->get();
        $information['specifications'] = Spacification::where('property_id', $property->id)->get();

        return view('agent.property.edit', $information);
    }

    public function update(UpdateRequest $request, $id)
    {

        DB::transaction(
            function () use ($request, $id) {
                $languages = Language::all();

                $property = Property::where('agent_id', Auth::guard('agent')->user()->id)->findOrFail($request->property_id);


                $featuredImgName = $property->featured_image;
                $floorPlanningImage = $property->floor_planning_image;
                $videoImage = $property->video_image; 

                if ($request->hasFile('featured_image')) {
                    $featuredImgName = UploadFile::update('assets/img/property/featureds', $request->featured_image, $property->featured_image);
                }

                if ($request->hasFile('floor_planning_image')) {

                    $floorPlanningImage = UploadFile::update('assets/img/property/plannings', $request->floor_planning_image, $property->floor_planning_image);
                } 
                if ($request->hasFile('video_image')) {
                    $videoImage = UploadFile::update('assets/img/property/video/', $request->video_image, $property->video_image);
                } 

                $property->update([
                    'category_id' => $request->category_id,
                    'country_id' => $request->country_id,
                    'state_id' => $request->state_id,
                    'city_id' => $request->city_id,
                    'featured_image' => $featuredImgName,
                    'floor_planning_image' => $floorPlanningImage,
                    'video_image' => $videoImage,
                    'price' => $request->price,
                    'purpose' => $request->purpose,
                    'type' => $request->type,
                    'beds' => $request->beds,
                    'bath' => $request->bath,
                    'area' => $request->area,
                    'video_url' => $request->video_url,
                    'status' => $request->status,
                    'latitude' => $request->latitude,
                    'longitude' => $request->longitude
                ]);

                $d_property_specifications = Spacification::where('property_id', $request->property_id)->get();
                foreach ($d_property_specifications as $d_property_specification) {
                    $d_property_specification_contents = SpacificationCotent::where('property_spacification_id', $d_property_specification->id)->get();
                    foreach ($d_property_specification_contents as $d_property_specification_content) {
                        $d_property_specification_content->delete();
                    }
                    $d_property_specification->delete();
                }

                if ($request->has('amenities')) {
                    $property->proertyAmenities()->delete();
                    foreach ($request->amenities as $amenity) {
                        PropertyAmenity::create([
                            'property_id' => $property->id,
                            'amenity_id' => $amenity
                        ]);
                    }
                }


                foreach ($languages as $language) {
                    $propertyContent =  Content::where('property_id', $request->property_id)->where('language_id', $language->id)->first();

                    if (empty($propertyContent)) {
                        $propertyContent = new Content();
                    }

                    $propertyContent->language_id = $language->id;
                    $propertyContent->property_id = $property->id;
                    $propertyContent->title = $request[$language->code . '_title'];
                    $propertyContent->slug = createSlug($request[$language->code . '_title']);
                    $propertyContent->address = $request[$language->code . '_address'];
                    $propertyContent->description = Purifier::clean($request[$language->code . '_description'], 'youtube');
                    $propertyContent->meta_keyword = $request[$language->code . '_meta_keyword'];
                    $propertyContent->meta_description = $request[$language->code . '_meta_description'];
                    $propertyContent->save();

                    $label_datas = $request[$language->code . '_label'];
                    foreach ($label_datas as $key => $data) {
                        if (!empty($request[$language->code . '_value'][$key])) {
                            $property_specification = Spacification::where([['property_id', $property->id], ['key', $key]])->first();
                            if (is_null($property_specification)) {
                                $property_specification = new Spacification();
                                $property_specification->property_id = $property->id;
                                $property_specification->key  = $key;
                                $property_specification->save();
                            }
                            $property_specification_content = new SpacificationCotent();
                            $property_specification_content->language_id = $language->id;
                            $property_specification_content->property_spacification_id = $property_specification->id;
                            $property_specification_content->label = $data;
                            $property_specification_content->value = $request[$language->code . '_value'][$key];
                            $property_specification_content->save();
                        }
                    }
                }
            }
        );
        Session::flash('success', 'Property Updated successfully!');

        return Response::json(['status' => 'success'], 200);
    }

    public function messages()
    {
        $messages = PropertyContact::with('property')->where('agent_id', Auth::guard('agent')->user()->id)->latest()->get();
        return view('agent.property.message', compact('messages'));
    }
    public function destroyMessage(Request $request)
    {
        $message = PropertyContact::where('agent_id', Auth::guard('agent')->user()->id)->find($request->message_id);
        if ($message) {

            $message->delete();
        } else {
            Session::flash('warning', 'Something went wrong!');
            return redirect()->back();
        }
        Session::flash('success', 'Message deleted successfully');
        return redirect()->back();
    }

    public function getStateCities(Request $request)
    {
        $language = Language::where('is_default', 1)->first();
        $states = State::where('country_id', $request->id)->with(['cities', 'stateContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        $cities = City::where('country_id', $request->id)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        return Response::json(['states' => $states, 'cities' => $cities], 200);
    }
    public function getCities(Request $request)
    {
        $language = Language::where('is_default', 1)->first();
        $cities = City::where('state_id', $request->state_id)->with(['cityContent' => function ($q) use ($language) {
            $q->where('language_id', $language->id);
        }])->get();
        return Response::json(['cities' => $cities], 200);
    }


    public function specificationDelete(Request $request)
    {
        try {
            $d_project_specification = Spacification::find($request->spacificationId); 
            $d_project_specification_contents = SpacificationCotent::where('property_spacification_id', $d_project_specification->id)->get();
            foreach ($d_project_specification_contents as $d_project_specification_content) {
                $d_project_specification_content->delete();
            }
            $d_project_specification->delete();
          
            return Response::json(['status' => 'success'], 200);
        } catch (\Exception $e) {
            return Response::json(['status' => 'error'], 400);
        }
    }
    public function delete(Request $request)
    {

        try {
            $this->deleteProperty($request->property_id);
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong!');

            return redirect()->back();
        }

        Session::flash('success', 'Property deleted successfully!');
        return redirect()->back();
    }

    public function deleteProperty($id)
    {

        $property = Property::find($id);

        if (!is_null($property->featured_image)) {
            @unlink(public_path('assets/img/property/featureds/' . $property->featured_image));
        }

        if (!is_null($property->floor_planning_image)) {
            @unlink(public_path('assets/img/property/plannings/' . $property->floor_planning_image));
        }
        if (!is_null($property->video_image)) {
            @unlink(public_path('assets/img/property/video/' . $property->video_image));
        }

        $propertySliderImages  = $property->galleryImages()->get();
        foreach ($propertySliderImages  as  $image) {

            @unlink(public_path('assets/img/property/slider-images/' . $image->image));
            $image->delete();
        }

        $property->proertyAmenities()->delete();

        $specifications = $property->specifications()->get();
        foreach ($specifications as $specification) {
            $specificationContents = $specification->specificationContents()->get();
            foreach ($specificationContents as $sContent) {

                $sContent->delete();
            }
            $specification->delete();
        }

        $propertyContents = $property->propertyContents()->get();

        foreach ($propertyContents as $content) {

            $content->delete();
        }
        $property->propertyMessages()->delete();
        $property->featuredProperties()->delete();
        // delete wishlists
        $property->wishlists()->delete();

        $property->delete();

        return;
    }

    public function bulkDelete(Request $request)
    {

        $propertyIds = $request->ids;
        try {
            foreach ($propertyIds as $id) {
                $this->deleteProperty($id);
            }
        } catch (\Exception $e) {
            Session::flash('warning', 'Something went wrong!');

            return redirect()->back();
        }
        Session::flash('success', 'Properties deleted successfully!');
        return response()->json(['status' => 'success'], 200);
    }
}
