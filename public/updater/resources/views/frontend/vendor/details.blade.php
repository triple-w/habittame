@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ $vendor->username }}
@endsection
@section('metaKeywords')
    {{ $vendor->username }}, {{ !request()->filled('admin') ? @$vendorInfo->name : '' }}
@endsection

@section('metaDescription')
    {{ !request()->filled('admin') ? @$vendorInfo->details : '' }}
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->vendor_page_title : __('Vendors'),
        'subtitle' => !empty($pageHeading) ? $pageHeading->vendor_page_title : __('Vendors'),
    ])
    <div class="agent-single pt-100 pb-60">
        <div class="container">
            <div class="row gx-xl-5">
                <div class="col-lg-9">
                    <div class="row agent-single-box align-items-center mb-10 gx-xl-5" data-aos="fade-up">
                        <figure class="agent-img col-lg-6 mb-30">
                            <a class="lazy-container radius-md ratio ratio-1-1">
                                @if (request()->input('admin') == true)
                                    <img class="lazyload"
                                        data-src="{{ $vendor->image ? asset('assets/img/admins/' . $vendor->image) : asset('assets/img/blank-user.jpg') }}">
                                @elseif ($vendor->photo != null)
                                    <img class="lazyload"
                                        data-src="{{ asset('assets/admin/img/vendor-photo/' . $vendor->photo) }}">
                                @else
                                    <img class="lazyload" data-src="{{ asset('assets/img/blank-user.jpg') }}">
                                @endif

                            </a>
                        </figure>
                        <div class="agent-details col-lg-6 mb-30">
                            <span class="label radius-sm">{{ $vendor->username }}</span>
                            <div class="mb-15"></div>
                            <h2 class="agent-title m-0">
                                {{ request()->input('admin') == true ? $vendor->adminInfo?->first_name . ' ' . $vendor->adminInfo?->last_name : @$vendorInfo->name }}

                            </h2>

                            <ul class="agent-info list-unstyled p-0 ">
                                @if ($vendor->show_phone_number == 1)
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-mobile-android"></i>
                                            <span>{{ __('Phone') }}:</span>
                                        </div>
                                        <div>
                                            <a href="tel:{{ $vendor->phone }}">{{ $vendor->phone }}</a>
                                        </div>
                                    </li>
                                @endif

                                @if ($vendor->show_email_addresss == 1)
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-envelope"></i>
                                            <span>{{ __('Email') }}:</span>
                                        </div>
                                        <div>
                                            <a href="mailTo:{{ $vendor->email }}">{{ $vendor->email }}
                                            </a>
                                        </div>
                                    </li>
                                @endif

                                @if (request()->input('admin') != true)
                                    @if (!is_null(@$vendorInfo->city))
                                        <li class="icon-start">
                                            <div>
                                                <i class="fal fa-map-marker-alt"></i>
                                                <span>{{ __('City') }}:</span>
                                            </div>
                                            <div>
                                                {{ @$vendorInfo->city }}
                                            </div>
                                        </li>
                                    @endif

                                    @if (!is_null(@$vendorInfo->state))
                                        <li class="icon-start">
                                            <div>
                                                <i class="fal fa-map-marker-alt"></i>
                                                <span>{{ __('State') }}:</span>
                                            </div>
                                            <div>
                                                {{ @$vendorInfo->state }}
                                            </div>
                                        </li>
                                    @endif

                                    @if (!is_null(@$vendorInfo->country))
                                        <li class="icon-start">
                                            <div>
                                                <i class="fal fa-map-marker-alt"></i>
                                                <span>{{ __('Country') . ':' }}</span>
                                            </div>
                                            <div>
                                                {{ @$vendorInfo->country }}
                                            </div>
                                        </li>
                                    @endif
                                @endif

                                <li class="icon-start">

                                    @if (request()->input('admin') == true)
                                        @if ($vendor->address != null)
                                            <div>
                                                <i class="fal fa-map-marker-alt"></i>
                                                <span>{{ __('Address') . ' : ' }}</span>
                                            </div>
                                            <div class="icon-start">
                                                {{ $vendor->address }}
                                            </div>
                                        @endif
                                    @else
                                        @if (@$vendorInfo->address != null)
                                            <div>
                                                <i class="fal fa-map-marker-alt"></i>
                                                <span>{{ __('Address') . ' : ' }}</span>
                                            </div>
                                            <div class="icon-start">
                                                {{ @$vendorInfo->address }}
                                            </div>
                                        @endif
                                    @endif
                                </li>


                                @if (request()->input('admin') != true)
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-calendar-day"></i>
                                            <span>{{ __('Member since') . ':' }}</span>
                                        </div>
                                        <div>
                                            {{ \Carbon\Carbon::parse($vendor->created_at)->format('F Y') }}
                                        </div>
                                    </li>
                                @endif
                            </ul>
                            <div class="d-flex flex-wrap lign-items-center mt-20 gap-15">
                                @if ($vendor->show_email_addresss == 1)
                                    <a href="mailTo:{{ $vendor->email }}"
                                        class="btn btn-lg btn-primary">{{ __('Send Email') }}</a>
                                @endif
                                @if ($vendor->show_phone_number == 1)
                                    <a href="tel:{{ $vendor->phone }}"
                                        class="btn btn-lg btn-outline">{{ __('Call Now') }}</a>
                                @endif
                            </div>
                        </div>
                    </div><!-- agent-default -->


                    @if (request()->input('admin') == true)
                        @if (!is_null($vendor->adminInfo?->details))
                            <div class="agent-single-details">
                                <div class="mb-20"></div>
                                <div class="agent-desc mb-40">
                                    <h3 class="mb-20">{{ __('About') }}</h3>
                                    <p>
                                        {{ $vendor->adminInfo?->details }}
                                    </p>
                                </div>
                            </div>
                        @endif
                    @else
                        @if (!is_null(@$vendorInfo->details))
                            <div class="agent-single-details">
                                <div class="mb-20"></div>
                                <div class="agent-desc mb-40">
                                    <h3 class="mb-20">{{ __('About') }}</h3>
                                    <p>
                                        {{ @$vendorInfo->details }}
                                    </p>
                                </div>
                            </div>
                        @endif
                    @endif


                    <div class="agent-listing pb-10">
                        <h3 class="mb-20">{{ __('My Properties') . ' (' . count($all_properties) . ')' }}</h3>

                        <div class="row ">
                            <div class="col-lg-12">

                                <div class="tabs-navigation tabs-navigation-2 mb-20">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <button class="nav-link active btn-md" data-bs-toggle="tab"
                                                data-bs-target="#tab_all"
                                                type="button">{{ __('All Properties') }}</button>
                                        </li>

                                        @foreach ($categories as $category)
                                            @if ($category->properties()->count() > 0 && $category->categoryContent)
                                                <li class="nav-item">
                                                    <button class="nav-link btn-md" data-bs-toggle="tab"
                                                        data-bs-target="#tab_{{ $category->id }}"
                                                        type="button">{{ $category->categoryContent?->name }}</button>
                                                </li>
                                            @endif
                                        @endforeach
                                    </ul>
                                </div>
                                <div class="tab-content" data-aos="fade-up">
                                    <div class="tab-pane fade show active" id="tab_all">
                                        <div class="row">

                                            @foreach ($all_properties as $property)
                                                <x-property :property="$property" class="col-lg-4 col-md-6" />
                                            @endforeach

                                        </div>
                                    </div>

                                    @foreach ($categories as $category)
                                        @php
                                            if (request()->has('admin')) {
                                                $vendorId = 0;
                                            } else {
                                                $vendorId = $vendor->id;
                                            }

                                            $category_id = $category->id;
                                            $Cproperties = App\Models\Property\Property::join(
                                                'property_contents',
                                                'property_contents.property_id',
                                                'properties.id',
                                            )
                                                ->where('vendor_id', $vendorId)
                                                ->with([
                                                    'propertyContent' => function ($q) use ($language) {
                                                        $q->where('language_id', $language->id);
                                                    },
                                                ])
                                                ->where('property_contents.language_id', $language->id)
                                                ->where([['properties.status', 1], ['properties.approve_status', 1]])
                                                ->orderBy('properties.id', 'desc')
                                                ->select('properties.*')
                                                ->get();

                                        @endphp
                                        @if (count($Cproperties) > 0)
                                            <div class="tab-pane fade" id="tab_{{ $category->id }}">

                                                <div class="row">
                                                    @foreach ($Cproperties as $property)
                                                        @if ($property->category_id == $category->id)
                                                            <x-property :property="$property" class="col-lg-4 col-md-6" />
                                                        @endif
                                                    @endforeach
                                                </div>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="agent-listing projects-area pb-10">
                        <h3 class="mb-20">{{ __('My Projects') . ' (' . count($all_projects) . ')' }}</h3>
                        <div class="row">
                            @forelse ($all_projects as $project)
                                <div class="col-lg-4 col-sm-6" data-aos="fade-up" data-aos-delay="100">
                                    <a href="{{ route('frontend.projects.details', ['slug' => $project->slug]) }}">
                                        <div class="card mb-30">
                                            <div class="card-img">
                                                <div class="lazy-container ratio ratio-1-3">
                                                    <img class="lazyload" src="assets/images/placeholder.png"
                                                        data-src="{{ asset('assets/img/project/featured/' . $project->featured_image) }}">
                                                </div>
                                                <span class="label">
                                                    @if ($project->status == 0)
                                                        {{ __('Under Construction') }}
                                                    @elseif($project->status == 1)
                                                        {{ __('Complete') }}
                                                    @endif
                                                </span>
                                            </div>
                                            <div class="card-text text-center p-3">
                                                <h3 class="card-title color-white mb-1">
                                                    {{ strlen($project->title) > 50 ? mb_substr($project->title, 0, 50, 'utf-8') . '...' : $project->title }}
                                                </h3>
                                                <span class="location icon-start"><i
                                                        class="fal fa-map-marker-alt"></i>{{ $project->address }}</span>
                                                <span class="price"> {{ symbolPrice($project->min_price) }}
                                                    {{ !empty($project->max_price) ? ' - ' . symbolPrice($project->max_price) : '' }}

                                                </span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            @empty
                                <div class="col-lg-12">
                                    <h3 class="text-center mt-5"> {{ __('No Projects Found') }}</h3>
                                </div>
                            @endforelse
                        </div>
                    </div>

                    @if (count($agents) > 0)
                        <div class="row mb-40">
                            <div class="col-12">
                                <h3 class="mb-20">{{ __('My Agents') . ' (' . count($agents) . ')' }}</h3>
                                <div class="swiper agent-slider agent-slider-two" data-aos="fade-up">
                                    <div class="swiper-wrapper">
                                        @foreach ($agents as $agent)
                                            <div class="swiper-slide">
                                                <div class="agent-box radius-md">
                                                    <div class="agent-img">
                                                        <figure>
                                                            <a href="{{ route('frontend.agent.details', ['username' => $agent->username]) }}"
                                                                class="lazy-container ratio ratio-1-2">
                                                                <img class="lazyload"
                                                                    src="  {{ asset('assets/front/') }}/images/placeholder.png"
                                                                    data-src="  {{ asset('assets/img/agents/' . $agent->image) }} "
                                                                    alt="agent">
                                                            </a>
                                                        </figure>
                                                        <div
                                                            class="agent-ratings d-flex align-items-center justify-content-between">

                                                            <span class="label bg-primary">{{ __('Real Estate') }}</span>
                                                        </div>

                                                    </div>
                                                    <div class="agent-details text-center">
                                                        <span
                                                            class="color-primary font-sm">{{ count($agent->properties->where('approve_status', 1)) }}
                                                            {{ __('Properties') }}</span> |

                                                        <span
                                                            class="color-primary font-sm">{{ count($agent->projects->where('approve_status', 1)) }}
                                                            {{ __('Projects') }}</span>
                                                        <h4 class="agent-title"><a
                                                                href="{{ route('frontend.agent.details', ['username' => $agent->username]) }}">{{ $agent->agent_info?->first_name . ' ' . $agent->agent_info?->last_name }}</a>
                                                        </h4>
                                                        <ul class="agent-info list-unstyled p-0 ">
                                                            @if ($agent->show_phone_number == 1)
                                                                @if ($agent->phone)
                                                                    <li class="icon-start d-block">
                                                                        <a href="tel:{{ $agent->phone }}"><i
                                                                                class="fal fa-mobile-android color-primary"></i>
                                                                            {{ $agent->phone }}</a>
                                                                    </li>
                                                                @endif
                                                            @endif
                                                            @if ($agent->show_email_addresss == 1)
                                                                @if ($agent->email)
                                                                    <li class="icon-start d-block">
                                                                        <a href="mailTo:{{ $agent->email }}"><i
                                                                                class="fal fa-envelope color-primary"></i>
                                                                            {{ $agent->email }}</a>
                                                                    </li>
                                                                @endif
                                                            @endif
                                                        </ul>
                                                        <a href="{{ route('frontend.agent.details', ['username' => $agent->username]) }}"
                                                            class="btn-text">{{ __('View Profile') }}</a>
                                                    </div>
                                                </div><!-- agent-default -->
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>

                <div class="col-lg-3">
                    <aside class="sidebar-widget-area pb-10" data-aos="fade-up">
                        @if ($vendor->show_contact_form)
                            <div class="widget widget-form radius-md mb-30">
                                <div class="user mb-20">
                                    <div class="user-img">
                                        <div class="lazy-container ratio ratio-1-1 rounded-pill">
                                            @if (request()->input('admin') == true)
                                                <img class="lazyload"
                                                    data-src="{{ $vendor->image ? asset('assets/img/admins/' . $vendor->image) : asset('assets/img/blank-user.jpg') }}"
                                                    alt="Vendor">
                                            @else
                                                <img class="lazyload"
                                                    data-src="{{ $vendor->photo ? asset('assets/admin/img/vendor-photo/' . $vendor->photo) : asset('assets/img/blank-user.jpg') }}"
                                                    alt="Vendor">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="user-info">
                                        @if (request('admin'))
                                            <h5 class="m-0">
                                                {{ $vendor->adminInfo?->first_name . ' ' . $vendor->adminInfo?->last_name }}
                                            </h5>
                                        @else
                                            <h5 class="m-0"> {{ $vendor->vendor_info?->name }} </h5>
                                        @endif
                                        @if ($vendor->show_phone_number == 1)
                                            <a class="d-block" href="tel:{{ $vendor->phone }}"> {{ $vendor->phone }}</a>
                                        @endif
                                        @if ($vendor->show_email_addresss == 1)
                                            <a href="mailto:{{ $vendor->email }}"> {{ $vendor->email }} </a>
                                        @endif
                                    </div>
                                </div>
                                <form action="{{ route('contact_user') }}" method="POST">
                                    @csrf
                                    @if (request('admin'))
                                        <input type="hidden" name="vendor_id" value="0">
                                    @else
                                        <input type="hidden" name="vendor_id" value="{{ $vendor->id }}">
                                    @endif
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
                                        <textarea name="message" id="message" class="form-control" cols="30" rows="8" required
                                            data-error="Please enter your message" placeholder="{{ __('Write Your Message') . '*' }}">{{ old('message') }}</textarea>

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
                            </div>
                        @endif

                        @if (!empty(showAd(2)))
                            <div class="text-center mb-30">
                                {!! showAd(2) !!}
                            </div>
                        @endif
                    </aside>
                </div>
            </div>
        </div>
    </div>
@endsection
