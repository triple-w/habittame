@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl_style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Properties') }}</h4>
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
                <a href="#">{{ __('Properties') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="card-title d-inline-block">{{ __('Properties') }}</div>
                        </div>

                        <div class="col-lg-3">
                            <form action="{{ route('admin.property_management.properties') }}" method="get"
                                id="carSearchForm">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <select name="vendor_id" id="" class="select2"
                                            onchange="document.getElementById('carSearchForm').submit()">
                                            <option value="" selected>{{ __('All') }}</option>
                                            <option value="admin" @selected(request()->input('vendor_id') == 'admin')>
                                                {{ Auth::guard('admin')->user()->username }} <span
                                                    class="badge bg-success">{{ '(' . __('Admin') . ')' }}</span> </option>
                                            @foreach ($vendors as $vendor)
                                                <option @selected($vendor->id == request()->input('vendor_id')) value="{{ $vendor->id }}">
                                                    {{ $vendor->username }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" name="title" value="{{ request()->input('title') }}"
                                            class="form-control" placeholder="Title">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-3">
                            @includeIf('backend.partials.languages')
                        </div>

                        <div class="col-lg-3 mt-2 mt-lg-0">
                            <a href="{{ route('admin.property_management.type') }}"
                                class="btn btn-primary btn-sm float-right"><i class="fas fa-plus"></i>
                                {{ __('Add Property') }}</a>

                            <button class="btn btn-danger btn-sm float-right mr-2 d-none bulk-delete"
                                data-href="{{ route('admin.property_management.bulk_delete_property') }}"><i
                                    class="flaticon-interface-5"></i>
                                {{ __('Delete') }}</button>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($properties) == 0)
                                <h3 class="text-center">{{ __('NO PROPERTY FOUND!') }}</h3>
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
                                                <th scope="col">{{ __('City') }}</th>
                                                <th scope="col">{{ __('Approval Status') }}</th>
                                                <th scope="col">{{ __('Featured') }}</th>
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($properties as $property)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="bulk-check"
                                                            data-val="{{ $property->id }}">
                                                    </td>
                                                    <td class="table-title">
                                                        @php
                                                            $property_content = $property->getContent($language->id);
                                                            if (is_null($property_content)) {
                                                                $property_content = $property
                                                                    ->propertyContents()
                                                                    ->first();
                                                            }
                                                        @endphp
                                                        @if (!empty($property_content))
                                                            <a href="{{ route('frontend.property.details', ['slug' => $property_content->slug]) }}"
                                                                target="_blank">
                                                                {{ strlen(@$property_content->title) > 100 ? mb_substr(@$property_content->title, 0, 100, 'utf-8') . '...' : @$property_content->title }}
                                                            </a>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($property->vendor_id != 0)
                                                            <a
                                                                href="{{ route('admin.vendor_management.vendor_details', ['id' => @$property->vendor->id, 'language' => $defaultLang->code]) }}">{{ @$property->vendor->username }}</a>
                                                        @else
                                                            <span class="badge badge-success">{{ __('Admin') }}</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        {{ $property->type }}
                                                    </td>
                                                    <td>
                                                        {{ $property->cityContent?->name }}
                                                    </td>
                                                    <td>

                                                        <form class="d-inline-block"
                                                            action="{{ route('admin.property_management.approve_status') }}"
                                                            method="POST">
                                                            @csrf
                                                            <input type="hidden" name="property"
                                                                value="{{ $property->id }}">
                                                            <select
                                                                onchange="$('.request-loader').addClass('show'); this.form.submit();"
                                                                class="form-control  @if ($property->approve_status == 1) bg-success @elseif($property->approve_status == 0)
                                                                bg-warning @else bg-danger @endif form-control-sm"
                                                                name="approve_status">
                                                                <option value="2"
                                                                    {{ $property->approve_status == 2 ? 'selected' : '' }}>
                                                                    {{ __('Rejected') }}
                                                                </option>
                                                                <option value="1"
                                                                    {{ $property->approve_status == 1 ? 'selected' : '' }}>
                                                                    {{ __('Approve') }}
                                                                </option>
                                                                <option value="0"
                                                                    {{ $property->approve_status == 0 ? 'selected' : '' }}>
                                                                    {{ __('Pending') }}
                                                                </option>
                                                            </select>
                                                        </form>
                                                    </td>
                                                    <td>

                                                        @php

                                                            $featuredProperty = $property
                                                                ->featuredProperties()
                                                                ->latest()
                                                                ->first();

                                                            $pendingfeatured = false;
                                                            $featuredExpired = false;
                                                            $featured = false;

                                                            if (
                                                                !empty($featuredProperty) &&
                                                                $featuredProperty->status == 0 &&
                                                                $featuredProperty->start_date == null &&
                                                                $featuredProperty->end_date == null
                                                            ) {
                                                                $pendingfeatured = true;
                                                            } elseif (
                                                                !empty($featuredProperty) &&
                                                                $featuredProperty->status == 1 &&
                                                                $featuredProperty->start_date != null &&
                                                                $featuredProperty->end_date != null
                                                            ) {
                                                                $featuredExpired = Carbon\Carbon::now()
                                                                    ->timezone($settings->timezone)
                                                                    ->gte(
                                                                        \Carbon\Carbon::parse(
                                                                            $featuredProperty->end_date,
                                                                        ),
                                                                    );
                                                            } else {
                                                                $featured = true;
                                                            }

                                                        @endphp
                                                        @if (empty($featuredProperty) || $featuredExpired || $featuredProperty->payment_status == 'rejected')
                                                            <form class="d-inline-block">
                                                                <select id="featured{{ $property->id }}"
                                                                    onchange="featuredRequest(this)"
                                                                    class="form-control {{ !empty($featuredProperty) && !$featuredExpired && $featuredProperty->status == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                    data-property="{{ $property->id }}">
                                                                    <option value="1"
                                                                        {{ empty($featuredProperty) || (!$featuredExpired && $featuredProperty->status == 1) ? 'selected' : '' }}>
                                                                        {{ __('Yes') }}
                                                                    </option>
                                                                    <option value="0"
                                                                        {{ empty($featuredProperty) || $featuredExpired || $featuredProperty->payment_status == 'rejected' ? 'selected' : '' }}>
                                                                        {{ __('No') }}
                                                                    </option>
                                                                </select>
                                                            </form>
                                                        @elseif ($pendingfeatured)
                                                            <span class="badge badge-warning btn-sm mr-1  mt-1"
                                                                href="#"> Pending </span>
                                                        @elseif(!empty($featuredProperty) && !$featuredExpired && !$pendingfeatured)
                                                            <form id="featureForm{{ $property->id }}"
                                                                class="d-inline-block"
                                                                action="{{ route('admin.property_management.update_featured') }}"
                                                                method="post">
                                                                @csrf
                                                                <input type="hidden" name="requestId"
                                                                    value="{{ $featuredProperty->id }}">

                                                                <select
                                                                    class="form-control {{ $featuredProperty->status == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                    name="status"
                                                                    onchange="document.getElementById('featureForm{{ $property->id }}').submit();">
                                                                    <option value="1"
                                                                        {{ $featuredProperty->status == 1 ? 'selected' : '' }}>
                                                                        {{ __('Yes') }}
                                                                    </option>
                                                                    <option value="0"
                                                                        {{ $featuredProperty->status == 0 ? 'selected' : '' }}>
                                                                        {{ __('No') }}
                                                                    </option>
                                                                </select>
                                                            </form>
                                                        @endif


                                                    </td>

                                                    <td>
                                                        <form id="statusForm{{ $property->id }}" class="d-inline-block"
                                                            action="{{ route('admin.property_management.update_status') }}"
                                                            method="post">
                                                            @csrf
                                                            <input type="hidden" name="propertyId"
                                                                value="{{ $property->id }}">

                                                            <select
                                                                class="form-control {{ $property->status == 1 ? 'bg-success' : 'bg-danger' }} form-control-sm"
                                                                name="status"
                                                                onchange="document.getElementById('statusForm{{ $property->id }}').submit();">
                                                                <option value="1"
                                                                    {{ $property->status == 1 ? 'selected' : '' }}>
                                                                    {{ __('Active') }}
                                                                </option>
                                                                <option value="0"
                                                                    {{ $property->status == 0 ? 'selected' : '' }}>
                                                                    {{ __('Inactive') }}
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
                                                                    href="{{ route('admin.property_management.edit', $property->id) }}">
                                                                    <span class="btn-label">
                                                                        <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                    </span>
                                                                </a>

                                                                <form class="deleteForm d-inline-block p-0 dropdown-item"
                                                                    action="{{ route('admin.property_management.delete_property') }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <input type="hidden" name="property_id"
                                                                        value="{{ $property->id }}">

                                                                    <button type="submit" class="deleteBtn">
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
                    {{ $properties->appends([
                            'vendor_id' => request()->input('vendor_id'),
                            'title' => request()->input('title'),
                        ])->links() }}
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="featuredRequest" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <form id="my-checkout-form" class="modal-form"
                    action="{{ route('admin.property_management.featured_payment') }}" method="post"
                    enctype="multipart/form-data">
                    @csrf

                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">{{ __(' Featured Request') }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">

                        <input type="hidden" id="in_property_id" name="property_id">


                        <div class="form-group">
                            <label for=""> {{ 'Select Pricing *' }} </label>
                            <div class="row mt-2 justify-content-center">

                                @foreach ($featurePricing as $key => $pricing)
                                    <div class="col-md-3 ">
                                        <label class="imagecheck">
                                            <input name="featured_pricing_id" type="radio" value="{{ $pricing->id }}"
                                                class="imagecheck-input" checked>


                                            <figure class="imagecheck-figure">

                                                <div class="card-pricing3  card-secondary ">
                                                    <div class="pricing-header  pb-2">
                                                    </div>
                                                    <div class="price-value">
                                                        <div class="value">
                                                            <span
                                                                class="amount">{{ $pricing->price == 0 ? 'Free' : symbolPrice($pricing->price) }}</span>
                                                        </div>
                                                    </div>

                                                    <ul class="pricing-content">
                                                        <li>{{ __('Number Of Days') . ' :' }}
                                                            {{ $pricing->number_of_days }}</li>
                                                    </ul>
                                                </div>
                                            </figure>
                                        </label>
                                    </div>
                                @endforeach

                            </div>
                        </div>


                        <div class="form-group mb-2">
                            <label for="payment-gateway"> {{ __('Select Payment Method *') }}</label>
                            <select name="gateway" id="payment-gateway" required class="form-control select">
                                <option selected disabled value="">
                                    {{ __('Select Payment Gateway') }}
                                </option>
                                @if (count($onlineGateways) > 0)
                                    @foreach ($onlineGateways as $onlineGateway)
                                        <option value="{{ $onlineGateway->keyword }}"
                                            {{ $onlineGateway->keyword == old('gateway') ? 'selected' : '' }}>
                                            {{ $onlineGateway->name }}
                                        </option>
                                    @endforeach
                                @endif

                                @if (count($offlineGateways) > 0)
                                    @foreach ($offlineGateways as $offlineGateway)
                                        <option value="{{ $offlineGateway->name }}"
                                            {{ $offlineGateway->name == old('gateway') ? 'selected' : '' }}>
                                            {{ $offlineGateway->name }}
                                        </option>
                                    @endforeach
                                @endif
                            </select>
                            @if ($errors->has('payment_method'))
                                <span class="method-error">
                                    <strong>{{ $errors->first('payment_method') }}</strong>
                                </span>
                            @endif
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary " data-dismiss="modal">
                            {{ __('Close') }}
                        </button>
                        <button type="submit" id="paymentAdmin" class="btn btn-primary ">
                            {{ __('Pay') }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>


@endsection

@section('script')
    <script>
        "use strict";
        var stripe_key = "";
    </script>
    <script src="{{ asset('assets/js/feature-payment.js') }}"></script>
@endsection
