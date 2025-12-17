@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Project Types') }}</h4>
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
                <a href="#">{{ __('Property Management') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Project Types') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card-title d-inline-block">{{ __('Project Types') }}</div>
                        </div>

                        <div class="col-lg-3">
                            @includeIf('backend.partials.languages')
                        </div>

                        <div class="col-lg-4 offset-lg-1 mt-2 mt-lg-0">
                            <a href="#" data-toggle="modal" data-target="#createModal"
                                class="btn btn-primary btn-sm float-lg-right float-left"><i class="fas fa-plus"></i>
                                {{ __('Add Project Type') }}</a>

                            <button class="btn btn-danger btn-sm float-right mr-2 d-none bulk-delete"
                                data-href="{{ route('admin.project_management.bulk_delete_type') }}">
                                <i class="flaticon-interface-5"></i> {{ __('Delete') }}
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($types) == 0)
                                <h3 class="text-center mt-2">{{ __('NO PROPERTY TYPES FOUND') . '!' }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3" id="basic-datatables">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <input type="checkbox" class="bulk-check" data-val="all">
                                                </th>

                                                <th scope="col">{{ __('Name') }}</th>
                                                <th scope="col">
                                                    {{ __('Min Price') . ' (' . $settings->base_currency_text . ')' }}
                                                </th>
                                                <th scope="col">{{ __('Min Area (sqft)') }}</th>
                                                <th scope="col">{{ __('Total Unit') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($types as $type)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="bulk-check"
                                                            data-val="{{ $type->id }}">
                                                    </td>
                                                    @php
                                                        $typeContnent = $type
                                                            ->projectTypeContnents()
                                                            ->where('language_id', $language->id)
                                                            ->first();
                                                    @endphp
                                                    <td>
                                                        {{-- dssd --}}
                                                        {{ strlen($typeContnent->name) > 50 ? mb_substr($typeContnent->name, 0, 50, 'UTF-8') . '...' : $typeContnent->name }}
                                                    </td>
                                                    <td>
                                                        {{ symbolPrice($typeContnent->min_price) }}
                                                    </td>
                                                    <td>
                                                        {{ $typeContnent->min_area }}
                                                    </td>
                                                    <td>
                                                        {{ $typeContnent->unit }}
                                                    </td>

                                                    <td>
                                                        <a class="btn btn-secondary btn-sm mr-1  mt-1 editBtn"
                                                            href="#" data-toggle="modal" data-target="#editModal"
                                                            data-id="{{ $type->id }}"
                                                            data-vendor_id="{{ $vendor_id }}"
                                                            data-project_id="{{ $type->project_id }}"
                                                            @foreach ($langs as $lang) 
                                                            @php
                                                                $projectType = \App\Models\Project\ProjectTypeContent::where([['language_id',$lang->id] ,['project_type_id',$type->id]])->first(); 
                                                            @endphp
                                                            
                                                            data-{{ $lang->code }}_name="{{ @$projectType->name }}"
                                                            data-{{ $lang->code }}_min_area="{{ @$projectType->min_area }}"
                                                            data-{{ $lang->code }}_max_area="{{ @$projectType->max_area }}"
                                                            data-{{ $lang->code }}_min_price="{{ @$projectType->min_price }}"
                                                            data-{{ $lang->code }}_max_price="{{ @$projectType->max_price }}"
                                                            data-{{ $lang->code }}_unit="{{ @$projectType->unit }}" @endforeach>
                                                            <span class="btn-label">
                                                                <i class="fas fa-edit"></i>
                                                            </span>
                                                        </a>

                                                        <form class="deleteForm d-inline-block"
                                                            action="{{ route('admin.project_management.delete_type') }}"
                                                            method="post">
                                                            @csrf
                                                            <input type="hidden" name="id"
                                                                value="{{ $type->id }}">

                                                            <button type="submit"
                                                                class="btn btn-danger  mt-1 btn-sm deleteBtn">
                                                                <span class="btn-label">
                                                                    <i class="fas fa-trash"></i>
                                                                </span>
                                                            </button>
                                                        </form>
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

                <div class="card-footer"></div>
            </div>
        </div>
    </div>

    {{-- create modal --}}
    @include('backend.project.type.create')

    {{-- edit modal --}}
    @include('backend.project.type.edit')
@endsection
@section('script')
    <script type="text/javascript" src="{{ asset('assets/js/admin-partial.js') }}"></script>
    </script>
@endsection
