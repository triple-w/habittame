@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")
@section('pageHeading')
    {{ __('Editar Perfil') }}
@endsection


@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->edit_profile_page_title : __('Editar Perfil'),
        'subtitle' => __('Editar Perfil'),
    ])


    <!--====== Start Dashboard Section ======-->
    <div class="user-dashboard pt-100 pb-60">
        <div class="container">
            <div class="row gx-xl-5">
                @includeIf('frontend.user.side-navbar')
                <div class="col-lg-9">
                    <div class="user-profile-details mb-40">
                        <div class="account-info radius-md">
                            <div class="title">
                                <h4>{{ __('Editar Perfil') }}</h4>
                            </div>
                            <div class="edit-info-area">
                                @if (Session::has('success'))
                                    <div class="alert alert-success">{{ Session::get('success') }}</div>
                                @endif
                                <form action="{{ route('user.update_profile') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="upload-img">
                                        <div class="file-upload-area">
                                            <div class="file-edit">
                                                <input type='file' id="imageUpload" name="image" />
                                                <label for="imageUpload"></label>
                                            </div>
                                            <div class="file-preview">
                                                @if (Auth::guard('web')->user()->image != null)
                                                    <div id="imagePreview" class="lazyload bg-img"
                                                        src="{{ asset('assets/img/users/' . Auth::guard('web')->user()->image) }}">
                                                    @else
                                                        <div id="imagePreview" class="lazyload bg-img"
                                                            src="{{ asset('assets/img/blank-user.jpg') }}">
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div id="errorMsg"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Name') . ' *' }}</label>
                                    <input type="text" class="form-control"
                                        value="{{ Auth::guard('web')->user()->name }}" placeholder="{{ __('Name') }}"
                                        name="name">
                                    @error('name')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Username') . ' *' }}</label>
                                    <input type="text" class="form-control" placeholder="{{ __('Username') }}"
                                        name="username" value="{{ Auth::guard('web')->user()->username }}">
                                    @error('username')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Email') . ' *' }}</label>
                                    <input type="email" class="form-control" placeholder="{{ __('Email') }}"
                                        name="email" value="{{ Auth::guard('web')->user()->email }}">
                                    @error('email')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Phone') }}</label>
                                    <input type="text" class="form-control" placeholder="{{ __('Phone') }}"
                                        name="phone" value="{{ Auth::guard('web')->user()->phone }}">
                                    @error('phone')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('País') }}</label>
                                    <input type="text" class="form-control" placeholder="{{ __('País') }}"
                                        name="country" value="{{ Auth::guard('web')->user()->country }}">
                                    @error('country')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Ciudad') }}</label>
                                    <input type="text" class="form-control" placeholder="{{ __('Ciudad') }}"
                                        name="city" value="{{ Auth::guard('web')->user()->city }}">
                                    @error('city')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Estado') }}</label>
                                    <input type="text" class="form-control" placeholder="{{ __('Estado') }}"
                                        name="state" value="{{ Auth::guard('web')->user()->state }}">
                                    @error('state')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Zip Code') }}</label>
                                    <input type="text" class="form-control" placeholder="{{ __('Zip Code') }}"
                                        name="zip_code" value="{{ Auth::guard('web')->user()->zip_code }}">
                                    @error('zip_code')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="form-group mb-30">
                                    <label for="" class="mb-1">{{ __('Address') }}</label>
                                    <textarea name="address" id="" class="form-control" rows="3" placeholder="{{ __('Address') }}">{{ Auth::guard('web')->user()->address }}</textarea>
                                    @error('address')
                                        <p class="text-danger mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-lg-12 mb-15">
                                <div class="form-button">
                                    <button type="submit"
                                        class="btn btn-lg btn-primary">{{ __('Update Profile') }}</button>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--====== End Dashboard Section ======-->
@endsection
