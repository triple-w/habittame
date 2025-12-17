@extends('backend.layout')

@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Packages') }}</h4>
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
                <a href="#">{{ __('Packages Management') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Packages') }}</a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card-title d-inline-block">{{ __('Package Page') }}</div>
                        </div>
                        <div class="col-lg-4 offset-lg-4 mt-2 mt-lg-0">
                            <a href="#" class="btn btn-primary float-right btn-sm" data-toggle="modal"
                                data-target="#createModal"><i class="fas fa-plus"></i>
                                {{ __('Add Package') }}</a>
                            <button class="btn btn-danger float-right btn-sm mr-2 d-none bulk-delete"
                                data-href="{{ route('admin.package.bulk.delete') }}"><i class="flaticon-interface-5"></i>
                                {{ __('Delete') }}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($packages) == 0)
                                <h3 class="text-center">{{ __('NO PACKAGE FOUND YET') }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3" id="basic-datatables">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <input type="checkbox" class="bulk-check" data-val="all">
                                                </th>
                                                <th scope="col">{{ __('Title') }}</th>
                                                <th scope="col">{{ __('Cost') }}</th>
                                                @if ($settings->theme_version == 2)
                                                    <th scope="col">{{ __('Featured') }}</th>
                                                @endif
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($packages as $key => $package)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="bulk-check"
                                                            data-val="{{ $package->id }}">
                                                    </td>
                                                    <td>
                                                        <strong>{{ strlen($package->title) > 30 ? mb_substr($package->title, 0, 30, 'UTF-8') . '...' : $package->title }}</strong>
                                                        @if ($package->term == 'monthly')
                                                            <small class="badge badge-primary">{{ __('Monthly') }}</small>
                                                        @elseif ($package->term == 'yearly')
                                                            <small class="badge badge-info">{{ __('Yearly') }}</small>
                                                        @elseif ($package->term == 'lifetime')
                                                            <small
                                                                class="badge badge-secondary">{{ __('Lifetime') }}</small>
                                                        @endif


                                                    </td>
                                                    <td>
                                                        @if ($package->price == 0)
                                                            {{ __('Free') }}
                                                        @else
                                                            {{ format_price($package->price) }}
                                                        @endif

                                                    </td>
                                                    @if ($settings->theme_version == 2)
                                                        <td>


                                                            <form id="featureForm{{ $package->id }}"
                                                                class="d-inline-block"
                                                                action="{{ route('admin.package.featured') }}"
                                                                method="post">
                                                                @csrf
                                                                <input type="hidden" name="package_id"
                                                                    value="{{ $package->id }}">
                                                                <select
                                                                    class="form-control {{ $package->is_featured ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                    name="featured"
                                                                    onchange="document.getElementById('featureForm{{ $package->id }}').submit();">
                                                                    <option value="1"
                                                                        {{ $package->is_featured ? 'selected' : '' }}>
                                                                        {{ __('Yes') }}
                                                                    </option>
                                                                    <option value="0"
                                                                        {{ !$package->is_featured ? 'selected' : '' }}>
                                                                        {{ __('No') }}
                                                                    </option>
                                                                </select>
                                                            </form>
                                                        </td>
                                                    @endif
                                                    <td>
                                                        @if ($package->status == 1)
                                                            <h2 class="d-inline-block">
                                                                <span
                                                                    class="badge badge-success">{{ __('Active') }}</span>
                                                            </h2>
                                                        @else
                                                            <h2 class="d-inline-block">
                                                                <span
                                                                    class="badge badge-danger">{{ __('Inactive') }}</span>
                                                            </h2>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle btn-sm"
                                                                type="button" id="dropdownMenuButton"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                                {{ __('Select') }}
                                                            </button>

                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                                                <a class="dropdown-item"
                                                                    href="{{ route('admin.package.edit', $package->id) . '?language=' . request()->input('language') }}">
                                                                    <span class="btn-label">
                                                                        <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                    </span>
                                                                </a>
                                                                <form class="packageDeleteForm d-inline-block dropdown-item"
                                                                    action="{{ route('admin.package.delete') }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <input type="hidden" name="package_id"
                                                                        value="{{ $package->id }}">
                                                                    <button type="submit" class="btn p-0 packageDeleteBtn">
                                                                        <span class="btn-label">
                                                                            <i class="fas fa-trash-alt"></i>
                                                                            {{ __('Delete') }}
                                                                        </span>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Create Blog Modal -->
    <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">{{ __('Add Package') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="ajaxForm" enctype="multipart/form-data" class="modal-form"
                        action="{{ route('admin.package.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="">{{ __('Icon') }} *</label>
                            <div class="btn-group d-block">
                                <button type="button" class="btn btn-primary iconpicker-component"><i
                                        class="fa fa-fw fa-heart"></i></button>
                                <button type="button" class="icp icp-dd btn btn-primary dropdown-toggle"
                                    data-selected="fa-car" data-toggle="dropdown">
                                </button>
                                <div class="dropdown-menu"></div>
                            </div>
                            <input id="inputIcon" type="hidden" name="icon" value="fas fa-heart">
                            <p id="erricon" class="mb-0 text-danger em"></p>
                            <div class="mt-2">
                                <small>{{ __('NB: click on the dropdown sign to select a icon.') }}</small>
                            </div>
                            <p id="err_icon" class="mb-0 text-danger em"></p>
                        </div>

                        <div class="form-group">
                            <label for="title">{{ __('Package title') }}*</label>
                            <input id="title" type="text" class="form-control" name="title"
                                placeholder="{{ __('Enter Package title') }}" value="">
                            <p id="err_title" class="mb-0 text-danger em"></p>
                        </div>
                        <div class="form-group">
                            <label for="price">{{ __('Price') }} ({{ $settings->base_currency_text }})*</label>
                            <input id="price" type="number" class="form-control" name="price"
                                placeholder="{{ __('Enter Package price') }}" value="">
                            <p class="text-warning mb-0">
                                <small>{{ __('If price is 0, than it will appear as free') }}</small>
                            </p>
                            <p id="err_price" class="mb-0 text-danger em"></p>
                        </div>
                        <div class="form-group">
                            <label for="term">{{ __('Package term') }}*</label>
                            <select id="term" name="term" class="form-control" required>
                                <option value="" selected disabled>{{ __('Choose a Package term') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                                <option value="yearly">{{ __('yearly') }}</option>
                                <option value="lifetime">{{ __('lifetime') }}</option>
                            </select>
                            <p id="err_term" class="mb-0 text-danger em"></p>
                        </div>


                        <div class="form-group">
                            <label class="form-label">{{ __('Number of Agents') }} *</label>
                            <input type="text" class="form-control" name="number_of_agent"
                                placeholder="{{ __('Enter how many agents the vendor can add') }}">
                            <p id="err_number_of_agent" class="mb-0 text-danger em"></p>
                            <p class="text-warning mb-0">
                                <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                            </p>
                        </div>

                        <div class="form-group">
                            <label class="form-label">{{ __('Number of Properties') }} *</label>
                            <input type="text" class="form-control" name="number_of_property"
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
                                placeholder="{{ __('Enter how many gallery images are added under a property') }}">
                            <p id="err_number_of_property_gallery_images" class="mb-0 text-danger em"></p>
                            <p class="text-warning mb-0">
                                <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                            </p>
                        </div>

                        <div class="form-group">
                            <label class="form-label">{{ __('Number of Additional Features (Per Property)') }} *</label>
                            <input type="text" class="form-control" name="number_of_property_adittionl_specifications"
                                placeholder="{{ __('Enter How many project additional features the vendor can add') }}">
                            <p id="err_number_of_property_adittionl_specifications" class="mb-0 text-danger em"></p>
                            <p class="text-warning mb-0">
                                <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                            </p>
                        </div>

                        <div class="form-group">
                            <label class="form-label">{{ __('Number of Projects') }} *</label>
                            <input type="text" class="form-control" name="number_of_projects"
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
                                placeholder="{{ __('Enter how many gallery images are added under a project') }}">
                            <p id="err_number_of_project_gallery_images" class="mb-0 text-danger em"></p>
                            <p class="text-warning mb-0">
                                <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                            </p>
                        </div>

                        <div class="form-group">
                            <label class="form-label">{{ __('Number of Additional Features (Per Project)') }} *</label>
                            <input type="text" class="form-control" name="number_of_project_additionl_specifications"
                                placeholder="{{ __('Enter How many project additional features the vendor can add') }}">
                            <p id="err_number_of_project_additionl_specifications" class="mb-0 text-danger em"></p>
                            <p class="text-warning mb-0">
                                <small>{{ __('Enter 999999, than it will appear as unlimited') }}</small>
                            </p>
                        </div>

                        <div class="form-group">
                            <label for="status">{{ __('Status') }}*</label>
                            <select id="status" class="form-control ltr" name="status">
                                <option value="" selected disabled>{{ __('Select a status') }}</option>
                                <option value="1">{{ __('Active') }}</option>
                                <option value="0">{{ __('Inactive') }}</option>
                            </select>
                            <p id="err_status" class="mb-0 text-danger em"></p>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
                    <button id="submitBtn" type="button" class="btn btn-primary">{{ __('Submit') }}</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/packages.js') }}"></script>
    <script src="{{ asset('assets/js/admin-partial.js') }}"></script>
@endsection
