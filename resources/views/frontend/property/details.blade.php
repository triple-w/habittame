@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ $propertyContent->title }}
@endsection

@section('metaKeywords')
    @if ($propertyContent)
        {{ $propertyContent->meta_keyword }}
    @endif
@endsection

@section('metaDescription')
    @if ($propertyContent)
        {{ $propertyContent->meta_description }}
    @endif
@endsection

@section('og:tag')
    <meta property="og:title" content="{{ $propertyContent->title }}">
    <meta property="og:image" content="{{ asset('assets/img/property/featureds/' . $propertyContent->featured_image) }}">
    <meta property="og:url" content="{{ route('frontend.property.details', $propertyContent->slug) }}">
@endsection

@section('content')
    <div class="product-single pt-100 pb-70 border-top header-next">
        <div class="container">
            <div class="row gx-xl-5">
                <div class="col-lg-9 col-xl-8">
                    <div class="product-single-gallery mb-40">
                        <!-- Slider navigation buttons -->
                        <div class="slider-navigation">
                            <button type="button" title="Slide prev" class="slider-btn slider-btn-prev">
                                <i class="fal fa-angle-left"></i>
                            </button>
                            <button type="button" title="Slide next" class="slider-btn slider-btn-next">
                                <i class="fal fa-angle-right"></i>
                            </button>
                        </div>
                        <div class="swiper product-single-slider">
                            <div class="swiper-wrapper">
                                @foreach ($sliders as $slider)
                                    <div class="swiper-slide">
                                        <figure class="radius-lg lazy-container ratio ratio-16-11">
                                            <a href="{{ asset('assets/img/property/slider-images/' . $slider->image) }}"
                                                class="lightbox-single">
                                                <img class="lazyload" src="assets/images/placeholder.png"
                                                    data-src="{{ asset('assets/img/property/slider-images/' . $slider->image) }}">
                                            </a>
                                        </figure>
                                    </div>
                                @endforeach

                            </div>
                        </div>

                        <div class="swiper slider-thumbnails">
                            <div class="swiper-wrapper">
                                @foreach ($sliders as $slider)
                                    <div class="swiper-slide">
                                        <div class="thumbnail-img lazy-container radius-md ratio ratio-16-11">
                                            <img class="lazyload" src="assets/images/placeholder.png"
                                                data-src="{{ asset('assets/img/property/slider-images/' . $slider->image) }}">
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <div class="product-single-details">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="d-flex align-items-center justify-content-between mb-10">
                                    <span class="product-category text-sm"> <a
                                            href="{{ route('frontend.properties', ['category' => $propertyContent->categoryContent?->slug]) }}">
                                            {{ $propertyContent->categoryContent?->name }}</a></span>
                                </div>
                                <h3 class="product-title">
                                    <a href="#">{{ $propertyContent->title }}</a>
                                </h3>
                                <div class="product-location icon-start">
                                    <i class="fal fa-map-marker-alt"></i>
                                    <span>
                                        {{ $propertyContent->address }}
                                    </span>
                                    <span>
                                        {{ $propertyContent->property->city?->getContent($propertyContent->language_id)?->name }}
                                        {{ $propertyContent->property->isStateActive ? ', ' . $propertyContent->property->state?->getContent($propertyContent->language_id)?->name : '' }}
                                        {{ $propertyContent->property->isCountryActive ? ', ' . $propertyContent->property->country?->getContent($propertyContent->language_id)?->name : '' }}
                                    </span>
                                </div>
                                <ul class="product-info p-0 list-unstyled d-flex align-items-center mt-10 mb-30">
                                    <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top"
                                        title="{{ __('Area') }}">
                                        <i class="fal fa-vector-square"></i>
                                        <span>{{ $propertyContent->area }} {{ __('Sqft') }}</span>
                                    </li>
                                    @if ($propertyContent->type == 'residential')
                                        <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top"
                                            title="{{ __('Beds') }}">
                                            <i class="fal fa-bed"></i>
                                            <span>{{ $propertyContent->beds }} {{ __('Beds') }}</span>
                                        </li>
                                        <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top"
                                            title="{{ __('Baths') }}">
                                            <i class="fal fa-bath"></i>
                                            <span>{{ $propertyContent->bath }} {{ __('Baths') }}</span>
                                        </li>
                                    @endif
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <div class="product-price mb-10">
                                    <span class="new-price">{{ __('Price:') }}
                                        {{ $propertyContent->price ? symbolPrice($propertyContent->price) : __('Negotiable') }}</span>
                                </div>
                                <a @if (!empty($agent)) href="{{ route('frontend.agent.details', ['username' => $agent->username]) }}">
                                        @elseif(!empty($vendor))
                                             href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}">
                                            @else
                                              href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}"> @endif
                                    <div class="user mb-20">
                                    <div class="user-img">
                                        <div class="lazy-container ratio ratio-1-1 rounded-pill">
                                            <img class="lazyload" src="{{ asset('assets/img/blank-user.jpg') }}"
                                                data-src="@if (!empty($agent)) {{ $agent->image ? asset('assets/img/agents/' . $agent->image) : asset('assets/img/blank-user.jpg') }}
                                            @elseif(!empty($vendor))
                                                {{ $vendor->photo ? asset('assets/admin/img/vendor-photo/' . $vendor->photo) : asset('assets/img/blank-user.jpg') }}
                                                @else
                                                 {{ asset('assets/img/admins/' . $admin->image) }} @endif">

                                        </div>
                                    </div>
                                    <div class="user-info">
                                        <h5 class="m-0">
                                            @if (!empty($agent))
                                                {{ $agent->agent_info?->first_name . ' ' . $agent->agent_info?->last_name }}
                                            @elseif(!empty($vendor))
                                                {{ $vendor->vendor_info?->name }}
                                            @else
                                                {{ $admin->first_name . ' ' . $admin->last_name }}
                                            @endif
                                        </h5>

                                    </div>
                            </div>
                            </a>

                            <ul class="share-link list-unstyled mb-30">
                                <li>
                                    <a class="btn blue" href="#" data-bs-toggle="modal"
                                        data-bs-target="#socialMediaModal">
                                        <i class="far fa-share-alt"></i>
                                    </a>
                                    <span>{{ __('Share') }}</span>

                                </li>

                                <li>
                                    @if (Auth::guard('web')->check())
                                        @php
                                            $user_id = Auth::guard('web')->user()->id;
                                            $checkWishList = checkWishList($propertyContent->propertyId, $user_id);
                                        @endphp
                                    @else
                                        @php
                                            $checkWishList = false;
                                        @endphp
                                    @endif
                                    <a href="{{ $checkWishList == false ? route('addto.wishlist', $propertyContent->propertyId) : route('remove.wishlist', $propertyContent->propertyId) }}"
                                        class="btn red " data-tooltip="tooltip" data-bs-placement="top"
                                        title="{{ $checkWishList == false ? __('Add to Wishlist') : __('Saved') }}">

                                        @if ($checkWishList == false)
                                            <i class="fal fa-heart"></i>
                                        @else
                                            <i class="fas fa-heart"></i>
                                        @endif
                                    </a>
                                    <span>{{ $checkWishList == false ? __('Save') : __('Saved') }}</span>

                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="mb-20"></div>
                    <div class="product-desc mb-40">
                        <h3 class="mb-20">{{ __('Property Description') }}</h3>
                        <p class=" summernote-content">{!! $propertyContent->description !!}</p>
                    </div>
                    @if (!empty(showAd(3)))
                        <div class="text-center mb-3 mt-3">
                            {!! showAd(3) !!}
                        </div>
                    @endif

                    @if (count($propertyContent->propertySpacifications) > 0)
                        <div class="row" class="mb-20">
                            <div class="col-12">
                                <h3 class="mb-20"> {{ __('Features') }}</h3>
                            </div>

                            @foreach ($propertyContent->propertySpacifications as $specification)
                                @php
                                    $property_specification_content = App\Models\Property\SpacificationCotent::where([
                                        ['property_spacification_id', $specification->id],
                                        ['language_id', $language->id],
                                    ])->first();
                                @endphp
                                <div class="col-lg-3 col-sm-6 col-md-4 mb-20">
                                    <strong
                                        class="mb-1 text-dark d-block">{{ $property_specification_content?->label }}</strong>
                                    <span>{{ $property_specification_content?->value }}</span>
                                </div>
                            @endforeach
                        </div>
                        <div class="pb-20"></div>
                    @endif

                    <div class="product-featured mb-40">
                        <h3 class="mb-20">{{ __('Amenities') }}</h3>
                        <ul class="featured-list list-unstyled p-0 m-0">
                            @foreach ($amenities as $amenity)
                                <li class="d-inline-block icon-start">
                                    <i class="{{ $amenity->amenity->icon }}"></i>
                                    <span>{{ $amenity->amenityContent?->name }}</span>
                                </li>
                            @endforeach

                        </ul>
                    </div>
                    @if (!empty($propertyContent->video_url))
                        <div class="product-video mb-40">
                            <h3 class="mb-20"> {{ __('Video') }}</h3>
                            <div class="lazy-container radius-lg ratio ratio-16-11">
                                <img class="lazyload" src="{{ asset('assets/front/images/placeholder.png') }}"
                                    data-src="{{ $propertyContent->video_image ? asset('assets/img/property/video/' . $propertyContent->video_image) : asset('assets/front/images/placeholder.png') }}">
                                <a href="{{ $propertyContent->video_url }}" class="video-btn youtube-popup p-absolute">
                                    <i class="fas fa-play"></i>
                                </a>
                            </div>
                        </div>
                    @endif
                    @if (!empty($propertyContent->floor_planning_image))
                        <div class="product-planning mb-40">
                            <h3 class="mb-20">{{ __('Floor Planning') }}</h3>
                            <div class="lazy-container radius-lg ratio ratio-16-11 border">
                                <img class="lazyload" src="assets/images/placeholder.png"
                                    data-src="{{ asset('assets/img/property/plannings/' . $propertyContent->floor_planning_image) }}">
                            </div>
                        </div>
                    @endif
                    @if (!empty($propertyContent->latitude) && !empty($propertyContent->longitude))
                        <div class="product-location mb-40">
                            <h3 class="mb-20">{{ __('Location') }}</h3>
                            <div class="lazy-container radius-lg ratio ratio-21-9 border">
                                <iframe class="lazyload"
                                    src="https://maps.google.com/maps?q={{ $propertyContent->latitude }},{{ $propertyContent->longitude }}&hl={{ $currentLanguageInfo->code }}&z=14&amp;output=embed"></iframe>
                            </div>
                        </div>
                    @endif
                    @if (!empty(showAd(3)))
                        <div class="text-center mb-3 mt-3">
                            {!! showAd(3) !!}
                        </div>
                    @endif
                </div>
            </div>
            <div class="col-lg-3 col-xl-4">

                <aside class="sidebar-widget-area mb-10" data-aos="fade-up">
                    <div class="widget widget-form radius-md mb-30">
                        <div class="user mb-20">
                            <div class="user-img">
                                <div class="lazy-container ratio ratio-1-1 rounded-pill">
                                    @if (!empty($agent))
                                        <a href="{{ route('frontend.agent.details', ['username' => $agent->username]) }}">
                                            <img class="lazyload" src="{{ asset('assets/img/blank-user.jpg') }}"
                                                data-src="{{ $agent->image ? asset('assets/img/agents/' . $agent->image) : asset('assets/img/blank-user.jpg') }}">
                                        </a>
                                    @elseif(!empty($vendor))
                                        <a
                                            href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}">
                                            <img class="lazyload" src="{{ asset('assets/img/blank-user.jpg') }}"
                                                data-src=" {{ $vendor->photo ? asset('assets/admin/img/vendor-photo/' . $vendor->photo) : asset('assets/img/blank-user.jpg') }}">
                                        </a>
                                    @else
                                        <a
                                            href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}">
                                            <img class="lazyload" src="{{ asset('assets/img/blank-user.jpg') }}"
                                                data-src=" {{ asset('assets/img/admins/' . $admin->image) }} ">
                                        </a>
                                    @endif

                                </div>
                            </div>
                            <div class="user-info">
                                <h4 class="mb-0">
                                    <a @if (!empty($agent)) href="{{ route('frontend.agent.details', ['username' => $agent->username]) }}"> {{ $agent->agent_info?->first_name . ' ' . $agent->agent_info?->last_name }}
                                            @elseif(!empty($vendor))
                                             href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}">   {{ $vendor->vendor_info?->name }}
                                            @else
                                              href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}">   {{ $admin->first_name . ' ' . $admin->last_name }} @endif
                                        </a>
                                </h4>
                                @if ($agent->show_phone_number == 1 && !is_null($agent->phone))
                                <a class="d-block"
                                    href="tel:@if (!empty($agent)) {{ $agent->phone }}
                                        @elseif(!empty($vendor))
                                            {{ $vendor->phone }}
                                        @else
                                            @if ($admin->show_contact_form && !empty($admin->phone))
                                            {{ $admin->phone }} @endif
                                        @endif">
                                    @if (!empty($agent))
                                        {{ $agent->phone }}
                                    @elseif(!empty($vendor))
                                        {{ $vendor->phone }}
                                    @else
                                        @if ($admin->show_contact_form && !empty($admin->phone))
                                            {{ $admin->phone }}
                                        @endif
                                    @endif
                                </a>
                                @endif
                                @if ($agent->show_email_addresss == 1 && !is_null($agent->email))
                                <a
                                    href="mailto:@if (!empty($agent)) {{ $agent->email }}
                                        @elseif(!empty($vendor))
                                            {{ $vendor->email }} @else {{ $admin->email }} @endif">
                                    @if (!empty($agent))
                                        {{ $agent->email }}
                                    @elseif(!empty($vendor))
                                        {{ $vendor->email }}
                                    @else
                                        @if ($admin->show_email_addresss)
                                            {{ $admin->email }}
                                        @endif
                                    @endif
                                </a>
                                @endif
                            </div>
                        </div>
