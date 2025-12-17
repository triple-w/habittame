@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Cities') }}</h4>
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
                <a href="#">{{ __('Cities') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card-title d-inline-block">{{ __('Cities') }}</div>
                        </div>

                        <div class="col-lg-3">
                            @includeIf('backend.partials.languages')
                        </div>

                        <div class="col-lg-4 offset-lg-1 mt-2 mt-lg-0">
                            <a href="#" data-toggle="modal" data-target="#createModal"
                                class="btn btn-primary btn-sm float-lg-right float-left"><i class="fas fa-plus"></i>
                                {{ __('Add') }}</a>

                            <button class="btn btn-danger btn-sm float-right mr-2 d-none bulk-delete"
                                data-href="{{ route('admin.property_specification.bulk_delete_city') }}">
                                <i class="flaticon-interface-5"></i> {{ __('Delete') }}
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($cities) == 0)
                                <h3 class="text-center mt-2">{{ __('NO CITY FOUND') . '!' }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3" id="basic-datatables">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <input type="checkbox" class="bulk-check" data-val="all">
                                                </th>
                                                @if ($settings->property_country_status == 1)
                                                    <th scope="col">{{ __('Country Name') }}</th>
                                                @endif
                                                @if ($settings->property_state_status == 1)
                                                    <th scope="col">{{ __('State Name') }}</th>
                                                @endif
                                                <th scope="col">{{ __('City Name') }}</th>
                                                @if ($settings->theme_version == 1)
                                                    <th scope="col">{{ __('Featured') }}</th>
                                                @endif
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Serial Number') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($cities as $city)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="bulk-check"
                                                            data-val="{{ $city->id }}">
                                                    </td>
                                                    @if ($settings->property_country_status == 1)
                                                        <td>
                                                            {{ strlen($city->country?->getContent($language->id)?->name) > 50 ? mb_substr($city->country?->getContent($language->id)?->name, 0, 50, 'UTF-8') . '...' : $city->country?->getContent($language->id)?->name }}
                                                        </td>
                                                    @endif
                                                    @if ($settings->property_state_status == 1)
                                                        <td>
                                                            @if (!is_null($city->state))
                                                                {{ strlen($city->state?->getContent($language->id)?->name) > 50 ? mb_substr($city->state?->getContent($language->id)?->name, 0, 50, 'UTF-8') . '...' : $city->state?->getContent($language->id)?->name }}
                                                            @else
                                                                -
                                                            @endif
                                                        </td>
                                                    @endif
                                                    <td>
                                                        {{ strlen($city->name) > 50 ? mb_substr($city->name, 0, 50, 'UTF-8') . '...' : $city->name }}
                                                    </td>
                                                    @if ($settings->theme_version == 1)
                                                        <td>

                                                            <form id="featureForm{{ $city->id }}"
                                                                class="d-inline-block"
                                                                action="{{ route('admin.property_specification.update_featured') }}"
                                                                method="post">
                                                                @csrf
                                                                <input type="hidden" name="cityId"
                                                                    value="{{ $city->id }}">

                                                                <select
                                                                    class="form-control {{ $city->featured == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                    name="featured"
                                                                    onchange="document.getElementById('featureForm{{ $city->id }}').submit();">
                                                                    <option value="1"
                                                                        {{ $city->featured == 1 ? 'selected' : '' }}>
                                                                        {{ __('Yes') }}
                                                                    </option>
                                                                    <option value="0"
                                                                        {{ $city->featured == 0 ? 'selected' : '' }}>
                                                                        {{ __('No') }}
                                                                    </option>
                                                                </select>
                                                            </form>

                                                        </td>
                                                    @endif
                                                    <td>
                                                        @if ($city->status == 1)
                                                            <h2 class="d-inline-block"><span
                                                                    class="badge badge-success">{{ __('Active') }}</span>
                                                            </h2>
                                                        @else
                                                            <h2 class="d-inline-block"><span
                                                                    class="badge badge-danger">{{ __('Inactive') }}</span>
                                                            </h2>
                                                        @endif
                                                    </td>
                                                    <td>{{ $city->serial_number }}</td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle btn-sm"
                                                                type="button" id="dropdownMenuButton"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                                {{ __('Select') }}
                                                            </button>

                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                                                <a class="dropdown-item editBtn" href="#"
                                                                    data-toggle="modal" data-target="#editModal"
                                                                    data-id="{{ $city->id }}"
                                                                    @foreach ($langs as $lang)
                                                            @php
                                                                
                                                                $cit = \App\Models\Property\CityContent::where([["city_id",$city->id],['language_id',$lang->id]])->first();
                                                            @endphp  
                                                            data-{{ $lang->code }}_name="{{ $cit?->name }}" @endforeach
                                                                    data-status="{{ $city->status }}"
                                                                    data-image="{{ asset('assets/img/property-city/' . $city->image) }}"
                                                                    data-serial_number="{{ $city->serial_number }}">
                                                                    <span class="btn-label">
                                                                        <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                    </span>
                                                                </a>

                                                                <form class="deleteForm d-inline-block dropdown-item"
                                                                    action="{{ route('admin.property_specification.delete_city') }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <input type="hidden" name="id"
                                                                        value="{{ $city->id }}">

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

                <div class="card-footer"></div>
            </div>
        </div>
    </div>

    {{-- create modal --}}
    @include('backend.property.city.create')

    {{-- edit modal --}}
    @include('backend.property.city.edit')
@endsection
@section('script')
    <script>
        let countryStatus = {{ $settings->property_country_status }} == 1 ? true : false;
        let stateStatus = {{ $settings->property_state_status }} == 1 ? true : false;
        let stateUrl = "{{ route('admin.property_specification.get_state') }}";
    </script>
    <script type="text/javascript" src="{{ asset('assets/js/admin-city.js') }}"></script>
@endsection
