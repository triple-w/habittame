@extends('vendors.layout')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Edit Project') }}</h4>
        <ul class="breadcrumbs">
            <li class="nav-home">
                <a href="{{ route('vendor.dashboard') }}">
                    <i class="flaticon-home"></i>
                </a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Project Management') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Edit Project') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title d-inline-block">{{ __('Edit Project') }}</div>
                    <a class="btn btn-info btn-sm float-right d-inline-block"
                        href="{{ route('vendor.project_management.projects', ['language' => $defaultLang->code]) }}">
                        <span class="btn-label">
                            <i class="fas fa-backward"></i>
                        </span>
                        {{ __('Back') }}
                    </a>
                    @php
                        $dContent = App\Models\Project\ProjectContent::where('project_id', $project->id)
                            ->where('language_id', $defaultLang->id)
                            ->first();
                        $slug = !empty($dContent) ? $dContent->slug : '';
                    @endphp
                    @if ($dContent)
                        <a class="btn btn-success btn-sm float-right mr-1 d-inline-block"
                            href="{{ route('frontend.projects.details', ['slug' => $slug, 'id' => $project->id]) }}"
                            target="_blank">
                            <span class="btn-label">
                                <i class="fas fa-eye"></i>
                            </span>
                            {{ __('Preview') }}
                        </a>
                    @endif

                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="alert alert-danger pb-1 dis-none" id="carErrors">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <ul></ul>
                            </div>


                            <div class="row">

                                <div class="col-lg-6">
                                    <div class="row">
                                        @if (count($gallery_images) > $currentPackage->number_of_project_gallery_images)
                                            <div class="col-lg-12">
                                                <div class="alert alert-danger">
                                                    {{ __('You can upload maximum ' . $currentPackage->number_of_project_gallery_images . ' gallery images under one project. You need to delete ' . count($gallery_images) - $currentPackage->number_of_project_gallery_images . ' gallery images, then you can edit this project.') }}
                                                </div>
                                            </div>
                                        @endif
                                    </div>
                                    <label for="" class="mb-2"><strong>{{ __('Gallery Images') }}
                                            **</strong></label>

                                    <table class="table table-striped" id="imgtable">

                                        @foreach ($gallery_images as $item)
                                            <tr class="trdb table-row" id="trdb{{ $item->id }}">
                                                <td>
                                                    <div class="">
                                                        <img class="thumb-preview wf-150"
                                                            src="{{ asset('assets/img/project/gallery-images/' . $item->image) }}"
                                                            alt="Ad Image">
                                                    </div>
                                                </td>
                                                <td>
                                                    <i class="fa fa-times rmvbtndb" data-indb="{{ $item->id }}"></i>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>



                                    <form action="{{ route('vendor.project.gallery_image_store') }}" id="my-dropzone"
                                        enctype="multipart/formdata" class="dropzone create">
                                        @csrf
                                        <div class="fallback">
                                            <input name="file" type="file" multiple />
                                        </div>
                                        <input type="hidden" value="{{ $project->id }}" name="project_id">
                                    </form>
                                    <p class="em text-danger mb-0" id="errgallery_images"></p>

                                </div>

                                <div class="col-lg-6">
                                    <label for="" class="mb-2"><strong>{{ __('Floor Plan Images') }}
                                            **</strong></label>
                                    <table class="table table-striped" id="imgtable">

                                        @foreach ($floor_plan_images as $item)
                                            <tr class="trdb table-row" id="trdb{{ $item->id }}">
                                                <td>
                                                    <div class="">
                                                        <img class="thumb-preview wf-150"
                                                            src="{{ asset('assets/img/project/floor-paln-images/' . $item->image) }}"
                                                            alt="Ad Image">
                                                    </div>
                                                </td>
                                                <td>
                                                    <i class="fa fa-times rmvbtndb2" data-indb="{{ $item->id }}"></i>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>

                                    <form action="{{ route('vendor.project.floor_plan_image_store') }}" id="my-dropzone2"
                                        enctype="multipart/formdata" class="dropzone create">
                                        @csrf
                                        <div class="fallback">
                                            <input name="file" type="file" multiple />
                                        </div>
                                        <input type="hidden" value="{{ $project->id }}" name="project_id">
                                    </form>
                                    <p class="em text-danger mb-0" id="errfloor_plan_images"></p>


                                </div>
                            </div>

                            <form id="carForm"
                                action="{{ route('vendor.project_management.update_project', $project->id) }}"
                                method="POST" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $project->id }}">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">{{ __('Featured Image') . '*' }}</label>
                                            <br>
                                            <div class="thumb-preview">
                                                <img src="{{ $project->featured_image ? asset('assets/img/project/featured/' . $project->featured_image) : asset('assets/admin/img/noimage.jpg') }}"
                                                    alt="..." class="uploaded-img">
                                            </div>
                                            <div class="mt-3">
                                                <div role="button" class="btn btn-primary btn-sm upload-btn">
                                                    {{ __('Choose Image') }}
                                                    <input type="file" class="img-input" name="featured_image">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Min Price') . ' (' . $settings->base_currency_text . ')' }}
                                                *</label>
                                            <input type="number" class="form-control" name="min_price"
                                                placeholder="Enter Minimum Price" value="{{ $project->min_price }}">
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Max Price') . ' (' . $settings->base_currency_text . ')' }}
                                            </label>
                                            <input type="number" class="form-control" name="max_price"
                                                placeholder="Enter Maximum Price" value="{{ $project->max_price }}">
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Status') }} *</label>
                                            <select name="status" id="" class="form-control">
                                                <option {{ $project->status == 1 ? 'selected' : '' }} value="1">
                                                    {{ __('Complete') }}</option>
                                                <option {{ $project->status == 0 ? 'selected' : '' }} value="0">
                                                    {{ __('Under Construction') }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Latitude') }} </label>
                                            <input type="text" class="form-control" value="{{ $project->latitude }}"
                                                name="latitude" placeholder="Enter Latitude">
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Longitude') }} </label>
                                            <input type="text" class="form-control" value="{{ $project->longitude }}"
                                                name="longitude" placeholder="Enter Longitude">
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">{{ __('Agent') }}</label>
                                            <select name="agent_id" class="form-control js-example-basic-single2">
                                                <option value=" " selected>{{ __('Please Select') }}
                                                </option>
                                                @foreach ($agents as $agent)
                                                    <option {{ $project->agent_id == $agent->id ? 'selected' : '' }}
                                                        value="{{ $agent->id }}">
                                                        {{ $agent->username }} {{ $agent->id == 0 ? __('(admin)') : '' }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <p class="text-warning">
                                                {{ __('if you do not select any agent, then this project will be listed under you') }}
                                            </p>
                                        </div>
                                    </div>


                                </div>

                                <div id="accordion" class="mt-3">
                                    @foreach ($languages as $language)
                                        @php
                                            $projectContent = App\Models\Project\ProjectContent::where(
                                                'project_id',
                                                $project->id,
                                            )
                                                ->where('language_id', $language->id)
                                                ->first();
                                        @endphp
                                        <div class="version">
                                            <div class="version-header" id="heading{{ $language->id }}">
                                                <h5 class="mb-0">
                                                    <button type="button" class="btn btn-link" data-toggle="collapse"
                                                        data-target="#collapse{{ $language->id }}"
                                                        aria-expanded="{{ $language->is_default == 1 ? 'true' : 'false' }}"
                                                        aria-controls="collapse{{ $language->id }}">
                                                        {{ $language->name . __(' Language') }}
                                                        {{ $language->is_default == 1 ? '(Default)' : '' }}
                                                    </button>
                                                </h5>
                                            </div>

                                            <div id="collapse{{ $language->id }}"
                                                class="collapse {{ $language->is_default == 1 ? 'show' : '' }}"
                                                aria-labelledby="heading{{ $language->id }}" data-parent="#accordion">
                                                <div class="version-body">
                                                    <div class="row">
                                                        <div class="col-lg-8">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Title*') }}</label>
                                                                <input type="text" class="form-control"
                                                                    name="{{ $language->code }}_title"
                                                                    placeholder="Enter Title"
                                                                    value="{{ $projectContent ? $projectContent->title : '' }}">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Address') . '*' }} </label>
                                                                <input type="text"
                                                                    name="{{ $language->code }}_address"
                                                                    placeholder="Enter Address"
                                                                    value="{{ @$projectContent->address }}"
                                                                    class="form-control">
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Description') }} *</label>
                                                                <textarea class="form-control summernote " id="{{ $language->code }}_description"
                                                                    name="{{ $language->code }}_description" data-height="300">{{ @$projectContent->description }}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Meta Keywords') }} </label>
                                                                <input class="form-control"
                                                                    name="{{ $language->code }}_meta_keyword"
                                                                    placeholder="Enter Meta Keywords"
                                                                    data-role="tagsinput"
                                                                    value="{{ $projectContent ? $projectContent->meta_keyword : '' }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Meta Description') }} </label>
                                                                <textarea class="form-control" name="{{ $language->code }}_meta_description" rows="5"
                                                                    placeholder="Enter Meta Description">{{ $projectContent ? $projectContent->meta_description : '' }}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            @php $currLang = $language; @endphp

                                                            @foreach ($languages as $language)
                                                                @continue($language->id == $currLang->id)

                                                                <div class="form-check py-0 pt-2">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            onchange="cloneInput('collapse{{ $currLang->id }}', 'collapse{{ $language->id }}', event)">
                                                                        <span
                                                                            class="form-check-sign text-focus">{{ __('Clone for') }}
                                                                            <strong
                                                                                class="text-capitalize text-secondary">{{ $language->name }}</strong>
                                                                            {{ __('language') }}</span>
                                                                    </label>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>

                                <div class="row">
                                    <div class="col-lg-12" id="variation_pricing">
                                        <h4 for="">{{ __('Additional Features (Optional)') }}</h4>
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>{{ __('Label') }}</th>
                                                    <th>{{ __('Value') }}</th>
                                                    <th><a href="javascrit:void(0)"
                                                            class="btn  btn-sm btn-success addRow"><i
                                                                class="fas fa-plus-circle"></i></a></th>
                                                </tr>
                                            <tbody id="tbody">

                                                @if (count($specifications) > 0)
                                                    @foreach ($specifications as $specification)
                                                        <tr>
                                                            <td>
                                                                @foreach ($languages as $language)
                                                                    @php
                                                                        $sp_content = App\Models\Project\SpacificationContent::where(
                                                                            [
                                                                                ['language_id', $language->id],
                                                                                [
                                                                                    'project_spacification_id',
                                                                                    $specification->id,
                                                                                ],
                                                                            ],
                                                                        )->first();
                                                                    @endphp
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <input type="text"
                                                                            name="{{ $language->code }}_label[]"
                                                                            value="{{ @$sp_content->label }}"
                                                                            class="form-control"
                                                                            placeholder="Label ({{ $language->name }})">
                                                                    </div>
                                                                @endforeach
                                                            </td>
                                                            <td>
                                                                @foreach ($languages as $language)
                                                                    @php
                                                                        $sp_content = App\Models\Project\SpacificationContent::where(
                                                                            [
                                                                                ['language_id', $language->id],
                                                                                [
                                                                                    'project_spacification_id',
                                                                                    $specification->id,
                                                                                ],
                                                                            ],
                                                                        )->first();
                                                                    @endphp
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <input type="text"
                                                                            name="{{ $language->code }}_value[]"
                                                                            value="{{ @$sp_content->value }}"
                                                                            class="form-control"
                                                                            placeholder="Value ({{ $language->name }})">
                                                                    </div>
                                                                @endforeach
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)"
                                                                    data-specification="{{ $specification->id }}"
                                                                    class="btn  btn-sm btn-danger deleteSpecification">
                                                                    <i class="fas fa-minus"></i></a>
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                @else
                                                    <tr>
                                                        <td>
                                                            @foreach ($languages as $language)
                                                                <div
                                                                    class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                    <input type="text"
                                                                        name="{{ $language->code }}_label[]"
                                                                        class="form-control"
                                                                        placeholder="Label ({{ $language->name }})">
                                                                </div>
                                                            @endforeach
                                                        </td>
                                                        <td>
                                                            @foreach ($languages as $language)
                                                                <div
                                                                    class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                    <input type="text"
                                                                        name="{{ $language->code }}_value[]"
                                                                        class="form-control"
                                                                        placeholder="Value ({{ $language->name }})">
                                                                </div>
                                                            @endforeach
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)"
                                                                class="btn btn-danger  btn-sm deleteRow">
                                                                <i class="fas fa-minus"></i></a>
                                                        </td>
                                                    </tr>
                                                @endif
                                            </tbody>
                                            </thead>
                                        </table>
                                    </div>
                                </div>

                                <div id="galleries"></div>
                                <div id="floorPlan"></div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="row">
                        <div class="col-12 text-center">
                            <button id="PropertySubmit" class="btn btn-primary">
                                {{ __('Update') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@php
    $languages = App\Models\Language::get();
    $labels = '';
    $values = '';
    foreach ($languages as $language) {
        $label_name = $language->code . '_label[]';
        $value_name = $language->code . '_value[]';
        if ($language->direction == 1) {
            $direction = 'form-group rtl text-right';
        } else {
            $direction = 'form-group';
        }

        $labels .=
            "<div class='$direction'><input type='text' name='" .
            $label_name .
            "' class='form-control' placeholder='Label ($language->name)'></div>";
        $values .= "<div class='$direction'><input type='text' name='$value_name' class='form-control' placeholder='Value ($language->name)'></div>";
    }
@endphp

@section('script')
    <script>
        var labels = "{!! $labels !!}";
        var values = "{!! $values !!}";

        var galleryStoreUrl = "{{ route('vendor.project.gallery_image_store') }}";
        var galleryRemoveUrl = "{{ route('vendor.project.gallery_imagermv') }}";
        var floorPlanStoreUrl = "{{ route('vendor.project.floor_plan_image_store') }}";
        var floorPlanRemoveUrl = "{{ route('vendor.project.floor_plan_imagermv') }}";
        var galleryImagRrmvdbUrl = "{{ route('vendor.project.gallery_imgdbrmv') }}";
        var floorPlanRmvdbUrl = "{{ route('vendor.project.floor_plan_imgdbrmv') }}";
        var galleryImages = {{ $currentPackage->number_of_project_gallery_images - count($gallery_images) }};
        var specificationRmvUrl = "{{ route('vendor.project_management.specification_delete') }}"
    </script>
    <script type="text/javascript" src="{{ asset('assets/js/admin-project-dropzone.js') }}"></script>
    <script src="{{ asset('assets/js/property.js') }}"></script>
@endsection
