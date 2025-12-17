@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ $project->title }}
@endsection

@section('metaKeywords')
    @if (!empty($project))
        {{ $project->meta_keyword }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($project))
        {{ $project->meta_description }}
    @endif
@endsection
@section('og:tag')
    <meta property="og:title" content="{{ $project->title }}">
    <meta property="og:image" content="{{ asset('assets/img/project/featured/' . $project->featured_image) }}">
    <meta property="og:url" content="{{ route('frontend.projects.details', $project->slug) }}">
@endsection

@section('content')
    <!-- Page Title Start-->
    <div class="page-title-area header-next">
        <!-- Background Image -->
        <img class="lazyload blur-up bg-img" src="{{ asset('assets/img/' . $bgImg->breadcrumb) }}">
        <div class="container">
            <div class="content text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <h1 class="color-white">{{ $project->title }}</h1>
                        <p class="font-lg color-white mx-auto"> <span class="product-location icon-start"><i
                                    class="fal fa-map-marker-alt"></i>{{ $project->address }}</span>
                        </p>
                        <p class="font-lg color-white mx-auto"> <span class="product-location icon-start"><i
                                    class="fal fa-user"></i>
                                @if ($project->vendor_id == 0)
                                    {{ $username }}
                                @else
                                    {{ $project->vendor->username }}
                                @endif
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Title End-->

    <div class="divider">
        <div class="icon"><a href="#tapDown"><i class="fal fa-long-arrow-down"></i></a></div>
        <span class="line"></span>
    </div>

    <div class="projects-details-area pt-100 pb-70" id="tapDown">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="project-desc mb-40" data-aos="fade-up">
                        <h3 class="mb-20">{{ __('Project Overview') }}</h3>
                        <p class="summernote-content">
                            {!! $project->description !!}
                        </p>

                    </div>
                    @if (!empty(showAd(3)))
                        <div class="text-center mb-3 mt-3">
                            {!! showAd(3) !!}
                        </div>
                    @endif
                    <div class="">
                        <p>

                            <a class="btn btn-primary btn-md" href="#" data-bs-toggle="modal"
                                data-bs-target="#socialMediaModal">
                                <i class="far fa-share-alt"></i>
                                <span>{{ __('Share') }} </span>
                            </a>

                        </p>
                    </div>
                    <div class="pb-20"></div>
                    @if (count($project->specifications) > 0)
                        <div class="row" class="mb-20">
                            <div class="col-12">
                                <h3 class="mb-20">{{ __('Features') }}</h3>
                            </div>

                            @foreach ($project->specifications as $specification)
                                @php
                                    $project_specification_content = App\Models\Project\SpacificationContent::where([
                                        ['project_spacification_id', $specification->id],
                                        ['language_id', $language->id],
                                    ])->first();
                                @endphp
                                <div class="col-lg-3 col-sm-6 col-md-4 mb-20">
                                    <strong class="mb-1 text-dark">{{ $project_specification_content?->label }}</strong>
                                    <br>
                                    <span>{{ $project_specification_content?->value }}</span>
                                </div>
                            @endforeach
                        </div>
                        <div class="pb-20"></div>
                    @endif

                    <div class="pb-20"></div>

                    <div class="project-location mb-40" data-aos="fade-up">
                        <h3 class="mb-20"> {{ __('Location') }}</h3>
                        <div class="lazy-container radius-lg ratio ratio-21-8 border">
                            <iframe class="lazyload"
                                src="https://maps.google.com/maps?q={{ $project->latitude }},{{ $project->longitude }}&hl={{ $currentLanguageInfo->code }};z=15&amp;output=embed"></iframe>
                        </div>
                    </div>

                    <div class="pb-20"></div><!-- Space -->

                    <div class="project-planning mb-10" data-aos="fade-up">
                        <h3 class="mb-20">{{ __('Floor Planning') }}</h3>
                        <div class="row">
                            @foreach ($floorPlanImages as $floorplan)
                                <div class="col-lg-4">
                                    <div class="mb-30">
                                        <img class="lazyload blur-up radius-lg" src="assets/images/placeholder.png"
                                            data-src="{{ asset('assets/img/project/floor-paln-images/' . $floorplan->image) }}">
                                    </div>
                                </div>
                            @endforeach



                        </div>
                    </div>

                    <div class="pb-20"></div><!-- Space -->
                    @if (count($project->projectTypeContents) > 0)
                        <div class="project-type mb-10" data-aos="fade-up">
                            <h3 class="mb-20">{{ __('Project Types') }}</h3>
                            <div class="row">
                                @foreach ($project->projectTypeContents as $typeContent)
                                    <div class="col-lg-4 col-md-6">
                                        <div class="card border mb-30">
                                            <div class="card-content">
                                                <ul class="m-0 p-0">
                                                    <li class="d-flex align-items-center">
                                                        <span class="font-lg color-dark">{{ __('Area') }}</span>
                                                        <span class="icon-start"> <i
                                                                class="fal fa-vector-square"></i>{{ $typeContent?->min_area }}
                                                            @if (!empty($typeContent->max_area))
                                                                {{ ' - ' . $typeContent->max_area }}
                                                            @endif
                                                            {{ __('Sqft') }}
                                                        </span>
                                                    </li>
                                                    <li class="d-flex align-items-center">
                                                        <span class="font-lg color-dark">{{ __('Price') }}</span>
                                                        <span class="icon-start"><i
                                                                class="ico-save-money"></i>{{ symbolPrice($typeContent?->min_price) }}
                                                            @if (!empty($typeContent->max_price))
                                                                {{ ' - ' . symbolPrice($typeContent->max_price) }}
                                                            @endif
                                                        </span>
                                                    </li>
                                                    <li class="d-flex align-items-center">
                                                        <span class="font-lg color-dark">{{ __('Unit') }}</span>
                                                        <span class="icon-start"><i
                                                                class="ico-home"></i>{{ $typeContent?->unit }}</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif
                    @if (!empty(showAd(3)))
                        <div class="text-center mb-3 mt-3">
                            {!! showAd(3) !!}
                        </div>
                    @endif
                    <div class="pb-20"></div><!-- Space -->

                    <div class="project-gallery">
                        <h3 class="mb-20"> {{ __('Project Gallery Images') }} </h3>
                        <div class="row masonry-gallery grid gallery-popup">
                            <div class="col-lg-4 col-md-6 grid-sizer"></div>
                            @foreach ($galleryImages as $gallery)
                                <div class="col-lg-4 col-md-6 grid-item mb-30">
                                    <div class="card radius-md">
                                        <a href="{{ asset('assets/img/project/gallery-images/' . $gallery->image) }}"
                                            class="card-img">
                                            <img src="{{ asset('assets/img/project/gallery-images/' . $gallery->image) }}">
                                        </a>
                                    </div>
                                </div>
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- share on social media modal --}}
    <div class="modal fade" id="socialMediaModal" tabindex="-1" role="dialog" aria-labelledby="socialMediaModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"> {{ __('Share On') }} </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="actions d-flex justify-content-around">
                        <div class="action-btn">
                            <a class="facebook btn"
                                href="https://www.facebook.com/sharer/sharer.php?u={{ url()->current() }}&src=sdkpreparse"><i
                                    class="fab fa-facebook-f"></i></a>
                            <br>
                            <span> {{ __('Facebook') }} </span>
                        </div>
                        <div class="action-btn">
                            <a href="http://www.linkedin.com/shareArticle?mini=true&amp;url={{ urlencode(url()->current()) }}"
                                class="linkedin btn"><i class="fab fa-linkedin-in"></i></a>
                            <br>
                            <span> {{ __('Linkedin') }} </span>
                        </div>
                        <div class="action-btn">
                            <a class="twitter btn" href="https://twitter.com/intent/tweet?text={{ url()->current() }}"><i
                                    class="fab fa-twitter"></i></a>
                            <br>
                            <span> {{ __('Twitter') }} </span>
                        </div>
                        <div class="action-btn">
                            <a class="whatsapp btn" href="whatsapp://send?text={{ url()->current() }}"><i
                                    class="fab fa-whatsapp"></i></a>
                            <br>
                            <span> {{ __('Whatsapp') }} </span>
                        </div>
                        <div class="action-btn">
                            <a class="sms btn" href="sms:?body={{ url()->current() }}" class="sms"><i
                                    class="fas fa-sms"></i></a>
                            <br>
                            <span> {{ __('SMS') }} </span>
                        </div>
                        <div class="action-btn">
                            <a class="mail btn"
                                href="mailto:?subject=Digital Card&body=Check out this digital card {{ url()->current() }}."><i
                                    class="fas fa-at"></i></a>
                            <br>
                            <span> {{ __('Mail') }} </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
