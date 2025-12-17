<?php

namespace App\Http\Middleware;

use App\Http\Helpers\VendorPermissionHelper;
use App\Models\Project\Project;
use App\Models\Property\Property;
use App\Models\Vendor;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckPackageLimits
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $feature, $method)
    {

        if (Auth::check()) {
            if (Auth::guard('vendor')->user()) {

                $vendor = Vendor::find(Auth::guard('vendor')->user()->id);
            } elseif (Auth::guard('agent')->user()) {
                $vendor = Vendor::find(Auth::guard('agent')->user()->vendor_id);
            }

            $package = VendorPermissionHelper::currentPackagePermission($vendor->id);

            if (empty($package)) {
                return redirect()->route('vendor.dashboard');
            }
            $userFeaturesCount = VendorPermissionHelper::userFeaturesCount($vendor->id);

            if ($method == 'store') {

                if ($feature == 'agent') {

                    if (($package->number_of_agent > $userFeaturesCount['agents'] || $package->number_of_agent == 999999) && $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }

                if ($feature == 'property') {

                    if (($package->number_of_property > $userFeaturesCount['properties'] || $package->number_of_property == 999999) && $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }

                if ($feature == 'project') {
                    if (($package->number_of_projects > $userFeaturesCount['projects'] || $package->number_of_projects == 999999) && $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }
                if ($feature == 'projectType') {
                    $project = Project::with(['projectTypes'])->where('vendor_id', $vendor->id)->find($request->project_id);
                    $projectCount = $project->projectTypes()->count();
                    if (($package->number_of_project_types > $projectCount || $package->number_of_project_types == 999999) &&  $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }
            }

            if ($method == 'update') {
                if ($feature == 'agent') {

                    if (($package->number_of_agent >= $userFeaturesCount['agents'] || $package->number_of_agent == 999999) && $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }

                if ($feature == 'property') {

                    if (($package->number_of_property >= $userFeaturesCount['properties'] || $package->number_of_property == 999999) && $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }

                if ($feature == 'project') {
                    if (($package->number_of_projects >= $userFeaturesCount['projects'] || $package->number_of_projects == 999999) && $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }
                if ($feature == 'projectType') {
                    $project = Project::with(['projectTypes'])->where('vendor_id', $vendor->id)->find($request->project_id);
                    $projectCount = $project->projectTypes()->count();
                    if (($package->number_of_project_types >= $projectCount || $package->number_of_project_types == 999999) &&  $this->checkFeaturesNotDowngraded($vendor->id, $feature, $package, $userFeaturesCount, $method)) {
                        return $next($request);
                    } else {
                        return response()->json('downgrade');
                    }
                }
            }
        }
    }
    private function checkFeaturesNotDowngraded($vendorId, $feature, $package, $userFeaturesCount, $method)
    {
        $return = true;

        if ($feature != 'agent') {
            if ($package->number_of_agent != 999999 && $package->number_of_agent < $userFeaturesCount['agents']) {
                return  $return = false;
            }
        }
        if ($feature != 'property') {
            if ($package->number_of_property != 999999 && $package->number_of_property < $userFeaturesCount['properties']) {
                return  $return = false;
            }
        }
        if ($feature != 'project') {
            if ($package->number_of_property != 999999 && $package->number_of_projects < $userFeaturesCount['projects']) {
                return  $return = false;
            }
        }

        // images and additional specofication check 
        $projects = Project::with(['galleryImages', 'floorplanImages', 'specifications', 'projectTypes'])->where('vendor_id', $vendorId)->get();
        $properties = Property::with(['galleryImages', 'specifications'])->where('vendor_id', $vendorId)->get();

       
        if ($properties) {
            foreach ($properties as $property) {
                $propertytGalleryImages = $property->galleryImages()->count();
                $propertytSpecifications = $property->specifications()->count();

                if ($package->number_of_property_gallery_images != 999999 && ($property->galleryImages && $package->number_of_property_gallery_images < $propertytGalleryImages)) {
                    return  $return = false;
                } elseif ($package->number_of_property_adittionl_specifications != 999999 && ($property->specifications && $package->number_of_property_adittionl_specifications < $propertytSpecifications)) {
                    return  $return = false;
                }
            }
        }

        if ($projects) {
            foreach ($projects as $project) {
                $projectGalleryImages = $project->galleryImages()->count();
                $projectSpecifications = $project->specifications()->count();
                $projectTypes = $project->projectTypes()->get();
                $projectTypeCount = count($projectTypes);


                if ($package->number_of_project_gallery_images != 999999 && ($project->galleryImages && $package->number_of_project_gallery_images < $projectGalleryImages)) {
                    return  $return = false;
                } elseif ($package->number_of_project_additionl_specifications != 999999 && ($project->specifications && $package->number_of_project_additionl_specifications < $projectSpecifications)) {
                    return  $return = false;
                } elseif ($package->number_of_project_types != 999999 && ($project->projectTypes && $package->number_of_project_types < $projectTypeCount)) {
                    return  $return = false;
                }
            }
        }

        return $return;
    }
}
