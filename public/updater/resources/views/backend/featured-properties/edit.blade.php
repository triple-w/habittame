@extends('backend.layout')
@includeIf('backend.partials.rtl_style')
@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Edit Pricing') }}</h4>
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
                <a href="#">{{ __('Pricing') }}</a>
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
                    <div class="card-title d-inline-block">{{ __('Edit Pricing') }}</div>
                    <a class="btn btn-info btn-sm float-right d-inline-block"
                        href="{{ route('admin.featured_pricing.index') }}">
                        <span class="btn-label">
                            <i class="fas fa-backward"></i>
                        </span>
                        {{ __('Back') }}
                    </a>
                </div>
                <div class="card-body pt-5 pb-5">
                    <div class="row">
                        <div class="col-lg-6 offset-lg-3">
                            <form id="ajaxForm" class="" action="{{ route('admin.featured_pricing.update') }}"
                                method="post" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="pricing_id" value="{{ $pricing->id }}">

                                <div class="form-group">
                                    <label class="form-label">{{ __('Number Of Days') }}
                                        *</label>
                                    <input type="text" name="number_of_days" class="form-control"
                                        value="{{ $pricing->number_of_days }}"
                                        placeholder="{{ __('Enter how many properties does the vendor make featured') }}">
                                    <p id="err_number_of_days" class="mb-0 text-danger em"></p>
                                </div>

                                <div class="form-group">
                                    <label for="price">{{ __('Price') }}
                                        ({{ $settings->base_currency_text }})*</label>
                                    <input id="price" type="number" class="form-control" name="price"
                                        placeholder="{{ __('Enter Package price') }}" value="{{ $pricing->price }}">
                                    <p class="text-warning">
                                        <small>{{ __('If price is 0 , than it will appear as free') }}</small>
                                    </p>
                                    <p id="err_price" class="mb-0 text-danger em"></p>
                                </div>


                                <div class="form-group">
                                    <label for="status">{{ __('Status') }}*</label>
                                    <select id="status" class="form-control ltr" name="status">
                                        <option value="" selected disabled>{{ __('Select a status') }}</option>
                                        <option value="1" {{ $pricing->status == '1' ? 'selected' : '' }}>
                                            {{ __('Active') }}</option>
                                        <option value="0" {{ $pricing->status == '0' ? 'selected' : '' }}>
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
                                <button type="submit" id="submitBtn" class="btn btn-success">{{ __('Update') }}</button>
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
@endsection
