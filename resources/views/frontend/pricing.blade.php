@php
     $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ !empty($pageHeading) ? $pageHeading->pricing_page_title : __('Pricing') }}
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keywords_pricing_page }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_pricing_page }}
    @endif
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->pricing_page_title : __('Pricing'),
        'subtitle' => __('Pricing'),
    ])
    <section class="pricing-area pt-100 pb-70">
        <div class="container">
            <div class="row">
                <div class="col-12 ">
                    <div class="section-title title-inline mb-40 d-flex justify-content-center" data-aos="fade-up">

                        <div class="tabs-navigation ">
                            <ul class="nav nav-tabs justify-content-center">
                                <li class="nav-item">
                                    <button class="nav-link active btn-md rounded-pill" data-bs-toggle="tab"
                                        data-bs-target="#forAll1" type="button">{{ __('Monthly') }}</button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link btn-md rounded-pill" data-bs-toggle="tab"
                                        data-bs-target="#forRent1" type="button">{{ __('Yearly') }}</button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link btn-md rounded-pill" data-bs-toggle="tab"
                                        data-bs-target="#forSell1" type="button">{{ __('Lifetime') }}</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="forAll1">
                            <div class="row justify-content-center">
                                @forelse ($packages as $package)
                                    @if ($package->term == 'monthly')
                                        <div class="col-md-6 col-lg-4">
                                            <div class="pricing-item mb-30 radius-lg">
                                                <div class="d-flex align-items-center">
                                                    <div class="icon color-primary"><i class="{{ $package->icon }}"></i>
                                                    </div>
                                                    <div class="label">
                                                        <h3>{{ $package->title }}</h3>
                                                    </div>
                                                </div>


                                                <div class="d-flex align-items-center mt-15">
                                                    <span class="price">{{ symbolPrice($package->price) }}</span>
                                                    <span class="period text-capitalize">/
                                                        {{ __($package->term) }}</span>
                                                </div>
                                                <h5>{{ __("What's Included") }}</h5>
                                                <ul class="item-list list-unstyled p-0 pricing-list">

                                                    @if ($package->number_of_agent >= 1)
                                                        <li><i class="fal fa-check"></i>

                                                            @if ($package->number_of_agent == 999999)
                                                                {{ __('Unlimited') }} {{ __('Agents') }}
                                                            @elseif ($package->number_of_agent > 1)
                                                                {{ $package->number_of_agent }} {{ __('Agents') }}
                                                            @else
                                                                {{ $package->number_of_agent }} {{ __('Agent') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Agent') }} </li>
                                                    @endif

                                                    @if ($package->number_of_property >= 1)
                                                        <li><i class="fal fa-check"></i>


                                                            @if ($package->number_of_property == 999999)
                                                                {{ __('Unlimited') }} {{ __('Properties') }}
                                                            @elseif ($package->number_of_property > 1)
                                                                {{ $package->number_of_property }}
                                                                {{ __('Properties') }}
                                                            @else
                                                                {{ $package->number_of_property }}
                                                                {{ __('Property') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Property') }}
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_property_gallery_images >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property_gallery_images == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_property_gallery_images }}
                                                            @endif
                                                            {{ __('Gallery Images') }} ({{ __('Per Property') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Gallery Images') }} ({{ __('Per Property') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_property_adittionl_specifications >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property_adittionl_specifications == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_property_adittionl_specifications }}
                                                            @endif
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Property') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Property') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_projects >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property == 999999)
                                                                {{ __('Unlimited') }}
                                                            @elseif ($package->number_of_property > 1)
                                                                {{ $package->number_of_projects }}
                                                                {{ __('Projects') }}
                                                            @else
                                                                {{ $package->number_of_projects }}
                                                                {{ __('Project') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Project') }}
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_types >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_project_types == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_types }}
                                                            @endif
                                                            {{ __('Project Types') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Project Types') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_gallery_images >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_project_gallery_images == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_gallery_images }}
                                                            @endif
                                                            {{ __('Gallery Images') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Gallery Images') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_additionl_specifications >= 1)
                                                        <li><i class="fal fa-check"></i>

                                                            @if ($package->number_of_project_additionl_specifications == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_additionl_specifications }}
                                                            @endif

                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                </ul>
                                                <a href="{{ auth('vendor')->check() ? route('vendor.plan.extend.index') : route('vendor.login') }}"
                                                    class="btn btn-outline btn-lg rounded-pill w-100">
                                                    {{ __('Get Started') }}</a>
                                            </div>
                                        </div>
                                    @endif
                                @empty
                                    <div class="p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Pricing Plan Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                        <div class="tab-pane fade" id="forRent1">
                            <div class="row justify-content-center">
                                @forelse ($packages as $package)
                                    @if ($package->term == 'yearly')
                                        <div class="col-md-6 col-lg-4">
                                            <div class="pricing-item mb-30 radius-lg">
                                                <div class="d-flex align-items-center">
                                                    <div class="icon color-primary"><i class="{{ $package->icon }}"></i>
                                                    </div>
                                                    <div class="label">
                                                        <h3>{{ $package->title }}</h3>
                                                    </div>
                                                </div>


                                                <div class="d-flex align-items-center mt-15">
                                                    <span class="price">{{ symbolPrice($package->price) }}</span>
                                                    <span class="period text-capitalize">/
                                                        {{ __($package->term) }}</span>
                                                </div>
                                                <h5>{{ __("What's Included") }}</h5>
                                                <ul class="item-list list-unstyled p-0 pricing-list">

                                                    @if ($package->number_of_agent >= 1)
                                                        <li><i class="fal fa-check"></i>

                                                            @if ($package->number_of_agent == 999999)
                                                                {{ __('Unlimited') }} {{ __('Agents') }}
                                                            @elseif ($package->number_of_agent > 1)
                                                                {{ $package->number_of_agent }} {{ __('Agents') }}
                                                            @else
                                                                {{ $package->number_of_agent }} {{ __('Agent') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Agent') }} </li>
                                                    @endif

                                                    @if ($package->number_of_property >= 1)
                                                        <li><i class="fal fa-check"></i>


                                                            @if ($package->number_of_property == 999999)
                                                                {{ __('Unlimited') }} {{ __('Properties') }}
                                                            @elseif ($package->number_of_property > 1)
                                                                {{ $package->number_of_property }}
                                                                {{ __('Properties') }}
                                                            @else
                                                                {{ $package->number_of_property }}
                                                                {{ __('Property') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Property') }}
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_property_gallery_images >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property_gallery_images == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_property_gallery_images }}
                                                            @endif
                                                            {{ __('Gallery Images') }} ({{ __('Per Property') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Gallery Images') }} ({{ __('Per Property') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_property_adittionl_specifications >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property_adittionl_specifications == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_property_adittionl_specifications }}
                                                            @endif
                                                            {{ __('Additional Features') }}({{ __('Per Property') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Property') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_projects >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property == 999999)
                                                                {{ __('Unlimited') }}
                                                            @elseif ($package->number_of_property > 1)
                                                                {{ $package->number_of_projects }}
                                                                {{ __('Projects') }}
                                                            @else
                                                                {{ $package->number_of_projects }}
                                                                {{ __('Project') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Project') }}
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_types >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_project_types == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_types }}
                                                            @endif
                                                            {{ __('Project Types') }}({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Project Types') }}({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_gallery_images >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_project_gallery_images == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_gallery_images }}
                                                            @endif
                                                            {{ __('Gallery Images') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Gallery Images') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_additionl_specifications >= 1)
                                                        <li><i class="fal fa-check"></i>

                                                            @if ($package->number_of_project_additionl_specifications == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_additionl_specifications }}
                                                            @endif

                                                            {{ __('Additional Features') }}({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Additional Features') }}({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                </ul>
                                                <a href="{{ auth('vendor')->check() ? route('vendor.plan.extend.index') : route('vendor.login') }}"
                                                    class="btn btn-outline btn-lg rounded-pill w-100">
                                                    {{ __('Get Started') }} </a>
                                            </div>
                                        </div>
                                    @endif
                                @empty
                                    <div class="p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Pricing Plan Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                        <div class="tab-pane fade" id="forSell1">
                            <div class="row justify-content-center">
                                @forelse ($packages as $package)
                                    @if ($package->term == 'lifetime')
                                        <div class="col-md-6 col-lg-4">
                                            <div class="pricing-item mb-30 radius-lg" data-aos="fade-up">
                                                <div class="d-flex align-items-center">
                                                    <div class="icon color-primary"><i class="{{ $package->icon }}"></i>
                                                    </div>
                                                    <div class="label">
                                                        <h3>{{ $package->title }}</h3>
                                                    </div>
                                                </div>


                                                <div class="d-flex align-items-center mt-15">
                                                    <span class="price">{{ symbolPrice($package->price) }}</span>
                                                    <span class="period text-capitalize">/
                                                        {{ __($package->term) }}</span>
                                                </div>
                                                <h5>{{ __("What's Included") }}</h5>
                                                <ul class="item-list list-unstyled p-0 pricing-list">

                                                    @if ($package->number_of_agent >= 1)
                                                        <li><i class="fal fa-check"></i>

                                                            @if ($package->number_of_agent == 999999)
                                                                {{ __('Unlimited') }} {{ __('Agents') }}
                                                            @elseif ($package->number_of_agent > 1)
                                                                {{ $package->number_of_agent }} {{ __('Agents') }}
                                                            @else
                                                                {{ $package->number_of_agent }} {{ __('Agent') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Agent') }} </li>
                                                    @endif

                                                    @if ($package->number_of_property >= 1)
                                                        <li><i class="fal fa-check"></i>


                                                            @if ($package->number_of_property == 999999)
                                                                {{ __('Unlimited') }} {{ __('Properties') }}
                                                            @elseif ($package->number_of_property > 1)
                                                                {{ $package->number_of_property }}
                                                                {{ __('Properties') }}
                                                            @else
                                                                {{ $package->number_of_property }}
                                                                {{ __('Property') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Property') }}
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_property_gallery_images >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property_gallery_images == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_property_gallery_images }}
                                                            @endif
                                                            {{ __('Gallery Images') }} ({{ __('Per Property') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Gallery Images') }} ({{ __('Per Property') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_property_adittionl_specifications >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property_adittionl_specifications == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_property_adittionl_specifications }}
                                                            @endif
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Property') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Property') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_projects >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_property == 999999)
                                                                {{ __('Unlimited') }}
                                                            @elseif ($package->number_of_property > 1)
                                                                {{ $package->number_of_projects }}
                                                                {{ __('Projects') }}
                                                            @else
                                                                {{ $package->number_of_projects }}
                                                                {{ __('Project') }}
                                                            @endif
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Project') }}
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_types >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_project_types == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_types }}
                                                            @endif
                                                            {{ __('Project Types') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Project Types') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_gallery_images >= 1)
                                                        <li><i class="fal fa-check"></i>
                                                            @if ($package->number_of_project_gallery_images == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_gallery_images }}
                                                            @endif
                                                            {{ __('Gallery Images') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Gallery Images') }} ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                    @if ($package->number_of_project_additionl_specifications >= 1)
                                                        <li><i class="fal fa-check"></i>

                                                            @if ($package->number_of_project_additionl_specifications == 999999)
                                                                {{ __('Unlimited') }}
                                                            @else
                                                                {{ $package->number_of_project_additionl_specifications }}
                                                            @endif

                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Project') }})
                                                        </li>
                                                    @else
                                                        <li class="disabled"><i class="fal fa-times"></i>
                                                            {{ __('Additional Features') }}
                                                            ({{ __('Per Project') }})
                                                        </li>
                                                    @endif

                                                </ul>


                                                <a href="{{ auth('vendor')->check() ? route('vendor.plan.extend.index') : route('vendor.login') }}"
                                                    class="btn btn-outline btn-lg rounded-pill w-100">
                                                    {{ __('Get Started') }} </a>


                                            </div>
                                        </div>
                                    @endif
                                @empty
                                    <div class="p-3 text-center mb-30 w-100">
                                        <h3 class="mb-0"> {{ __('No Pricing Plan Found') }}</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>


@endsection
