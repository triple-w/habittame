@php
    $version = $basicInfo->theme_version;
@endphp
@extends('frontend.layouts.layout-v' . $version)
@section('pageHeading')
    {{ __('Home') }}
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keyword_home }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_home }}
    @endif
@endsection

@section('content')

    <section class="home-banner home-banner-3 with-radius">
        <img class="lazyload bg-img blur-up" src="{{ asset('assets/img/hero/static/' . $heroImg) }}" alt="Banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-7 col-lg-7">
                    <div class="content mb-40" data-aos="fade-up">
                        <h1 class="title color-white">{{ @$heroStatic->title }}</h1>
                        <p class="text color-white m-0">
                            {{ @$heroStatic->text }}
                        </p>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5">
                    <div class="filter-form mb-40" data-aos="fade-up">
                        <div class="tabs-navigation">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#rent"
                                        type="button">{{ __('Rent') }}</button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#sale"
                                        type="button">{{ __('Sale') }}</button>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <input type="hidden" id="currency_symbol" value="{{ $basicInfo->base_currency_symbol }}">
                            <input type="hidden" name="min" value="{{ $min }}" id="min">
                            <input type="hidden" name="max" value="{{ $max }}" id="max">

                            <input class="form-control" type="hidden" value="{{ $min }}" id="o_min">
                            <input class="form-control" type="hidden" value="{{ $max }}" id="o_max">
                            <div class="tab-pane fade show active" id="rent">
                                <form action="{{ route('frontend.properties') }}" method="get">
                                    <div class="row">
                                        <input type="hidden" name="purposre" value="rent">
                                        <input type="hidden" name="min" value="{{ $min }}" id="min1">
                                        <input type="hidden" name="max" value="{{ $max }}" id="max1">
                                        <div class="col-lg-12 col-md-6">
                                            <div class="form-group mb-20">
                                                <input type="text" id="search1" name="location" class="form-control"
                                                    placeholder="{{ __('Location') }}">

                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group mb-20">
                                                <select aria-label="#" name="type" class="form-control select2 type"
                                                    id="type">
                                                    <option selected disabled>{{ __('Select Property') }}</option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    <option value="residential">{{ __('Residential') }}</option>
                                                    <option value="commercial">{{ __('Commercial') }}</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="  col-sm-6">
                                            <div class="form-group mb-20">
                                                <select aria-label="#" class="form-control select2 bringCategory"
                                                    id="category" name="category">
                                                    <option selected disabled>{{ __('Select Category') }}</option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    @foreach ($all_proeprty_categories as $category)
                                                        <option value="{{ $category?->categoryContent?->slug }}">
                                                            {{ $category?->categoryContent?->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group city mb-20">

                                            <select aria-label="#" name="city" class="form-control select2 city_id"
                                                id="city">
                                                <option disabled selected>{{ __('Select City') }}</option>
                                                <option value="all">{{ __('All') }}</option>
                                                @foreach ($all_cities as $city)
                                                    <option data-id="{{ $city->id }}"
                                                        value="{{ $city->cityContent?->name }}">
                                                        {{ $city->cityContent?->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-lg-12 col-md-6">
                                            <div class="form-group mb-20">
                                                <div class="form-control price-slider">
                                                    <div data-range-slider="filterPriceSlider"></div>
                                                    <span data-range-value="filterPriceSliderValue"
                                                        class="w-60">{{ symbolPrice($min) }}
                                                        -
                                                        {{ symbolPrice($max) }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-6 text-center">
                                            <button type="submit" class="btn btn-lg btn-primary icon-start">
                                                <i class="fal fa-search"></i>
                                                {{ __('Search') }}
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="sale">
                                <form action="{{ route('frontend.properties') }}" method="get">
                                    <div class="row">
                                        <input type="hidden" name="purposre" value="sale">
                                        <input type="hidden" name="min" value="{{ $min }}"
                                            id="min2">
                                        <input type="hidden" name="max" value="{{ $max }}"
                                            id="max2">
                                        <div class="col-lg-12 col-md-6">
                                            <div class="form-group mb-20">
                                                <input type="text" id="search1" name="location"
                                                    class="form-control" placeholder="{{ __('Location') }}">

                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group mb-20">
                                                <select aria-label="#" name="type" class="form-control select2 type"
                                                    id="type1">
                                                    <option selected disabled>{{ __('Select Property') }}</option>
                                                    <option selected value="all">{{ __('All') }}</option>
                                                    <option value="residential">{{ __('Residential') }}</option>
                                                    <option value="commercial">{{ __('Commercial') }}</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="  col-sm-6">
                                            <div class="form-group mb-20">
                                                <select aria-label="#" class="form-control select2 bringCategory"
                                                    id="category1" name="category">
                                                    <option selected disabled>{{ __('Select Category') }}</option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    @foreach ($all_proeprty_categories as $category)
                                                        <option value="{{ $category?->categoryContent?->slug }}">
                                                            {{ $category?->categoryContent?->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group city mb-20">

                                            <select aria-label="#" name="city" class="form-control select2 city_id"
                                                id="city1">
                                                <option disabled selected>{{ __('Select City') }}</option>
                                                <option selected value="all">{{ __('All') }}</option>
                                                @foreach ($all_cities as $city)
                                                    <option data-id="{{ $city->id }}"
                                                        value="{{ $city->cityContent?->name }}">
                                                        {{ $city->cityContent?->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-lg-12 col-md-6">
                                            <div class="form-group mb-20">
                                                <div class="form-control price-slider">
                                                    <div data-range-slider="filterPriceSlider2"></div>
                                                    <span data-range-value="filterPriceSlider2Value"
                                                        class="w-60">{{ symbolPrice($min) }}
                                                        -
                                                        {{ symbolPrice($max) }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-6 text-center">
                                            <button type="submit" class="btn btn-lg btn-primary icon-start">
                                                <i class="fal fa-search"></i>
                                                {{ __('Search') }}
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    @if ($secInfo->brand_section_status == 1)
        <div class="sponsor ptb-100" data-aos="fade-up">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="swiper sponsor-slider">
                            <div class="swiper-wrapper">
                                @forelse ($brands as $brand)
                                    <div class="swiper-slide">
                                        <div class="item-single d-flex justify-content-center" data-aos="fade-up">
                                            <div class="sponsor-img">
                                                <a href="{{ $brand->url ?? '#' }}" target="_blank">
                                                    <img src="{{ asset('assets/img/brands/' . $brand->image) }}"
                                                        alt="Sponsor">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                @empty
                                    <div class="p-3 text-center w-100">
                                        <h3 class="mb-0"> {{ __('No Brands Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                            <div class="swiper-pagination position-static mt-30" id="sponsor-slider-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

    @if ($secInfo->category_section_status == 1)
        <section class="category category-2 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-center mb-40" data-aos="fade-up">
                            <span class="subtitle">{{ @$catgorySecInfo->title }}</span>
                            <h2 class="title">{{ $catgorySecInfo?->subtitle }}</h2>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="swiper" id="category-slider-2">
                            <div class="swiper-wrapper">
                                @forelse ($property_categories as $category)
                                    <div class="swiper-slide color-1">
                                        <a
                                            href="{{ route('frontend.properties', ['category' => $category->categoryContent?->slug]) }}">
                                            <div class="category-item radius-md text-center">
                                                <div class="category-icons">
                                                    <img src="{{ asset('assets/img/property-category/' . $category->image) }}"
                                                        alt="">
                                                </div>
                                                <span
                                                    class="category-title d-block mt-3 m-0 color-medium">{{ $category?->categoryContent?->name }}</span>
                                            </div>
                                        </a>
                                    </div>
                                @empty
                                    <div class="p-3 text-center w-100">
                                        <h3 class="mb-0"> {{ __('No Categories Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                            <div class="swiper-pagination position-static mt-30" id="category-slider-2-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shape">
                <img class="shape-1" src="{{ asset('assets/front/') }}/images/shape/shape-1.png" alt="Shape">
                <img class="shape-2" src="{{ asset('assets/front/') }}/images/shape/shape-2.png" alt="Shape">
                <img class="shape-3" src="{{ asset('assets/front/') }}/images/shape/shape-3.png" alt="Shape">
                <img class="shape-4" src="{{ asset('assets/front/') }}/images/shape/shape-4.png" alt="Shape">
                <img class="shape-5" src="{{ asset('assets/front/') }}/images/shape/shape-10.png" alt="Shape">
            </div>
        </section>
    @endif

    @if ($secInfo->property_section_status == 1)
        <section class="product-area popular-product pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-inline mb-10" data-aos="fade-up">
                            <h2 class="title mb-20">{{ $propertySecInfo->title ?? 'Our Popular Properties' }}</h2>
                            <div class="slider-navigation mb-20">
                                <button type="button" title="Slide prev" class="slider-btn product-slider-btn-prev">
                                    <i class="fal fa-angle-left"></i>
                                </button>
                                <button type="button" title="Slide next" class="slider-btn product-slider-btn-next">
                                    <i class="fal fa-angle-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="swiper product-slider">
                            <div class="swiper-wrapper">
                                @forelse ($properties as $property)
                                    <div class="swiper-slide">

                                        <x-property :property="$property" />
                                    </div>
                                @empty
                                    <div class="p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Properties Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->about_section_status == 1)
        <section class="about-area about-2 pb-70">
            <div class="container">
                <div class="row align-items-center gx-xl-5">
                    <div class="col-lg-5">
                        <div class="content mb-30" data-aos="fade-up">
                            <div class="content-title">
                                <span class="subtitle">{{ @$aboutInfo->title }}</span>
                                <h2>{{ $aboutInfo?->sub_title }}</h2>
                            </div>
                            <div class="text summernote-content">{!! $aboutInfo?->description !!}</div>

                            <div class="d-flex align-items-center flex-wrap gap-15">
                                @if (!empty($aboutInfo->btn_url))
                                    <a href="{{ $aboutInfo->btn_url }}"
                                        class="btn btn-lg btn-primary">{{ $aboutInfo?->btn_name }}</a>
                                @endif
                                @if (!empty($aboutInfo->client_text))
                                    <div class="clients">
                                        <span class="color-primary">{{ $aboutInfo?->client_text }}</span>
                                        <div class="client-img mt-1">
                                            <img src="{{ asset('assets/front/') }}/images/client/client-1.jpg">
                                            <img src="{{ asset('assets/front/') }}/images/client/client-2.jpg">
                                            <img src="{{ asset('assets/front/') }}/images/client/client-3.jpg">
                                            <img src="{{ asset('assets/front/') }}/images/client/client-4.jpg">
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="img-content img-right mb-30" data-aos="fade-up">
                            <div class="img-1">
                                <img class="lazyload blur-up" src="{{ asset('assets/front/images/placeholder.png') }}"
                                    data-src="{{ asset('assets/img/about_section/' . $aboutImg->about_section_image1) }}"
                                    alt="Image">
                            </div>
                            <div class="img-2">
                                <img class="lazyload blur-up" src="{{ asset('assets/front/images/placeholder.png') }}"
                                    data-src="{{ asset('assets/img/about_section/' . $aboutImg->about_section_image2) }}"
                                    alt="Image">
                                @if (!empty($aboutImg->about_section_video_link))
                                    <a href="{{ $aboutImg->about_section_video_link }}"
                                        class="video-btn youtube-popup p-absolute">
                                        <i class="fas fa-play"></i>
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bg shape -->
            <div class="shape">
                <img class="shape-1" src="{{ asset('assets/front/') }}/images/shape/shape-2.png" alt="Shape">
                <img class="shape-2" src="{{ asset('assets/front/') }}/images/shape/shape-9.png" alt="Shape">
                <img class="shape-3" src="{{ asset('assets/front/') }}/images/shape/shape-8.png" alt="Shape">
                <img class="shape-4" src="{{ asset('assets/front/') }}/images/shape/shape-3.png" alt="Shape">
            </div>
        </section>
    @endif

    @if ($secInfo->work_process_section_status == 1)
        <section class="work-process work-process-2 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-center mb-40" data-aos="fade-up">
                            <span class="subtitle">{{ @$workProcessSecInfo->title }}</span>
                            <h2 class="title">{{ $workProcessSecInfo?->subtitle }}</h2>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="row gx-xl-5">
                            @forelse ($processes as $process)
                                <div class="col-xl-3 col-lg-4 col-md-6">
                                    <div class="card mb-30 color-1">
                                        <div class="card-content border text-center">
                                            <div class="card-step h3 lh-1"><span>{{ $loop->iteration }}</span></div>
                                            <div class="card-icon">
                                                <i class="{{ $process->icon }}"></i>
                                            </div>
                                            <h3 class="card-title">{{ $process->title }}</h3>
                                            <p class="card-text m-0">{{ $process->text }}</p>
                                        </div>
                                        <span class="line line-top"></span>
                                        <span class="line line-right"></span>
                                        <span class="line line-bottom"></span>
                                    </div>
                                </div>
                            @empty
                                <div class="p-3 text-center mb-30 w-100">
                                    <h3 class="mb-0"> {{ __('No Work Process Found') }}</h3>
                                </div>
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->counter_section_status == 1)
        <div class="counter-area with-radius border pt-100 pb-70">
            <img class="lazyload bg-img blur-up" src="{{ asset('assets/front/images/2567u56gy855.png') }}"
                alt="Image">
            <div class="container">
                <div class="row gx-xl-5">
                    @forelse ($counters as $counter)
                        <div class="col-sm-6 col-lg-3" data-aos="fade-up">
                            <div class="card mb-30">
                                <div class="d-flex align-items-center justify-content-center mb-10">
                                    <div class="card-icon me-2 color-primary"><i class="{{ $counter->icon }}"></i></div>
                                    <h2 class="m-0 color-primary"><span class="counter">{{ $counter->amount }}</span>+
                                    </h2>
                                </div>
                                <p class="card-text text-center">{{ $counter->title }}</p>
                            </div>
                        </div>
                    @empty
                        <div class="p-3 text-center mb-30 w-100">
                            <h3 class="mb-0"> {{ __('No Counter Information Found') }}</h3>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    @endif

    @if ($secInfo->project_section_status == 1)
        <section class="projects-area pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-center mb-40" data-aos="fade-up">
                            <span class="subtitle">{{ @$projectInfo->title }}</span>
                            <h2 class="title mb-20">{{ $projectInfo?->subtitle }}</h2>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="row">
                            @forelse ($projects as $project)
                                <div class="col-lg-4 col-md-6 mb-30">
                                    <a href="{{ route('frontend.projects.details', ['slug' => $project->slug]) }}">
                                        <div class="card product-default">
                                            <div class="card-img">
                                                <img src="{{ asset('assets/img/project/featured/' . $project->featured_image) }}"
                                                    alt="Product">
                                                <span class="label">
                                                    {{ $project->status == 1 ? __('Complete') : __('Under Construction') }}
                                                </span>
                                            </div>
                                            <div class="card-text product-title text-center p-3">
                                                <h3 class="card-title product-title color-white mb-1">
                                                    {{ @$project->title }}

                                                </h3>
                                                <span class="location icon-start"><i
                                                        class="fal fa-map-marker-alt"></i>{{ $project->address }}</span>
                                                <span class="price">{{ symbolPrice($project->min_price) }}
                                                    {{ !empty($project->max_price) ? ' - ' . symbolPrice($project->max_price) : '' }}</span>
                                                @if ($project->agent)
                                                    <a class="color-medium"
                                                        href="{{ route('frontend.agent.details', ['username' => $project->agent->username]) }}"
                                                        target="_self">
                                                        <div class="user rounded-pill mt-10">
                                                            <div
                                                                class="user-img lazy-container ratio ratio-1-1 rounded-pill">
                                                                <img class="lazyload"
                                                                    data-src="{{ $project->agent->image ? asset('assets/img/agents/' . $project->agent->image) : asset('assets/img/blank-user.jpg') }}"
                                                                    src="{{ $project->agent->image ? asset('assets/img/agents/' . $project->agent->image) : asset('assets/img/blank-user.jpg') }}">
                                                            </div>
                                                            <div class="user-info">
                                                                <span>{{ $project->agent->username }}</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                @elseif ($project->vendor)
                                                    <a class="color-medium"
                                                        href="{{ route('frontend.vendor.details', ['username' => $project->vendor->username]) }}"
                                                        target="_self">
                                                        <div class="user rounded-pill mt-10">
                                                            <div
                                                                class="user-img lazy-container ratio ratio-1-1 rounded-pill">
                                                                <img class="lazyload"
                                                                    data-src="{{ $project->vendor->photo ? asset('assets/admin/img/vendor-photo/' . $project->vendor->photo) : asset('assets/img/blank-user.jpg') }}"
                                                                    src="{{ $project->vendor->photo ? asset('assets/admin/img/vendor-photo/' . $project->vendor->photo) : asset('assets/img/blank-user.jpg') }}">
                                                            </div>
                                                            <div class="user-info">
                                                                <span>{{ $project->vendor->username }}</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                @elseif($project->vendor_id == 0)
                                                    @php
                                                        $admin = App\Models\Admin::where('role_id', null)
                                                            ->with('adminInfo')
                                                            ->first();
                                                    @endphp

                                                    <a class="color-medium"
                                                        href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}"
                                                        target="_self">
                                                        <div class="user rounded-pill mt-10">
                                                            <div
                                                                class="user-img lazy-container ratio ratio-1-1 rounded-pill">
                                                                <img class=" lazyload"
                                                                    data-src="{{ $admin->image ? asset('assets/img/admins/' . $admin->image) : asset('assets/img/blank-user.jpg') }}"
                                                                    src="{{ $admin->image ? asset('assets/img/admins/' . $admin->image) : asset('assets/img/blank-user.jpg') }}">
                                                            </div>
                                                            <div class="user-info">
                                                                <span>{{ $admin->username }}</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                @endif
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            @empty
                                <div class="p-3 text-center mb-30 w-100">
                                    <h3 class="mb-0"> {{ __('No Projects Found') }}</h3>
                                </div>
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->testimonial_section_status == 1)
        <section class="testimonial-area testimonial-3 pb-100">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="section-title title-center mb-40" data-aos="fade-up">
                            <span class="subtitle">{{ @$testimonialSecInfo->title }}</span>
                            <h2 class="title">{{ $testimonialSecInfo?->subtitle }}</h2>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="swiper" id="testimonial-slider-3">
                            <div class="swiper-wrapper">
                                @forelse ($testimonials as $testimonial)
                                    <div class="swiper-slide pb-30">
                                        <div class="slider-item">
                                            <div class="client-content">
                                                <div class="quote">
                                                    <span class="icon"><i class="fas fa-quote-left"></i></span>
                                                    <p class="text m-0">{{ $testimonial->comment }}
                                                    </p>
                                                </div>
                                                <div class="client-info d-flex align-items-center">
                                                    <div class="client-img position-static">
                                                        <div class="lazy-container rounded-pill ratio ratio-1-1">
                                                            @if (is_null($testimonial->image))
                                                                <img data-src="{{ asset('assets/img/profile.jpg') }}"
                                                                    alt="image" class="lazyload">
                                                            @else
                                                                <img class="lazyload"
                                                                    data-src="{{ asset('assets/img/clients/' . $testimonial->image) }}"
                                                                    alt="Person Image">
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div class="content">
                                                        <h6 class="name mb-0 lh-1">{{ $testimonial->name }}</h6>
                                                        <span class="designation">{{ $testimonial->occupation }}</span>
                                                        <div class="ratings">
                                                            <div class="rate">
                                                                <div class="rating-icon"
                                                                    style="width: {{ $testimonial->rating * 20 }}%">
                                                                </div>
                                                            </div>
                                                            <span class="ratings-total">({{ $testimonial->rating }})
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @empty
                                    <div class="p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Testimonials Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                            <div class="swiper-pagination position-static text-center"
                                id="testimonial-slider-3-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shape">
                <img class="shape-1" src="{{ asset('assets/front/') }}/images/shape/shape-10.png" alt="Shape">
                <img class="shape-2" src="{{ asset('assets/front/') }}/images/shape/shape-6.png" alt="Shape">
                <img class="shape-3" src="{{ asset('assets/front/') }}/images/shape/shape-3.png" alt="Shape">
                <img class="shape-4" src="{{ asset('assets/front/') }}/images/shape/shape-5.png" alt="Shape">
                <img class="shape-5" src="{{ asset('assets/front/') }}/images/shape/shape-2.png" alt="Shape">
            </div>
        </section>
    @endif

@endsection
