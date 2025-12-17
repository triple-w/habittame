@extends('backend.layout')

@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Edit package') }}</h4>
        <ul class="breadcrumbs">
            <li class="nav-home">
                <a href="{{ route('admin.dashboard') }}">
                    <i class="flaticon-home"></i>
                </a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Packages') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Edit') }}</a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title d-inline-block">{{ __('Edit package') }}</div>
                    <a class="btn btn-info btn-sm float-right d-inline-block" href="{{ route('admin.package.index') }}">
                        <span class="btn-label">
                            <i class="fas fa-backward"></i>
                        </span>
                        {{ __('Back') }}
                    </a>
                </div>
                <div class="card-body pt-5 pb-5">
                    <div class="row">
                        <div class="col-lg-6 offset-lg-3">
                            <form id="ajaxForm" class="" action="{{ route('admin.package.update') }}" method="post"
                                enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="package_id" value="{{ $package->id }}">

                                <div class="form-group">
                                    <label for="">{{ __('Icon') }} **</label>
                                    <div class="btn-group d-block">
                                        <button type="button" class="btn btn-primary iconpicker-component"><i
                                                class="{{ $package->icon }}"></i></button>
                                        <button type="button" class="icp icp-dd btn btn-primary dropdown-toggle"
                                            data-selected="fa-car" data-toggle="dropdown">
                                        </button>
                                        <div class="dropdown-menu"></div>
                                    </div>
                                    <input id="inputIcon" type="hidden" name="icon" value="{{ $package->icon }}">
                                    <p id="erricon" class="mb-0 text-danger em"></p>
                                    <div class="mt-2">
                                        <small>{{ __('NB: click on the dropdown sign to select an icon.') }}</small>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="title">{{ __('Package title') }}*</label>
                                    <input id="title" type="text" class="form-control" name="title"
                                        value="{{ $package->title }}" placeholder="{{ __('Enter name') }}">
                                    <p id="err_title" class="mb-0 text-danger em"></p>
                                </div>



                                <div class="form-group">
                                    <label for="price">{{ __('Price') }}
                                        ({{ $settings->base_currency_text }})*</label>
                                    <input id="price" type="number" class="form-control" name="price"
                                        placeholder="{{ __('Enter Package price') }}" value="{{ $package->price }}">
                                    <p class="text-warning">
                                        <small>{{ __('If price is 0 , than it will appear as free') }}</small>
                                    </p>
                                    <p id="err_price" class="mb-0 text-danger em"></p>
                                </div>
                                <div class="form-group">
                                    <label for="plan_term">{{ __('Package term') }}*</label>
                                    <select id="plan_term" name="term" class="form-control">
                                        <option value="" selected disabled>{{ __('Select a Term') }}</option>
                                        <option value="monthly" {{ $package->term == 'monthly' ? 'selected' : '' }}>
                                            {{ __('monthly') }}</option>
                                        <option value="yearly" {{ $package->term == 'yearly' ? 'selected' : '' }}>
                                            {{ __('yearly') }}</option>
                                        <option value="lifetime" {{ $package->term == 'lifetime' ? 'selected' : '' }}>
                                            {{ 'lifetime' }}</option>
                                    </select>
                                    <p id="err_term" class="mb-0 text-danger em"></p>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Agents') }} *</label>
                                    <input type="text" class="form-control" name="number_of_agent"
                                        value="{{ $package->number_of_agent }}"
                                        placeholder="{{ __('Enter how many agents the vendor can add') }}">
                                    <p id="err_number_of_agent" class="mb-0 text-danger em"></p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Properties') }} *</label>
                                    <input type="text" class="form-control" name="number_of_property"
                                        value="{{ $package->number_of_property }}"
                                        placeholder="{{ __('Enter how many properties the vendor can add') }}">
                                    <p id="err_number_of_property" class="mb-0 text-danger em"></p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Gallery Images (Per Property)') }}
                                        *</label>
                                    <input type="text" name="number_of_property_gallery_images" class="form-control"
                                        value="{{ $package->number_of_property_gallery_images }}"
                                        placeholder="{{ __('Enter how many gallery images are added under a property') }}">
                                    <p id="err_number_of_property_gallery_images" class="mb-0 text-danger em"></p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Additional Features (Per Property)') }}
                                        *</label>
                                    <input type="text" class="form-control"
                                        name="number_of_property_adittionl_specifications"
                                        value="{{ $package->number_of_property_adittionl_specifications }}"
                                        placeholder="{{ __('Enter How many project additional features the vendor can add') }}">
                                    <p id="err_number_of_property_adittionl_specifications" class="mb-0 text-danger em">
                                    </p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Projects') }} *</label>
                                    <input type="text" class="form-control" name="number_of_projects"
                                        value="{{ $package->number_of_projects }}"
                                        placeholder="{{ __('Enter how many projects the vendor can add') }}">
                                    <p id="err_number_of_projects" class="mb-0 text-danger em"></p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>


                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Project Types (Per Project)') }}
                                        *</label>
                                    <input type="text" class="form-control" name="number_of_project_types"
                                        value="{{ $package->number_of_project_types }}"
                                        placeholder="{{ __('Enter how many types are added under a project') }}">
                                    <p id="err_number_of_project_types" class="mb-0 text-danger em"></p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Gallery Images (Per Project)') }}
                                        *</label>
                                    <input type="text" name="number_of_project_gallery_images" class="form-control"
                                        value="{{ $package->number_of_project_gallery_images }}"
                                        placeholder="{{ __('Enter how many gallery images are added under a project') }}">
                                    <p id="err_number_of_project_gallery_images" class="mb-0 text-danger em"></p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">{{ __('Number of Additional Features (Per Project)') }}
                                        *</label>
                                    <input type="text" class="form-control"
                                        name="number_of_project_additionl_specifications"
                                        value="{{ $package->number_of_project_additionl_specifications }}"
                                        placeholder="{{ __('Enter How many project additional features the vendor can add') }}">
                                    <p id="err_number_of_project_additionl_specifications" class="mb-0 text-danger em">
                                    </p>
                                    <p class="text-warning mb-0">
                                        <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                                    </p>
                                </div>


                                <div class="form-group">
                                    <label for="status">{{ __('Status') }}*</label>
                                    <select id="status" class="form-control ltr" name="status">
                                        <option value="" selected disabled>{{ __('Select a status') }}</option>
                                        <option value="1" {{ $package->status == '1' ? 'selected' : '' }}>
                                            {{ __('Active') }}</option>
                                        <option value="0" {{ $package->status == '0' ? 'selected' : '' }}>
                                            {{ __('Inactive') }}</option>
                                    </select>
                                    <p id="err_status" class="mb-0 text-danger em"></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="form">
                        <div class="form-group from-show-notify row">
                            <div class="col-12 text-center">
                                <button type="submit" id="submitBtn"
                                    class="btn btn-success">{{ __('Update') }}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/packages.js') }}"></script>
    <script src="{{ asset('assets/admin/js/edit-package.js') }}"></script>
    <script src="{{ asset('assets/js/admin-partial.js') }}"></script>
@endsection