@if ($agent->show_contact_form == 1)
                        <form action="{{ route('property_contact') }}" method="POST">
                            @csrf
                            @if (!empty($agent))
                                <input type="hidden" name="vendor_id" value="{{ $agent->vendor_id }}">
                                <input type="hidden" name="agent_id" value="{{ !empty($agent) ? $agent->id : '' }}">
                            @elseif(!empty($vendor) && empty($agent))
                                <input type="hidden" name="vendor_id" value="{{ $vendor->id }}">
                            @else
                                <input type="hidden" name="vendor_id" value="0">
                            @endif
                            <input type="hidden" name="property_id" value="{{ $propertyContent->propertyId }}">
                            <div class="form-group mb-20">
                                <input type="text" class="form-control" name="name"
                                    placeholder="{{ __('Name') }}*" required value="{{ old('name') }}">
                                @error('name')
                                    <p class=" text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="form-group mb-20">
                                <input type="email" class="form-control" required name="email"
                                    placeholder="{{ __('Email Address') }}*" value="{{ old('email') }}">
                                @error('email')
                                    <p class=" text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="form-group mb-20">
                                <input type="number" class="form-control" name="phone" required
                                    value="{{ old('phone') }}" placeholder="{{ __('Phone Number') }}*">
                                @error('phone')
                                    <p class=" text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="form-group mb-20">
                                <textarea name="message" id="message" class="form-control" cols="30" rows="8" required=""
                                    data-error="Please enter your message" placeholder="{{ __('Message') }}...">{{ old('message') }}</textarea>

                                @error('message')
                                    <p class=" text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            @if ($info->google_recaptcha_status == 1)
                                <div class="form-group mb-30">
                                    {!! NoCaptcha::renderJs() !!}
                                    {!! NoCaptcha::display() !!}

                                    @error('g-recaptcha-response')
                                        <p class="mt-1 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            @endif
                            <button type="submit"
                                class="btn btn-md btn-primary w-100">{{ __('Send message') }}</button>
                        </form>
                        @endif
                    </div>

                    <div class="widget widget-recent radius-md mb-30 ">
                        <h3 class="title">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#products" aria-expanded="true" aria-controls="products">
                                {{ __('Related Property') }}
                            </button>
                        </h3>
                        <div id="products" class="collapse show">
                            <div class="accordion-body p-0">
                                @foreach ($relatedProperty as $property)
                                    <div class="product-default product-inline mt-20">
                                        <figure class="product-img">
                                            <a href="{{ route('frontend.property.details', $property->slug) }}"
                                                class="lazy-container ratio ratio-1-1 radius-md">
                                                <img class="lazyload" src="assets/images/placeholder.png"
                                                    data-src="{{ asset('assets/img/property/featureds/' . $property->featured_image) }}">
                                            </a>
                                        </figure>
                                        <div class="product-details">
                                            <h6 class="product-title"><a
                                                    href="{{ route('frontend.property.details', $property->slug) }}">{{ $property->title }}</a>
                                            </h6>
                                            <span class="product-location icon-start"> <i
                                                    class="fal fa-map-marker-alt"></i>
                                                {{ $property->city->getContent($property->language_id)?->name }}
                                                {{ $property->isStateActive ? ', ' . $property->state?->getContent($property->language_id)?->name : '' }}
                                                {{ $property->isCountryActive ? ', ' . $property->country?->getContent($property->language_id)?->name : '' }}</span>
                                            <div class="product-price">

                                                <span class="new-price">{{ __('Price:') }}
                                                    {{ $property->price ? symbolPrice($property->price) : __('Negotiable') }}</span>
                                            </div>
                                            <ul class="product-info p-0 list-unstyled d-flex align-items-center">
                                                <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top"
                                                    title="{{ __('Area') }}">
                                                    <i class="fal fa-vector-square"></i>
                                                    <span>{{ $property->area }}</span>
                                                </li>
                                                @if ($property->type == 'residential')
                                                    <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top"
                                                        title="{{ __('Bed') }}">
                                                        <i class="fal fa-bed"></i>
                                                        <span>{{ $property->beds }} </span>
                                                    </li>
                                                    <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top"
                                                        title="{{ __('Bath') }}">
                                                        <i class="fal fa-bath"></i>
                                                        <span>{{ $property->bath }} </span>
                                                    </li>
                                                @endif

                                            </ul>
                                        </div>
                                    </div><!-- product-default -->
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @if (!empty(showAd(2)))
                        <div class="text-center mb-3 mt-3">
                            {!! showAd(2) !!}
                        </div>
                    @endif
                </aside>
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
                            <a class="twitter btn"
                                href="https://twitter.com/intent/tweet?text={{ url()->current() }}"><i
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
