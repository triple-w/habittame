@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Categories') }}</h4>
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
                <a href="#">{{ __('Property Specifications') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Categories') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card-title d-inline-block">{{ __('Property Categories') }}</div>
                        </div>

                        <div class="col-lg-3">
                            @includeIf('backend.partials.languages')
                        </div>

                        <div class="col-lg-4 offset-lg-1 mt-2 mt-lg-0">
                            <a href="#" data-toggle="modal" data-target="#createModal"
                                class="btn btn-primary btn-sm float-lg-right float-left"><i class="fas fa-plus"></i>
                                {{ __('Add') }}</a>

                            <button class="btn btn-danger btn-sm float-right mr-2 d-none bulk-delete"
                                data-href="{{ route('admin.property_specification.bulk_delete_category') }}">
                                <i class="flaticon-interface-5"></i> {{ __('Delete') }}
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($categories) == 0)
                                <h3 class="text-center mt-2">{{ __('NO PROPERTY CATEGORY FOUND') . '!' }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3" id="basic-datatables">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <input type="checkbox" class="bulk-check" data-val="all">
                                                </th>
                                                <th scope="col">{{ __('Type') }}</th>
                                                <th scope="col">{{ __('Name') }}</th>
                                                @if ($settings->theme_version != 1)
                                                    <th scope="col">{{ __('Featured') }}</th>
                                                @endif
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Serial Number') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($categories as $category)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="bulk-check"
                                                            data-val="{{ $category->id }}">
                                                    </td>
                                                    <td>
                                                        {{ ucfirst($category->type) }}
                                                    </td>
                                                    <td>
                                                        {{ strlen($category->name) > 50 ? mb_substr($category->name, 0, 50, 'UTF-8') . '...' : $category->name }}
                                                    </td>
                                                    @if ($settings->theme_version != 1)
                                                        <td>

                                                            <form id="featureForm{{ $category->id }}"
                                                                class="d-inline-block"
                                                                action="{{ route('admin.property_specification.update_category_featured') }}"
                                                                method="post">
                                                                @csrf
                                                                <input type="hidden" name="categoryId"
                                                                    value="{{ $category->id }}">

                                                                <select
                                                                    class="form-control {{ $category->featured == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                    name="featured"
                                                                    onchange="document.getElementById('featureForm{{ $category->id }}').submit();">
                                                                    <option value="1"
                                                                        {{ $category->featured == 1 ? 'selected' : '' }}>
                                                                        {{ __('Yes') }}
                                                                    </option>
                                                                    <option value="0"
                                                                        {{ $category->featured == 0 ? 'selected' : '' }}>
                                                                        {{ __('No') }}
                                                                    </option>
                                                                </select>
                                                            </form>

                                                        </td>
                                                    @endif
                                                    <td>
                                                        @if ($category->status == 1)
                                                            <h2 class="d-inline-block"><span
                                                                    class="badge badge-success">{{ __('Active') }}</span>
                                                            </h2>
                                                        @else
                                                            <h2 class="d-inline-block"><span
                                                                    class="badge badge-danger">{{ __('Deactive') }}</span>
                                                            </h2>
                                                        @endif
                                                    </td>
                                                    <td>{{ $category->serial_number }}</td>
                                                    <td>



                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle btn-sm"
                                                                type="button" id="dropdownMenuButton"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                                {{ __('Select') }}
                                                            </button>

                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">


                                                                <a class=" dropdown-item editBtn" href="#"
                                                                    data-toggle="modal" data-target="#editModal"
                                                                    data-id="{{ $category->id }}"
                                                                    @foreach ($langs as $lang)
                                                            @php
                                                                
                                                                $cate = \App\Models\Property\PropertyCategoryContent::where([["category_id",$category->id],['language_id',$lang->id]])->first();
                                                            @endphp 
                                                            
                                                            data-{{ $lang->code }}_name="{{ $cate?->name }}" @endforeach
                                                                    data-id="{{ $category->id }}"
                                                                    data-status="{{ $category->status }}"
                                                                    data-type="{{ $category->type }}"
                                                                    data-image="{{ asset('assets/img/property-category/' . $category->image) }}"
                                                                    data-serial_number="{{ $category->serial_number }}">
                                                                    <span class="btn-label">
                                                                        <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                    </span>
                                                                </a>
                                                                <form class="deleteForm d-inline-block dropdown-item "
                                                                    action="{{ route('admin.property_specification.delete_category') }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <input type="hidden" name="id"
                                                                        value="{{ $category->id }}">

                                                                    <button type="submit" class=" p-0 deleteBtn">
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

                <div class="card-footer"></div>
            </div>
        </div>
    </div>

    {{-- create modal --}}
    @include('backend.property.category.create')

    {{-- edit modal --}}
    @include('backend.property.category.edit')
@endsection
