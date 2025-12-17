@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl-style')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('About Section') }}</h4>
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
                <a href="#">{{ __('About Section') }}</a>
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
                            <form id="aboutImgForm" action="{{ route('admin.home_page.update_about_img') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="form-group">
                                    <label for="">{{ __('Image One') . '*' }}</label>
                                    <br>
                                    <div class="thumb-preview">
                                        @if (empty($info->about_section_image1))
                                            <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                class="uploaded-img">
                                        @else
                                            <img src="{{ asset('assets/img/about_section/' . $info->about_section_image1) }}"
                                                alt="image" class="uploaded-img">
                                        @endif
                                    </div>

                                    <div class="mt-3">
                                        <div role="button" class="btn btn-primary btn-sm upload-btn">
                                            {{ __('Choose Image') }}
                                            <input type="file" class="img-input" name="about_section_image1">
                                        </div>
                                    </div>
                                    @error('about_section_image1')
                                        <p class="mt-2 mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="">{{ __('Image Two') . '*' }}</label>
                                    <br>
                                    <div class="thumb-preview">
                                        @if (empty($info->about_section_image2))
                                            <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                class="uploaded-img2">
                                        @else
                                            <img src="{{ asset('assets/img/about_section/' . $info->about_section_image2) }}"
                                                alt="image" class="uploaded-img2">
                                        @endif
                                    </div>

                                    <div class="mt-3">
                                        <div role="button" class="btn btn-primary btn-sm upload-btn">
                                            {{ __('Choose Image') }}
                                            <input type="file" class="img-input2" name="about_section_image2">
                                        </div>
                                    </div>
                                    @error('about_section_image2')
                                        <p class="mt-2 mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>


                                <div class="form-group">
                                    <label for="">{{ __('Video Link') }}</label>
                                    <input type="url" class="form-control ltr" name="about_section_video_link"
                                        value="{{ empty($info->about_section_video_link) ? '' : $info->about_section_video_link }}"
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
                            <div class="card-title">{{ __('About Section Information') }}</div>
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
                                action="{{ route('admin.home_page.update_about_info', ['language' => request()->input('language')]) }}"
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
                                <div class="row">
                                    @if ($settings->theme_version == 1)
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">{{ __('Years of Exprience') }}</label>
                                                <input type="number" class="form-control ltr" name="years_of_expricence"
                                                    value="{{ empty($data->years_of_expricence) ? '' : $data->years_of_expricence }}"
                                                    placeholder="Years of exprience">
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">{{ __('Client Text') }}</label>
                                            <input type="text" class="form-control ltr" name="client_text"
                                                value="{{ empty($data->client_text) ? '' : $data->client_text }}"
                                                placeholder="Enter Client Text">
                                        </div>
                                    </div>
                                      <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">{{ __('Button Name') }}</label>
                                            <input type="text" class="form-control" name="button_name"
                                                placeholder="Enter Button Name"
                                                value="{{ empty($data) ? '' : $data->btn_name }}">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">{{ __('Button URL') }}</label>
                                            <input type="url" class="form-control ltr" name="button_url"
                                                placeholder="Enter Button URL"
                                                value="{{ empty($data) ? '' : $data->btn_url }}">
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
