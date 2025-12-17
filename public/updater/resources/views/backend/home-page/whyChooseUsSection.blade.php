@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Why Choose Us Section') }}</h4>
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
                <a href="#">{{ __('Home Page') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Why Choose Us Section') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <div class="card-title">{{ __('Section Image') }}</div>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="aboutImgForm" action="{{ route('admin.home_page.update_why_choose_us_img') }}"
                                method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="form-group">
                                    <label for="">{{ __('Image One') . '*' }}</label>
                                    <br>
                                    <div class="thumb-preview">
                                        @if (empty($info->why_choose_us_section_img1))
                                            <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                class="uploaded-img">
                                        @else
                                            <img src="{{ asset('assets/img/why-choose-us/' . $info->why_choose_us_section_img1) }}"
                                                alt="image" class="uploaded-img">
                                        @endif
                                    </div>

                                    <div class="mt-3">
                                        <div role="button" class="btn btn-primary btn-sm upload-btn">
                                            {{ __('Choose Image') }}
                                            <input type="file" class="img-input" name="why_choose_us_section_img1">
                                        </div>
                                    </div>
                                    @error('why_choose_us_section_img1')
                                        <p class="mt-2 mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="">{{ __('Image Two') . '*' }}</label>
                                    <br>
                                    <div class="thumb-preview">
                                        @if (empty($info->why_choose_us_section_img2))
                                            <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                class="uploaded-img2">
                                        @else
                                            <img src="{{ asset('assets/img/why-choose-us/' . $info->why_choose_us_section_img2) }}"
                                                alt="image" class="uploaded-img2">
                                        @endif
                                    </div>

                                    <div class="mt-3">
                                        <div role="button" class="btn btn-primary btn-sm upload-btn">
                                            {{ __('Choose Image') }}
                                            <input type="file" class="img-input2" name="why_choose_us_section_img2">
                                        </div>
                                    </div>
                                    @error('why_choose_us_section_img2')
                                        <p class="mt-2 mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="">{{ __('Video Link') }}</label>
                                    <input type="url" class="form-control ltr" name="why_choose_us_section_video_link"
                                        value="{{ empty($info->why_choose_us_section_video_link) ? '' : $info->why_choose_us_section_video_link }}"
                                        placeholder="Enter Video Link">
                                </div> 
                            </form>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="submit" form="aboutImgForm" class="btn btn-success">
                                {{ __('Update') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="card-title">{{ __('Why Choose Us Section Information') }}</div>
                        </div>

                        <div class="col-lg-3">
                            @includeIf('backend.partials.languages')
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <form id="aboutForm"
                                action="{{ route('admin.home_page.update_why_choose_us_info', ['language' => request()->input('language')]) }}"
                                method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="">{{ __('Title') }}</label>
                                    <input type="text" class="form-control" name="title"
                                        value="{{ empty($data) ? '' : $data->title }}" placeholder="Enter Title">
                                </div>
                                <div class="form-group">
                                    <label for="">{{ __('Subtitle') }}</label>
                                    <input type="text" class="form-control" name="sub_title"
                                        value="{{ empty($data) ? '' : $data->sub_title }}" placeholder="Enter Subtitle">
                                </div>

                                <div class="form-group">
                                    <label for="">{{ __('Text') }}</label>
                                    <textarea class="form-control summernote" name="text" placeholder="Enter Text" data-height="300">{{ empty($data) ? '' : $data->description }}</textarea>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="submit" form="aboutForm" class="btn btn-success">
                                {{ __('Update') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
