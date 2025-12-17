@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ !empty($pageHeading) ? $pageHeading->about_us_title : __('About Us') }}
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keywords_about_page }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_about_page }}
    @endif
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->about_us_title : __('About Us'),
        'subtitle' => __('About Us'),
    ])

    @if ($secInfo->about_section_status == 1)
        <section class="about-area pt-100 pb-70 mt-30">
            <div class="container">
                <div class="row gx-xl-5">
                    <div class="col-lg-6">
                        <div class="img-content mb-30" data-aos="fade-right">
                            <div class="image">
                                <img class="lazyload blur-up"
                                    data-src="{{ asset('assets/img/about_section/' . $aboutImg->about_section_image1) }}">

                                <img class="lazyload blur-up"
                                    data-src="{{ asset('assets/img/about_section/' . $aboutImg->about_section_image2) }}">
                            </div>
                            <div class="absolute-text bg-secondary">
                                <div class="center-text">
                                    <span class="h2 color-primary">{{ $aboutInfo?->years_of_expricence }}+</span>
                                    <span>{{ __('Years') }}</span>
                                </div>
                                <div id="curveText">{{ __('We are highly experience') }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="content  mb-30" data-aos="fade-left">
                            <div class="content-title">
                                <span class="subtitle"><span
                                        class="line"></span>{{ $aboutInfo->title}}</span>
                                <h2>{{ $aboutInfo?->sub_title }}</h2>
                            </div>
                            <div class="text summernote-content">{!! $aboutInfo?->description !!}</div>

                            <div class="d-flex align-items-center flex-wrap gap-15">


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    @if ($secInfo->why_choose_us_section_status == 1)
        <section class="choose-area pb-70">
            <div class="container">
                <div class="row gx-xl-5">
                    <div class="col-lg-7">
                        <div class="img-content mb-30 image-right" data-aos="fade-left">
                            <div class="img-1">
                                <img class="lazyload blur-up"
                                    data-src="  {{ asset('assets/img/why-choose-us/' . $whyChooseUsImg->why_choose_us_section_img1) }} ">
                                @if (!empty($whyChooseUsImg->why_choose_us_section_video_link))
                                    <a href="{{ $whyChooseUsImg->why_choose_us_section_video_link }}"
                                        class="video-btn youtube-popup p-absolute">
                                        <i class="fas fa-play"></i>
                                    </a>
                                @endif
                            </div>
                            <div class="img-2">
                                <img class="lazyload blur-up"
                                    data-src="  {{ asset('assets/img/why-choose-us/' . $whyChooseUsImg->why_choose_us_section_img2) }} ">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 order-lg-first">
                        <div class="content" data-aos="fade-right">
                            <div class="content-title">
                                <span class="subtitle"><span
                                        class="line"></span>{{ $whyChooseUsInfo->title}}</span>
                                <h2>{{ $whyChooseUsInfo?->sub_title }}</h2>
                            </div>
                            <div class="text">{!! $whyChooseUsInfo?->description !!}</div>


                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    @if ($secInfo->work_process_section_status == 1)
        <section class="work-process pt-100 pb-70">
            <!-- Bg image -->
            <img class="lazyload bg-img" src="{{ asset('assets/front/images/2548hg445t5464676.png') }}">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-center mb-40" data-aos="fade-up">
                            <span class="subtitle">{{ $workProcessSecInfo->title }}</span>
                            <h2 class="title">{{ $workProcessSecInfo?->subtitle }}</h2>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row gx-xl-5">
                            @foreach ($processes as $process)
                                <div class="col-xl-3 col-lg-4 col-sm-6" data-aos="fade-up">
                                    <div class="process-item text-center mb-30 color-1">
                                        <div class="process-icon">
                                            <div class="progress-content">
                                                <span class="h2 lh-1">{{ $loop->iteration }}</span>
                                                <i class="{{ $process->icon }}"></i>
                                            </div>
                                            <div class="progressbar-line-outer"></div>
                                            <div class="progressbar-line-inner">
                                                <svg>
                                                    <circle class="progressbar-circle" r="96" cx="100" cy="100"
                                                        stroke-dasharray="500" stroke-dashoffset="180" stroke-width="6"
                                                        fill="none" transform="rotate(-5 100 100)">
                                                    </circle>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="process-content mt-20">
                                            <h3 class="process-title">{{ $process?->title }}</h3>
                                            <p class="text m-0">{{ $process?->text }}</p>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->testimonial_section_status == 1)
        <section class="testimonial-area pt-100 pb-70">
            <div class="overlay-bg d-none d-lg-block">
                <img class="lazyload blur-up" data-src="{{ asset('assets/img/' . $testimonialSecImage) }}">
            </div>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4">
                        <div class="content mb-30" data-aos="fade-up">
                            <div class="content-title">
                                <span class="subtitle"><span
                                        class="line"></span>{{ $testimonialSecInfo->title }}</span>
                                <h2 class="title">
                                    {{ !empty($testimonialSecInfo?->subtitle) ? $testimonialSecInfo?->subtitle : '' }}</h2>
                            </div>
                            <p class="text mb-30">
                                {{ !empty($testimonialSecInfo?->content) ? $testimonialSecInfo?->content : '' }}</p>
                            <!-- Slider navigation buttons -->
                            <div class="slider-navigation scroll-animate">
                                <button type="button" title="Slide prev" class="slider-btn slider-btn-prev">
                                    <i class="fal fa-angle-left"></i>
                                </button>
                                <button type="button" title="Slide next" class="slider-btn slider-btn-next">
                                    <i class="fal fa-angle-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="swiper" id="testimonial-slider-1">
                            <div class="swiper-wrapper">
                                @foreach ($testimonials as $testimonial)
                                    <div class="swiper-slide pb-30" data-aos="fade-up">
                                        <div class="slider-item">
                                            <div class="client-img">
                                                <div class="lazy-container ratio ratio-1-1">
                                                    @if (is_null($testimonial->image))
                                                        <img data-src="{{ asset('assets/img/profile.jpg') }}"
                                                            class="lazyload">
                                                    @else
                                                        <img class="lazyload"
                                                            data-src="{{ asset('assets/img/clients/' . $testimonial->image) }}">
                                                    @endif


                                                </div>
                                            </div>
                                            <div class="client-content mt-30">
                                                <div class="quote">
                                                    <p class="text">{{ $testimonial->comment }}</p>
                                                </div>
                                                <div
                                                    class="client-info d-flex flex-wrap gap-10 align-items-center justify-content-between">
                                                    <div class="content">
                                                        <h6 class="name">{{ $testimonial->name }}</h6>
                                                        <span class="designation">{{ $testimonial->occupation }}</span>
                                                    </div>
                                                    <div class="ratings">

                                                        <div class="rate">
                                                            <div class="rating-icon"
                                                                style="width: {{ $testimonial->rating * 20 }}%"></div>
                                                        </div>
                                                        <span class="ratings-total">({{ $testimonial->rating }}) </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    @if (!empty(showAd(3)))
        <div class="text-center mt-4">
            {!! showAd(3) !!}
        </div>
        {{-- Spacer --}}
        <div class="pb-100"></div>
    @endif

@endsection
