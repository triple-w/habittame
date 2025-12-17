@extends('backend.layout')
@includeIf('backend.partials.rtl_style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">
            @if (request()->input('status') == 'all')
                {{ __('All Request') }}
            @elseif(request()->input('status') == 'pending')
                {{ __('Pending Request') }}
            @elseif(request()->input('status') == 'accepted')
                {{ __('Accepted Request') }}
            @endif
        </h4>
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
                <a href="#">{{ __('Feature Properties') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">
                    @if (request()->input('status') == 'all')
                        {{ __('All Request') }}
                    @elseif(request()->input('status') == 'pending')
                        {{ __('Pending Request') }}
                    @elseif(request()->input('status') == 'accepted')
                        {{ __('Accepted Request') }}
                    @endif
                </a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <form action="{{ route('admin.requested_for_featured') }}" method="GET">

                        <div class="row">

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="lan" class="form-label">{{ __('Language') }}</label>
                                    @if (!empty($langs))
                                        <select name="language" id="lan" class="form-control">
                                            <option selected disabled>{{ __('Select a Language') }}</option>
                                            @foreach ($langs as $lang)
                                                <option value="{{ $lang->code }}"
                                                    {{ $lang->code == request()->input('language') ? 'selected' : '' }}>
                                                    {{ $lang->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    @endif
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="tran" class="form-label">{{ __('Transation Number') }}</label>
                                    <input type="text" id="tran" class="form-control"
                                        value="{{ request()->input('transaction') }}" placeholder="Search Here..."
                                        name="transaction">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="titl" class="form-label">{{ __('Property Title') }}</label>
                                    <input type="text" id="titl" class="form-control"
                                        value="{{ request()->input('property') }}" placeholder="Search Here..."
                                        name="property">
                                </div>
                            </div>
                            <div class="col-lg-1">
                                <div class="form-group">
                                    <label for="payment" class="form-label">{{ __('Payment Status') }} </label>
                                    <select name="payment" id="payment" class="form-control">
                                        <option value="all"
                                            {{ request()->input('payment') == 'all' ? 'selected' : '' }}>
                                            All</option>
                                        <option value="pending"
                                            {{ request()->input('payment') == 'pending' ? 'selected' : '' }}> {{ __('Pending') }}
                                        </option>
                                        <option value="complete"
                                            {{ request()->input('payment') == 'complete' ? 'selected' : '' }}> {{ __('Complete') }}
                                        </option>
                                        <option value="rejected"
                                            {{ request()->input('payment') == 'rejected' ? 'selected' : '' }}> {{ __('Rejected') }}
                                        </option>
                                    </select>
                                </div>

                            </div>
                            <div class="col-lg-1">
                                <div class="form-group">
                                <label for="Status" class="form-label">{{ __('Featured Status') }} </label>
                                <select name="status" id="Status" class="form-control">
                                    <option value="all" {{ request()->input('status') == 'all' ? 'selected' : '' }}> {{ __('All') }}
                                    </option>
                                    <option value="pending"
                                        {{ request()->input('status') == 'pending' ? 'selected' : '' }}>
                                        Pending</option>
                                    <option value="featured"
                                        {{ request()->input('status') == 'featured' ? 'selected' : '' }}> {{ __('Featured') }}</option>
                                    <option value="rejected"
                                        {{ request()->input('status') == 'rejected' ? 'selected' : '' }}> {{ __('Rejected') }}</option>
                                </select>
                                </div>
                            </div>
                            <div class="col-lg-1 align-self-center">
                                <button type="submit" class="btn mt-2 btn-primary">
                                    Search</button>
                            </div>

                    </form>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">
                        @if (count($featuredRequests) == 0)
                            <h3 class="text-center">{{ __('NO REQUEST FOUND YET') }}</h3>
                        @else
                            <div class="table-responsive">
                                <table class="table table-striped mt-3" id="basic-datatables">
                                    <thead>
                                        <tr>

                                            <th scope="col">{{ __('Transation No') }}</th>
                                            <th scope="col">{{ __('Property Title') }}</th>
                                            <th scope="col">{{ __('Vendor') }}</th>
                                            <th scope="col">{{ __('Pay Via') }}</th>
                                            <th scope="col">{{ __('Payment Status') }}</th>
                                            <th scope="col">{{ __('Attachment/Receipt') }}</th>
                                            <th scope="col">{{ __('Featured Status') }}</th>
                                            <th scope="col">{{ __('Actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($featuredRequests as $key => $request)
                                            @php
                                                $propertyTitle = $request->property?->getContent($language->id)?->title;
                                                $propertySlug = $request->property?->getContent($language->id)?->slug;
                                            @endphp

                                            <tr>
                                                <td>#{{ $request->transaction_id }}</td>
                                                <td class="table-title">
                                                    @if (!empty($propertyTitle))
                                                        <a href="{{ route('frontend.property.details', ['slug' => $propertySlug]) }}"
                                                            target="_blank">
                                                            {{ strlen($propertyTitle) > 100 ? mb_substr(@$propertyTitle, 0, 100, 'utf-8') . '...' : $propertyTitle }}
                                                        </a>
                                                    @endif

                                                </td>
                                                <td>
                                                    @if ($request->vendor_id != 0)
                                                        <a
                                                            href="{{ route('admin.vendor_management.vendor_details', ['id' => @$request->vendor->id, 'language' => $defaultLang->code]) }}">{{ @$request->vendor->username }}</a>
                                                    @else
                                                        <span class="badge badge-success">{{ __('Admin') }}</span>
                                                    @endif
                                                </td>

                                                <td><span class="text-capitalize"> {{ $request->gateway_type }}
                                                    </span>
                                                </td>

                                                <td> {{ $request->price }}
                                                    @if ($request->payment_status == 'complete')
                                                        <span class="badge badge-success"> {{ 'Complete' }}
                                                        </span>
                                                    @elseif($request->payment_status == 'pending')
                                                        <form id="statusForm{{ $request->id }}" class="d-inline-block"
                                                            action="{{ route('admin.update_featured_payment_status') }}"
                                                            method="post">
                                                            @csrf
                                                            <input type="hidden" name="requestId"
                                                                value="{{ $request->id }}">

                                                            <select
                                                                class="form-control {{ $request->payment_status == 'pending' ? 'bg-warning' : 'bg-danger' }} form-control-sm"
                                                                name="payment_status"
                                                                onchange="$('.request-loader').addClass('show');document.getElementById('statusForm{{ $request->id }}').submit();">


                                                                <option
                                                                    {{ $request->payment_status == 'pending' ? 'selected' : '' }}>
                                                                    {{ __('Pending') }}
                                                                </option>
                                                                <option value="complete">
                                                                    {{ __('Complete') }}
                                                                </option>
                                                                <option value="rejected"
                                                                    {{ $request->payment_status == 'rejected' ? 'selected' : '' }}>
                                                                    {{ __('Reject') }}
                                                                </option>
                                                            </select>
                                                        </form>
                                                    @else
                                                        <span class="badge badge-danger"> {{ __('Rejected') }}
                                                        </span>
                                                    @endif
                                                </td>

                                                <td>
                                                    @if (!empty($request->attachment))
                                                        <a class="btn btn-sm btn-info" href="#" data-toggle="modal"
                                                            data-target="#attachmentModal{{ $request->id }}">
                                                            {{ __('Show') }}
                                                        </a>
                                                        @includeIf('backend.featured-properties.show_attachment')
                                                    @else
                                                        -
                                                    @endif
                                                </td>
                                                <td>
                                                    @if ($request->payment_status == 'complete')
                                                        @if ($request->status == 1 || (!empty($request->start_date) && !empty($request->end_date)))
                                                            @if ($request->isExpired)
                                                                <h2 class="d-inline-block">
                                                                    <span
                                                                        class="badge badge-primary">{{ __('Expired') }}</span>
                                                                </h2>
                                                            @else
                                                                <h2 class="d-inline-block">
                                                                    <span
                                                                        class="badge badge-success">{{ __('Featured') }}</span>
                                                                </h2>
                                                            @endif
                                                        @elseif($request->status == 2)
                                                            <span class="badge badge-danger">{{ __('Rejected') }}</span>
                                                        @else
                                                            <form id="statusForm{{ $request->id }}"
                                                                class="d-inline-block"
                                                                action="{{ route('admin.edit_featured_status') }}"
                                                                method="post">
                                                                @csrf
                                                                <input type="hidden" name="requestId"
                                                                    value="{{ $request->id }}">

                                                                <select
                                                                    class="form-control @if ($request->status == 0) bg-warning @elseif($request->status == 1) bg-success @else bg-danger @endif form-control-sm"
                                                                    name="status"
                                                                    onchange="$('.request-loader').addClass('show');document.getElementById('statusForm{{ $request->id }}').submit();">
                                                                    <option value="1"
                                                                        {{ $request->status == 1 ? 'selected' : '' }}>
                                                                        {{ __('Approve') }}
                                                                    </option>
                                                                    <option value="0"
                                                                        {{ $request->status == 0 ? 'selected' : '' }}>
                                                                        {{ __('Pending') }}
                                                                    </option>
                                                                    <option value="2"
                                                                        {{ $request->status == 2 ? 'selected' : '' }}>
                                                                        {{ __('Rejected') }}
                                                                    </option>
                                                                </select>
                                                            </form>
                                                        @endif
                                                    @elseif ($request->payment_status == 'pending')
                                                        <span class="badge badge-warning"> {{ 'Pending' }}
                                                        </span>
                                                    @elseif ($request->payment_status == 'rejected')
                                                        <span class="badge badge-danger"> {{ 'Rejecteds' }}
                                                        </span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @php
                                                        $endDate = \Carbon\Carbon::parse($request->end_date);
                                                    @endphp
                                                   
                                                    <form class="deleteForm d-inline-block"
                                                        action="{{ route('admin.delete_featured_request') }}"
                                                        method="post">
                                                        @csrf
                                                        <input type="hidden" name="id"
                                                            value="{{ $request->id }}">

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
        </div>
    </div>
    </div>
@endsection
