@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ $agent->username }}
@endsection
@section('metaKeywords')
    {{ $agent->username }}, {{ !request()->filled('admin') ? @$agentInfo->first_name . ' ' . @$agentInfo->last_name : '' }}
@endsection

@section('metaDescription')
    {{ !request()->filled('admin') ? @$agentInfo->details : '' }}
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->agent_page_title : __('Agent'),
        'subtitle' => __('Agent'),
    ])

    <div class="agent-single pt-100 pb-70">
        <div class="container">
            <div class="row gx-xl-5">
                <div class="col-lg-9">
                    <div class="row agent-single-box align-items-center mb-10 gx-xl-5" data-aos="fade-up">
                        <figure class="agent-img col-lg-6 mb-30">
                            <a href="#" class="lazy-container radius-md ratio ratio-1-1">
                                @if ($agent->image != null)
                                    <img class="lazyload" src="{{ asset('assets/img/agents/' . $agent->image) }}"
                                        data-src="{{ asset('assets/img/agents/' . $agent->image) }}">
                                @else
                                    <img class="lazyload" data-src="{{ asset('assets/img/blank-user.jpg') }}"
                                        src="{{ asset('assets/img/agents/' . $agent->image) }}">
                                @endif

                            </a>
                        </figure>
                        <div class="agent-details col-lg-6 mb-30">
                            <span class="label radius-sm">{{ $agent->username }}</span>
                            <div class="mb-15"></div>
                            <h2 class="agent-title m-0">
                                {{ @$agentInfo->first_name . ' ' . @$agentInfo->last_name }}</h2>


                            <ul class="agent-info list-unstyled p-0">
                                @if ($agent->show_phone_number == 1 && !is_null($agent->phone))
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-mobile-android"></i>
                                            <span>{{ __('Phone') . ':' }}</span>
                                        </div>
                                        <div> <a href="tel:{{ $agent->phone }}">{{ $agent->phone }}</a>
                                        </div>
                                    </li>
                                @endif

                                @if ($agent->show_email_addresss == 1 && !is_null($agent->email))
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-envelope"></i>
                                            <span>{{ __('Email') . ':' }}</span>
                                        </div>
                                        <div>
                                            <a href="mailTo:{{ $agent->email }}">{{ $agent->email }}
                                            </a>
                                        </div>

                                    </li>
                                @endif

                                @if (!is_null(@$agentInfo->city))
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-map-marker-alt"></i>
                                            <span>{{ __('City') . ':' }}</span>
                                        </div>
                                        <div>
                                            {{ @$agentInfo->city }}
                                        </div>
                                    </li>
                                @endif

                                @if (!is_null(@$agentInfo->state))
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-map-marker-alt"></i>
                                            <span>{{ __('State') . ':' }}</span>
                                        </div>
                                        <div>
                                            {{ @$agentInfo->state }}
                                        </div>
                                    </li>
                                @endif

                                @if (!is_null(@$agentInfo->country))
                                    <li class="icon-start">
                                        <div>
                                            <i class="fal fa-map-marker-alt"></i>
                                            <span>{{ __('Country') . ':' }}</span>
                                        </div>
                                        <div>
                                            {{ @$agentInfo->country }}
                                        </div>
                                    </li>
                                @endif

                                @if (!is_null(@$agentInfo->address))
                                    <li class="icon-start text-break">
                                        <div>
                                            <i class="fal fa-map-marker-alt"></i>
                                            <span>{{ __('Address') . ' : ' }}</span>
                                        </div>
                                        <div>
                                            {{ @$agentInfo->address }}
                                        </div>

                                    </li>
                                @endif

                                <li class="icon-start">
                                    <div>
                                        <i class="fal fa-calendar-day"></i>
                                        <span>{{ __('Member since') . ':' }}</span>
                                    </div>
                                    <div>
                                        {{ \Carbon\Carbon::parse($agent->created_at)->format('F Y') }}
                                    </div>
                                </li>
                            </ul>

                            <div class="d-flex flex-wrap lign-items-center mt-20 gap-15">
                                @if ($agent->show_phone_number == 1)
                                    <a href="#" class="btn btn-lg btn-primary">{{ __('Send Email') }}</a>
                                @endif
                                @if ($agent->show_email_addresss == 1)
                                    <a href="tel:{{ $agent->phone }}"
                                        class="btn btn-lg btn-outline">{{ __('Call Now') }}</a>
                                @endif
                            </div>
                        </div>
                    </div><!-- agent-default -->
                    <div class="agent-single-details">
                        @if (!is_null(@$agentInfo->details))
                            <div class="mb-20"></div>
                            <div class="agent-desc mb-40">
                                <h3 class="mb-20">{{ __('About') }}</h3>
                                <p>
                                    {{ @$agentInfo->details }}
                                </p>
                            </div>
                        @endif
                        @if (count($all_properties) > 0)
                            <div class="agent-listing mb-40">
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
                                                    @if (count($all_properties) > 0)
                                                        @foreach ($all_properties as $property)
                                                            @if ($property->propertyContent)
                                                                <x-property :property="$property" class="col-lg-4 col-md-6" />
                                                            @endif
                                                        @endforeach
                                                    @else
                                                        <h4 class="text-center mt-4 mb-4">{{ __('No Property Found') }}
                                                        </h4>
                                                    @endif
                                                </div>
                                            </div>

                                            @foreach ($categories as $category)
                                                <div class="tab-pane fade" id="tab_{{ $category->id }}">

                                                    <div class="row">
                                                        @forelse ($all_properties as $property)
                                                            @if ($property->category_id == $category->id)
                                                                <x-property :property="$property" class="col-lg-4 col-md-6" />
                                                            @endif
                                                        @empty
                                                            <div class="col-12 text-center">
                                                                <h3>{{ __('No Properties Found') }}</h3>
                                                            </div>
                                                        @endforelse
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>

                                </div>

                            </div>
                        @endif
                        <div class="agent-listing projects-area mb-40">
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
                                                <div class="card-text text-center">
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

                    </div>

                </div>
                <div class="col-lg-3">
                    <aside class="sidebar-widget-area" data-aos="fade-up">
                        @if ($agent->show_contact_form == 1)
                            <div class="widget widget-form radius-md mb-30">
                                <div class="user mb-20">
                                    <div class="user-img">
                                        <div class="lazy-container ratio ratio-1-1 rounded-pill">
                                            <img class="lazyload"
                                                src="{{ asset('assets/img/agents/' . $agent->image) }}">
                                        </div>
                                    </div>
                                    <div class="user-info">
                                        <h5 class="m-0">
                                            {{ $agentInfo->first_name . ' ' . $agentInfo->last_name }}
                                        </h5>
                                        @if ($agent->show_phone_number == 1 && !is_null($agent->phone))
                                            <a class="d-block" href="tel:{{ $agent->phone }}"> {{ $agent->phone }}</a>
                                        @endif
                                        @if ($agent->show_email_addresss == 1 && !is_null($agent->email))
                                            <a href="mailto:{{ $agent->email }}"> {{ $agent->email }} </a>
                                        @endif
                                    </div>
                                </div>
                                <form action="{{ route('contact_user') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="agent_id" value="{{ $agent->id }}">
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
                                            data-error="Please enter your message" placeholder="{{ __('Write Your Message') }}">{{ old('message') }}</textarea>

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
                                    <button type="submit" onsubmit="$('.request-loader').addClass('show');"
                                        class="btn btn-md btn-primary w-100">{{ __('Send message') }}</button>
                                </form>
                            </div>
                        @endif
                        @if (!empty(showAd(1)))
                            <div class="text-center mb-40">
                                {!! showAd(1) !!}
                            </div>
                        @endif
                        <div class="widget widget-form radius-md mb-30">
                            <form action="{{ route('frontend.vendors') }}" method="GET">
                                <h3 class="title mb-20">{{ __('Find Vendor') }}</h3>
                                <div class="form-group mb-20">

                                    <input type="text" name="name" value="{{ request()->input('name') }}"
                                        class="form-control " placeholder="{{ __('Vendor name/username') }}">
                                </div>
                                <div class="form-group mb-20">
                                    <select class="nice-select" aria-label="#" id="type" name="type">
                                        <option selected disabled>{{ __('Select Project Type') }}</option>

                                        <option value="residential"
                                            {{ request()->input('type') == 'residential' ? 'selected' : '' }}>
                                            {{ __('Residential') }} </option>

                                        <option value="commercial"
                                            {{ request()->input('type') == 'commercial' ? 'selected' : '' }}>
                                            {{ __('Commercial') }} </option>


                                    </select>
                                </div>
                                <div class="form-group mb-20">
                                    <input type="text" name="location" class="form-control"
                                        value="{{ request()->input('location') }}"
                                        placeholder="{{ __('Enter location') }}">
                                </div>
                                <button type="submit"
                                    class="btn btn-md btn-primary w-100">{{ __('Search Now') }}</button>
                            </form>
                        </div>
                        @if (!empty(showAd(2)))
                            <div class="text-center mb-40">
                                {!! showAd(2) !!}
                            </div>
                        @endif
                    </aside>
                </div>
            </div>
        </div>
    </div>
@endsection
