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
    <section class="home-banner home-banner-1">
        <img class="lazyload bg-img" src="{{ asset('assets/img/hero/static/' . $heroImg) }}">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xxl-10">
                    <div class="content mb-40" data-aos="fade-up">
                        <h1 class="title">{{ @$heroStatic->title }}</h1>
                        <p class="text">
                            {{ @$heroStatic->text }}
                        </p>
                    </div>
                    <div class="banner-filter-form" data-aos="fade-up">
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
                        <div class="tab-content form-wrapper">
                            <input type="hidden" value="{{ $min }}" id="min">
                            <input type="hidden" value="{{ $max }}" id="max">

                            <input type="hidden" id="currency_symbol" value="{{ $basicInfo->base_currency_symbol }}">
                            <input class="form-control" type="hidden" value="{{ $min }}" id="o_min">
                            <input class="form-control" type="hidden" value="{{ $max }}" id="o_max">

                            <div class="tab-pane fade active show" id="rent">
                                <form action="{{ route('frontend.properties') }}" method="get">
                                    <input type="hidden" name="purposre" value="rent">
                                    <input type="hidden" name="min" value="{{ $min }}" id="min1">
                                    <input type="hidden" name="max" value="{{ $max }}" id="max1">
                                    <div class="grid">
                                        <div class="grid-item">
                                            <div class="form-group">
                                                <label for="search1">{{ __('Location') }}</label>
                                                <input type="text" id="search1" name="location" class="form-control"
                                                    placeholder="{{ __('Enter Location') }}">
                                            </div>
                                        </div>
                                        <div class="grid-item">
                                            <div class="form-group">
                                                <label for="type" class="icon-end">{{ __('Property Type') }}</label>
                                                <select aria-label="#" name="type" class="form-control select2 type"
                                                    id="type">
                                                    <option selected disabled value="">{{ __('Select Property') }}
                                                    </option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    <option value="residential">{{ __('Residential') }}</option>
                                                    <option value="commercial">{{ __('Commercial') }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="grid-item">
                                            <div class="form-group">
                                                <label for="category" class="icon-end">{{ __('Categories') }}</label>
                                                <select aria-label="#" class="form-control select2 bringCategory"
                                                    id="category" name="category">
                                                    <option selected disabled value="">{{ __('Select Category') }}
                                                    </option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    @foreach ($all_proeprty_categories as $category)
                                                        <option value="{{ @$category->categoryContent->slug }}">
                                                            {{ @$category->categoryContent->name }}
                                                        </option>
                                                    @endforeach

                                                </select>
                                            </div>
                                        </div>

                                        <div class="grid-item city">
                                            <div class="form-group">
                                                <label for="city" class="icon-end">{{ __('City') }}</label>
                                                <select aria-label="#" name="city" class="form-control select2 city_id"
                                                    id="city">
                                                    <option selected disabled value="">{{ __('Select City') }}
                                                    </option>
                                                    <option value="all">{{ __('All') }}</option>

                                                    @foreach ($all_cities as $city)
                                                        <option data-id="{{ $city->id }}"
                                                            value="{{ @$city->cityContent->name }}">
                                                            {{ @$city->cityContent->name }}</option>
                                                    @endforeach

                                                </select>
                                            </div>
                                        </div>
                                        <div class="grid-item">
                                            <label class="price-value">{{ __('Price') }}: <br>
                                                <span data-range-value="filterPriceSliderValue">{{ symbolPrice($min) }}
                                                    -
                                                    {{ symbolPrice($max) }}</span>
                                            </label>
                                            <div data-range-slider="filterPriceSlider"></div>
                                        </div>
                                        <div class="grid-item">
                                            <button type="submit"
                                                class="btn btn-lg btn-primary bg-secondary icon-start w-100">
                                                {{ __('Search') }}
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="sale">
                                <form action="{{ route('frontend.properties') }}" method="get">
                                    <input type="hidden" name="purposre" value="sale">
                                    <input type="hidden" name="min" value="{{ $min }}" id="min2">
                                    <input type="hidden" name="max" value="{{ $max }}" id="max2">
                                    <div class="grid">
                                        <div class="grid-item">
                                            <div class="form-group">
                                                <label for="search1">{{ __('Location') }}</label>
                                                <input type="text" id="search1" name="location"
                                                    class="form-control" placeholder="{{ __('Enter Location') }}">
                                            </div>
                                        </div>
                                        <div class="grid-item">
                                            <div class="form-group">
                                                <label for="type1" class="icon-end">{{ __('Property Type') }}</label>
                                                <select aria-label="#" name="type" class="form-control select2 type"
                                                    id="type1">
                                                    <option selected disabled value="">{{ __('Select Property') }}
                                                    </option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    <option value="residential">{{ __('Residential') }}</option>
                                                    <option value="commercial">{{ __('Commercial') }}</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="grid-item">
                                            <div class="form-group">
                                                <label for="category1" class="icon-end">{{ __('Categories') }}</label>
                                                <select aria-label="#" class="form-control select2 bringCategory"
                                                    id="category1" name="category">
                                                    <option selected disabled value="">{{ __('Select Category') }}
                                                    </option>
                                                    <option value="all">{{ __('All') }}</option>
                                                    @foreach ($all_proeprty_categories as $category)
                                                        <option value="{{ @$category->categoryContent->slug }}">
                                                            {{ @$category->categoryContent->name }}
                                                        </option>
                                                    @endforeach

                                                </select>
                                            </div>
                                        </div>

                                        <div class="grid-item city">
                                            <div class="form-group">
                                                <label for="city1" class="icon-end">{{ __('City') }}</label>
                                                <select aria-label="#" name="city"
                                                    class="form-control select2 city_id" id="city1">
                                                    <option selected disabled value="">{{ __('Select City') }}
                                                    </option>
                                                    <option value="all">{{ __('All') }}</option>

                                                    @foreach ($all_cities as $city)
                                                        <option data-id="{{ $city->id }}"
                                                            value="{{ @$city->cityContent->name }}">
                                                            {{ @$city->cityContent->name }}</option>
                                                    @endforeach

                                                </select>
                                            </div>
                                        </div>
                                        <div class="grid-item">
                                            <label class="price-value">{{ __('Price') }}: <br>
                                                <span data-range-value="filterPriceSlider2Value">{{ symbolPrice($min) }}
                                                    -
                                                    {{ symbolPrice($max) }}</span>
                                            </label>
                                            <div data-range-slider="filterPriceSlider2"></div>
                                        </div>
                                        <div class="grid-item">
                                            <button type="submit"
                                                class="btn btn-lg btn-primary bg-secondary icon-start w-100">
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

    @if ($secInfo->counter_section_status == 1)
        <div class="counter-area pt-100 pb-70">
            <div class="container">
                <div class="row gx-xl-5" data-aos="fade-up">
                    @forelse ($counters as $counter)
                        <div class="col-sm-6 col-lg-3">
                            <div class="card mb-30">
                                <div class="d-flex align-items-center justify-content-center mb-10">
                                    <div class="card-icon me-2 color-secondary"><i class="{{ $counter->icon }}"></i>
                                    </div>
                                    <h2 class="m-0 color-secondary"><span class="counter">{{ $counter->amount }}</span>+
                                    </h2>
                                </div>
                                <p class="card-text text-center">{{ $counter->title }}</p>
                            </div>
                        </div>
                    @empty
                        <div class="col-12">
                            <h3 class="text-center mt-20"> {{ __('No Counter Information Found') }} </h3>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    @endif

    @if ($secInfo->featured_properties_section_status == 1)
        <section class="product-area featured-product pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-inline mb-40" data-aos="fade-up">
                            <h2 class="title">{{ @$featuredSecInfo->title }}</h2>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="swiper product-slider">
                            <div class="swiper-wrapper">
                                @forelse ($featured_properties as $property)
                                    {{-- property component --}}
                                    <div class="swiper-slide">
                                        <x-property :property="$property" />
                                    </div>
                                @empty
                                    <div class=" p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Featured Property Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                            <!-- Slider pagination -->
                            <div class="swiper-pagination position-static mb-30" id="product-slider-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->about_section_status == 1)
        <section class="about-area pb-70 pt-30">
            <div class="container">
                <div class="row gx-xl-5">
                    <div class="col-lg-6">
                        <div class="img-content mb-30" data-aos="fade-up">
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
                        <div class="content mb-30" data-aos="fade-up">
                            <div class="content-title">
                                <span class="subtitle"><span class="line"></span>
                                    {{ @$aboutInfo->title }}</span>
                                <h2>{{ $aboutInfo?->sub_title }}</h2>
                            </div>
                            <div class="text summernote-content">{!! $aboutInfo?->description !!}</div>

                            <div class="d-flex align-items-center flex-wrap gap-15">
                                @if (!empty($aboutInfo->btn_url))
                                    <a href="{{ $aboutInfo->btn_url }}"
                                        class="btn btn-lg btn-primary bg-secondary">{{ $aboutInfo?->btn_name }}</a>
                                @endif
                                @if (!empty($aboutInfo->client_text))
                                    <div class="clients d-flex align-items-center flex-wrap gap-2">
                                        <div class="client-img">
                                            <img class="lazyload"
                                                data-src="  {{ asset('assets/front/images/client/client-1.jpg') }}">
                                            <img class="lazyload"
                                                data-src="  {{ asset('assets/front/images/client/client-2.jpg') }}">
                                            <img class="lazyload"
                                                data-src="  {{ asset('assets/front/images/client/client-3.jpg') }}">
                                            <img class="lazyload"
                                                data-src="  {{ asset('assets/front/images/client/client-4.jpg') }}">
                                        </div>
                                @endif
                                <span>{{ $aboutInfo?->client_text }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </section>
    @endif

    @if ($secInfo->property_section_status == 1)
        <section class="product-area popular-product product-1 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-inline mb-40" data-aos="fade-up">
                            <h2 class="title">{{ @$propertySecInfo->title }}</h2>
                            <div class="tabs-navigation">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <button class="nav-link active btn-md" data-bs-toggle="tab"
                                            data-bs-target="#forAll" type="button">{{ __('All Properties') }}</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link btn-md" data-bs-toggle="tab" data-bs-target="#forRent"
                                            type="button">{{ __('For Rent') }}</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link btn-md" data-bs-toggle="tab" data-bs-target="#forSell"
                                            type="button">{{ __('For Sale') }}</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="tab-content" data-aos="fade-up">
                            <div class="tab-pane fade show active" id="forAll">
                                <div class="row">

                                    @forelse ($properties as $property)
                                        {{-- property component --}}
                                        <x-property :property="$property" class="col-lg-4 col-xxl-3 col-md-6" />
                                    @empty
                                        <div class="p-3 text-center mb-30">
                                            <h3 class="mb-0"> {{ __('No Properties Found') }}</h3>
                                        </div>
                                    @endforelse

                                </div>
                            </div>
                            <div class="tab-pane fade" id="forRent">
                                <div class="row">
                                    @forelse ($properties as $property)
                                        @if ($property->purpose == 'rent')
                                            {{-- property component --}}
                                            <x-property :property="$property" class="col-lg-4 col-xxl-3 col-md-6" />
                                        @endif
                                    @empty
                                        <div class="p-3 text-center mb-30">
                                            <h3 class="mb-0"> {{ __('No Properties Found') }}</h3>
                                        </div>
                                    @endforelse

                                </div>
                            </div>
                            <div class="tab-pane fade" id="forSell">
                                <div class="row">
                                    @forelse ($properties as $property)
                                        @if ($property->purpose == 'sale')
                                            {{-- property component --}}
                                            <x-property :property="$property" class="col-lg-4 col-xxl-3 col-md-6" />
                                        @endif
                                    @empty
                                        <div class="p-3 text-center mb-30">
                                            <h3 class="mb-0"> {{ __('No Properties Found') }}</h3>
                                        </div>
                                    @endforelse
                                </div>
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
                        <div class="img-content mb-30 image-right" data-aos="fade-up">
                            <div class="img-1">
                                <img class="lazyload blur-up"
                                    data-src="{{ asset('assets/img/why-choose-us/' . $whyChooseUsImg->why_choose_us_section_img1) }} "
                                    alt="Image">
                                @if (!empty($whyChooseUsImg->why_choose_us_section_video_link))
                                    <a href="{{ $whyChooseUsImg->why_choose_us_section_video_link }}"
                                        class="video-btn youtube-popup p-absolute">
                                        <i class="fas fa-play"></i>
                                    </a>
                                @endif
                            </div>
                            <div class="img-2">
                                <img class="lazyload blur-up"
                                    data-src="  {{ asset('assets/img/why-choose-us/' . $whyChooseUsImg->why_choose_us_section_img2) }} "
                                    alt="Image">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 order-lg-first">
                        <div class="content" data-aos="fade-up">
                            <div class="content-title">
                                <span class="subtitle"><span class="line"></span>{{ @$whyChooseUsInfo->title }}</span>
                                <h2>{{ $whyChooseUsInfo?->sub_title }}</h2>
                            </div>
                            <div class="text">{!! $whyChooseUsInfo?->description !!}</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->vendor_section_status == 1)
        <section class="agent-area pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-center mb-40" data-aos="fade-up">
                            <span class="subtitle">{{ @$vendorInfo->title }}</span>
                            <h2 class="title">{{ $vendorInfo?->subtitle }}</h2>
                        </div>
                    </div>
                    <div class="col-12" data-aos="fade-up">
                        <div class="swiper agent-slider">
                            <div class="swiper-wrapper">
                                @forelse ($vendors as $vendor)
                                    <div class="swiper-slide">
                                        <div class="agent-box radius-md mb-30">
                                            <div class="agent-img">
                                                <figure>
                                                    <a href="#" class="lazy-container ratio ratio-1-2">
                                                        <img class="lazyload"
                                                            data-src="{{ $vendor->photo ? asset('assets/admin/img/vendor-photo/' . $vendor->photo) : asset('assets/img/blank-user.jpg') }}">
                                                    </a>
                                                </figure>
                                                <div
                                                    class="agent-ratings d-flex align-items-center justify-content-between">
                                                    <div class="ratings">

                                                    </div>
                                                    <span class="label">{{ __('Real Estate') }}</span>
                                                </div>

                                            </div>
                                            <div class="agent-details text-center">
                                                @php
                                                    $vendor_info = App\Models\VendorInfo::where([
                                                        ['vendor_id', $vendor->vendorId],
                                                        ['language_id', $language->id],
                                                    ])
                                                        ->select('name')
                                                        ->first();
                                                    $agents = App\Models\Agent::where(
                                                        'vendor_id',
                                                        $vendor->vendorId,
                                                    )->get();

                                                @endphp
                                                <span class="color-primary font-sm">{{ count($vendor->properties) }}
                                                    {{ __('Properties') }}</span> |
                                                <span class="color-primary font-sm">{{ count($vendor->agents) }}
                                                    {{ __('Agents') }}</span> |
                                                <span class="color-primary font-sm">{{ count($vendor->projects) }}
                                                    {{ __('Projects') }}</span>


                                                <h4 class="agent-title"><a
                                                        href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}">{{ @$vendor_info->name }}</a>
                                                </h4>
                                                <ul class="agent-info list-unstyled p-0">

                                                    @if ($vendor->show_phone_number == 1)
                                                        @if (!is_null($vendor->phone))
                                                            <li class="icon-start ">
                                                                <a href="tel:{{ $vendor->phone }}"> <i
                                                                        class="fal fa-phone-plus"></i>
                                                                    {{ $vendor->phone }}</a>
                                                            </li>
                                                        @endif
                                                    @endif

                                                    @if ($vendor->show_email_addresss == 1)
                                                        <li class="icon-start font-sm">
                                                            <a href="mailto:{{ $vendor->email }}"> <i
                                                                    class="fal fa-envelope"></i>
                                                                {{ $vendor->email }}</a>
                                                        </li>
                                                    @endif
                                                </ul>
                                                <a href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}"
                                                    class="btn-text">{{ __('View Profile') }}</a>
                                            </div>
                                        </div><!-- agent-default -->
                                    </div>
                                @empty
                                    <div class="p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Vendors Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    </div>
                    @if (count($vendors) > 0)
                        <div class="text-center">
                            <a href="{{ route('frontend.vendors') }}"
                                class="btn btn-lg btn-primary bg-secondary mb-30">{{ @$vendorInfo->btn_name }}</a>
                        </div>
                    @endif
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->cities_section_status == 1)
        <section class="gallery-area pt-100 pb-70">
            <img class="lazyload bg-img" src="{{ asset('assets/front/images/245re4e1r53.png') }}">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title title-inline mb-40" data-aos="fade-up">
                            <div>
                                <span class="subtitle"><span class="line"></span>
                                    {{ @$citySecInfo->title }}</span>
                                <h2 class="title">{{ $citySecInfo?->subtitle }}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row" data-aos="fade-up">
                            @forelse ($cities as $city)
                                <div class="col-lg-4 col-sm-6">
                                    <div class="card radius-md mb-30">
                                       <a href="{{ route('frontend.properties', ['city' => @$city->name]) }}">
                                            <div class="card-img">
                                                <div class="lazy-container ratio ratio-16-11">
                                                    <img class="lazyload blur-up"
                                                        data-src="{{ asset('assets/img/property-city/' . $city->image) }}">
                                                </div>
                                            </div>
                                            <div class="card-text text-center">
                                                <h5 class="card-title color-white mb-0">{{ $city->name }}</h5>
                                                <span class="font-sm color-white">{{ $city->propertyCount }}
                                                    @if ($city->propertyCount > 0)
                                                        {{ __('Properties') }}
                                                    @else
                                                        {{ __('Property') }}
                                                    @endif
                                                </span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            @empty
                                <div class=" p-3 text-center mb-30 w-100">
                                    <h3 class="mb-0"> {{ __('No Cities Found') }}</h3>
                                </div>
                            @endforelse
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
                                        class="line"></span>{{ @$testimonialSecInfo->title }}</span>
                                <h2 class="title">
                                    {{ $testimonialSecInfo?->subtitle }}</h2>
                            </div>
                            <p class="text mb-30">
                                {{ $testimonialSecInfo?->content }}</p>
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
                    <div class="col-lg-8" data-aos="fade-up">
                        <div class="swiper" id="testimonial-slider-1">
                            <div class="swiper-wrapper">
                                @forelse ($testimonials as $testimonial)
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
                                @empty
                                    <div class="bg-light p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Testimonials Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if ($secInfo->subscribe_section_status == 1)
        <section class="newsletter-area pb-100" data-aos="fade-up">
            <div class="container">
                <div class="newsletter-inner px-4">
                    <img class="lazyload bg-img" src="{{ asset('assets/img/' . $subscribeSectionImage) }}">
                    <div class="row justify-content-center text-center" data-aos="fade-up">
                        <div class="col-lg-6 col-xxl-5">
                            <div class="content mb-30">
                                <span class="subtitle color-white mb-10 d-block">{{ @$subscribeSecInfo->title }}</span>
                                <h2 class="color-white">{{ $subscribeSecInfo?->subtitle }}</h2>
                            </div>
                            <form id="newsletterForm" class="subscription-form newsletter-form"
                                action="{{ route('store_subscriber') }}" method="POST">
                                @csrf
                                <div class="input-group radius-md">
                                    <input class="form-control" placeholder="{{ __('Enter Your Email') }}"
                                        type="email" name="email_id" required>
                                    <button class="btn btn-lg btn-primary" type="submit" form="newsletterForm">
                                        {{ $subscribeSecInfo->btn_name ?? __('Start Now') }}</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
@endsection
