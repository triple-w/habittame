@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl_style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Project') }}</h4>
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
                <a href="#">{{ __('Project Management') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Projects') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="card-title pt-lg-3 d-inline-block justify-item-center">{{ __('Projects') }}</div>
                        </div>

                        <div class="col-lg-4">
                            <form action="{{ route('admin.project_management.projects') }}" method="get"
                                id="carSearchForm">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <select name="vendor_id" id="" class="select2"
                                                onchange="document.getElementById('carSearchForm').submit()">
                                                <option value="" selected>{{ __('All') }}</option>
                                                <option value="admin" @selected(request()->input('vendor_id') == 'admin')>{{ __('Admin') }}
                                                </option>
                                                @foreach ($vendors as $vendor)
                                                    <option @selected($vendor->id == request()->input('vendor_id')) value="{{ $vendor->id }}">
                                                        {{ $vendor->username }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <input type="text" name="title" value="{{ request()->input('title') }}"
                                                class="form-control" placeholder="Title">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                @includeIf('backend.partials.languages')
                            </div>
                        </div>

                        <div class="col-lg-2 mt-2 mt-lg-0">
                            <a href="{{ route('admin.project_management.create_project') }}"
                                class="btn btn-primary btn-sm mt-lg-3 float-lg-right"><i class="fas fa-plus"></i>
                                {{ __('Add Project') }}</a>

                            <button class="btn btn-danger btn-sm float-right mt-lg-3 mr-2 d-none bulk-delete"
                                data-href="{{ route('admin.project_management.bulk_delete_project') }}"><i
                                    class="flaticon-interface-5"></i>
                                {{ __('Delete') }}</button>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($projects) == 0)
                                <h3 class="text-center">{{ __('NO PROJECT FOUND!') }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <input type="checkbox" class="bulk-check" data-val="all">
                                                </th>
                                                <th scope="col">{{ __('Title') }}</th>
                                                <th scope="col">{{ __('Post by') }}</th>
                                                <th scope="col">{{ __('Type') }}</th>
                                                <th scope="col">{{ __('Approval Status') }}</th>
                                                <th scope="col">{{ __('Featured') }}</th>
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($projects as $project)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="bulk-check"
                                                            data-val="{{ $project->id }}">
                                                    </td>
                                                    <td class="table-title">
                                                        @php
                                                            $project_content = $project->getContent($language->id);
                                                            if (is_null($project_content)) {
                                                                $project_content = $project->projectContents()->first();
                                                            }
                                                        @endphp
                                                        @if (!empty($project_content))
                                                            <a href="{{ route('frontend.projects.details', ['slug' => $project_content->slug]) }}"
                                                                target="_blank">
                                                                {{ strlen(@$project_content->title) > 100 ? mb_substr(@$project_content->title, 0, 100, 'utf-8') . '...' : @$project_content->title }}
                                                            </a>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($project->vendor_id != 0)
                                                            <a
                                                                href="{{ route('admin.vendor_management.vendor_details', ['id' => @$project->vendor->id, 'language' => $defaultLang->code]) }}">{{ @$project->vendor->username }}</a>
                                                        @else
                                                            <span class="badge badge-success">{{ __('Admin') }}</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-secondary  mt-1 btn-sm mr-1"
                                                            href="{{ route('admin.project_management.project_types', $project->id) }}">
                                                            <span class="btn-label">
                                                                {{ __('Manage') }}
                                                            </span>
                                                        </a>
                                                    </td>

                                                    <td>
                                                        <form class="d-inline-block"
                                                            action="{{ route('admin.project_management.approve_status') }}"
                                                            method="POST">
                                                            @csrf
                                                            <input type="hidden" name="project"
                                                                value="{{ $project->id }}">
                                                            <select
                                                                onchange="$('.request-loader').addClass('show'); this.form.submit();"
                                                                class="form-control  @if ($project->approve_status == 1) bg-success @elseif($project->approve_status == 0)
                                                                bg-warning @else bg-danger @endif form-control-sm"
                                                                name="approve_status">
                                                                <option value="2"
                                                                    {{ $project->approve_status == 2 ? 'selected' : '' }}>
                                                                    {{ __('Rejected') }}
                                                                </option>
                                                                <option value="1"
                                                                    {{ $project->approve_status == 1 ? 'selected' : '' }}>
                                                                    {{ __('Approve') }}
                                                                </option>
                                                                <option value="0"
                                                                    {{ $project->approve_status == 0 ? 'selected' : '' }}>
                                                                    {{ __('Pending') }}
                                                                </option>
                                                            </select>
                                                        </form>
                                                    </td>

                                                    <td>
                                                        <form id="featureForm{{ $project->id }}" class="d-inline-block"
                                                            action="{{ route('admin.project_management.update_featured') }}"
                                                            method="post">
                                                            @csrf
                                                            <input type="hidden" name="projectId"
                                                                value="{{ $project->id }}">

                                                            <select
                                                                class="form-control {{ $project->featured == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                name="featured"
                                                                onchange="document.getElementById('featureForm{{ $project->id }}').submit();">
                                                                <option value="1"
                                                                    {{ $project->featured == 1 ? 'selected' : '' }}>
                                                                    {{ __('Yes') }}
                                                                </option>
                                                                <option value="0"
                                                                    {{ $project->featured == 0 ? 'selected' : '' }}>
                                                                    {{ __('No') }}
                                                                </option>
                                                            </select>
                                                        </form>

                                                    </td>

                                                    <td>
                                                        <form id="statusForm{{ $project->id }}" class="d-inline-block"
                                                            action="{{ route('admin.project_management.update_status') }}"
                                                            method="post">
                                                            @csrf
                                                            <input type="hidden" name="projectId"
                                                                value="{{ $project->id }}">

                                                            <select
                                                                class="form-control {{ $project->status == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                name="status"
                                                                onchange="document.getElementById('statusForm{{ $project->id }}').submit();">
                                                                <option value="1"
                                                                    {{ $project->status == 1 ? 'selected' : '' }}>
                                                                    {{ __('Complete') }}
                                                                </option>
                                                                <option value="0"
                                                                    {{ $project->status == 0 ? 'selected' : '' }}>
                                                                    {{ __('Under Construction') }}
                                                                </option>
                                                            </select>
                                                        </form>
                                                    </td>

                                                    <td>
                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle btn-sm"
                                                                type="button" id="dropdownMenuButton"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                                {{ __('Select') }}
                                                            </button>

                                                            <div class="dropdown-menu"
                                                                aria-labelledby="dropdownMenuButton">

                                                                <a class="dropdown-item"
                                                                    href="{{ route('admin.project_management.edit', $project->id) }}">
                                                                    <span class="btn-label">
                                                                        <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                    </span>
                                                                </a>

                                                                <form class="deleteForm d-inline-block dropdown-item"
                                                                    action="{{ route('admin.project_management.delete_project') }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <input type="hidden" name="project_id"
                                                                        value="{{ $project->id }}">

                                                                    <button type="submit" class="p-0 deleteBtn">
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

                <div class="card-footer">
                    {{ $projects->appends([
                            'vendor_id' => request()->input('vendor_id'),
                            'title' => request()->input('title'),
                        ])->links() }}
                </div>

            </div>
        </div>
    </div>

@endsection
