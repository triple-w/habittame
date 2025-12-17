@extends('backend.layout')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Admin Profile') }}</h4>
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
                <a href="#">{{ __('Profile Settings') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card-title">{{ __('Update Profile') }}</div>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            @if ($errors->any())
                                <div class="alert alert-danger pb-1  " id="carErrors">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <ul>
                                        @foreach ($languages as $language)
                                            @if ($errors->has($language->code . '_first_name'))
                                                <li class="text-danger">
                                                    {{ $errors->first($language->code . '_first_name') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_last_name'))
                                                <li class="text-danger">
                                                    {{ $errors->first($language->code . '_last_name') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_country'))
                                                <li class="text-danger"> {{ $errors->first($language->code . '_country') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_city'))
                                                <li class="text-danger"> {{ $errors->first($language->code . '_city') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_state'))
                                                <li class="text-danger"> {{ $errors->first($language->code . '_state') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_zip_code'))
                                                <li class="text-danger"> {{ $errors->first($language->code . '_zip_code') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_email'))
                                                <li class="text-danger"> {{ $errors->first($language->code . '_email') }}
                                                </li>
                                            @endif
                                            @if ($errors->has($language->code . '_details'))
                                                <li class="text-danger"> {{ $errors->first($language->code . '_details') }}
                                                </li>
                                            @endif
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            <form id="editProfileForm" action="{{ route('admin.update_profile') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="">{{ __('Image') . '*' }}</label>
                                            <br>
                                            <div class="thumb-preview">
                                                @if (!empty($admin->image))
                                                    <img src="{{ asset('assets/img/admins/' . $admin->image) }}"
                                                        alt="image" class="uploaded-img">
                                                @else
                                                    <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                        class="uploaded-img">
                                                @endif
                                            </div>

                                            <div class="mt-3">
                                                <div role="button" class="btn btn-primary btn-sm upload-btn">
                                                    {{ __('Choose Image') }}
                                                    <input type="file" class="img-input" name="image">
                                                </div>
                                            </div>
                                            @if ($errors->has('image'))
                                                <p class="mt-2 mb-0 text-danger">{{ $errors->first('image') }}</p>
                                            @endif
                                            <p class="text-warning mt-2 mb-0">
                                                {{ __('Upload squre size image for best quality.') }}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>{{ __('Username') . '*' }}</label>
                                            <input type="text" class="form-control" name="username"
                                                value="{{ $admin->username }}">
                                            @if ($errors->has('username'))
                                                <p class="mt-2 mb-0 text-danger">{{ $errors->first('username') }}</p>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>{{ __('Email') . '*' }}</label>
                                            <input type="email" class="form-control" name="email"
                                                value="{{ $admin->email }}">
                                            @if ($errors->has('email'))
                                                <p class="mt-2 mb-0 text-danger">{{ $errors->first('email') }}</p>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>{{ __('Phone') }}</label>
                                            <input type="text" class="form-control" name="phone"
                                                value="{{ $admin->phone }}">
                                            @if ($errors->has('phone'))
                                                <p class="mt-2 mb-0 text-danger">{{ $errors->first('phone') }}</p>
                                            @endif
                                        </div>
                                    </div>

                                </div>


                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox"
                                                            {{ $admin->show_email_addresss == 1 ? 'checked' : '' }}
                                                            name="show_email_addresss" class="custom-control-input"
                                                            id="show_email_addresss">
                                                        <label class="custom-control-label"
                                                            for="show_email_addresss">{{ __('Show Email Address') }}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox"
                                                            {{ $admin->show_phone_number == 1 ? 'checked' : '' }}
                                                            name="show_phone_number" class="custom-control-input"
                                                            id="show_phone_number">
                                                        <label class="custom-control-label"
                                                            for="show_phone_number">{{ __('Show Phone Number') }}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox"
                                                            {{ $admin->show_contact_form == 1 ? 'checked' : '' }}
                                                            name="show_contact_form" class="custom-control-input"
                                                            id="show_contact_form">
                                                        <label class="custom-control-label"
                                                            for="show_contact_form">{{ __('Show  Contact Form') }}</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div id="accordion" class="mt-5">
                                            @foreach ($languages as $language)
                                                <div class="version">
                                                    <div class="version-header" id="heading{{ $language->id }}">
                                                        <h5 class="mb-0">
                                                            <button type="button" class="btn btn-link "
                                                                data-toggle="collapse"
                                                                data-target="#collapse{{ $language->id }}"
                                                                aria-expanded="{{ $language->is_default == 1 ? 'true' : 'false' }}"
                                                                aria-controls="collapse{{ $language->id }}">
                                                                {{ $language->name . __(' Language') }}
                                                                {{ $language->is_default == 1 ? '(Default)' : '' }}
                                                            </button>
                                                        </h5>
                                                    </div>

                                                    @php
                                                        $vendor_info = App\Models\AdminInfo::where('admin_id', $admin->id)
                                                            ->where('language_id', $language->id)
                                                            ->first();
                                                    @endphp

                                                    <div id="collapse{{ $language->id }}"
                                                        class="collapse {{ $language->is_default == 1 ? 'show' : '' }}"
                                                        aria-labelledby="heading{{ $language->id }}"
                                                        data-parent="#accordion">
                                                        <div class="version-body">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('First Name*') }}</label>
                                                                        <input type="text"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->first_name : '' }}"
                                                                            class="form-control"
                                                                            name="{{ $language->code }}_first_name"
                                                                            placeholder="Enter First Name">

                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('Last Name*') }}</label>
                                                                        <input type="text"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->last_name : '' }}"
                                                                            class="form-control"
                                                                            name="{{ $language->code }}_last_name"
                                                                            placeholder="Enter Last Name">

                                                                    </div>
                                                                </div>


                                                                <div class="col-lg-4">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('Country') }}</label>
                                                                        <input type="text"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->country : '' }}"
                                                                            class="form-control"
                                                                            name="{{ $language->code }}_country"
                                                                            placeholder="Enter Country">

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('City') }}</label>
                                                                        <input type="text"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->city : '' }}"
                                                                            class="form-control"
                                                                            name="{{ $language->code }}_city"
                                                                            placeholder="Enter City">

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('State') }}</label>
                                                                        <input type="text"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->state : '' }}"
                                                                            class="form-control"
                                                                            name="{{ $language->code }}_state"
                                                                            placeholder="Enter State">

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('Zip Code') }}</label>
                                                                        <input type="text"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->zipcode : '' }}"
                                                                            class="form-control"
                                                                            name="{{ $language->code }}_zip_code"
                                                                            placeholder="Enter Zip Code">

                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('Address') }}</label>
                                                                        <input type="text"
                                                                            name="{{ $language->code }}_address"
                                                                            class="form-control"
                                                                            placeholder="Enter Address"
                                                                            value="{{ !empty($vendor_info) ? $vendor_info->address : '' }}">

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <div
                                                                        class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                        <label>{{ __('Details') }}</label>
                                                                        <textarea name="{{ $language->code }}_details" class="form-control" rows="5" placeholder="Enter Details">{{ !empty($vendor_info) ? $vendor_info->details : '' }}</textarea>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>


                            </form>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="submit" form="editProfileForm" class="btn btn-success">
                                {{ __('Update') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
