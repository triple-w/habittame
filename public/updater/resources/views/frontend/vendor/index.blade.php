@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ !empty($pageHeading) ? $pageHeading->vendor_page_title : __('Vendors') }}
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keywords_vendor_page }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_vendor_page }}
    @endif
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->vendor_page_title : __('Vendors'),
        'subtitle' => __('Vendors'),
    ])

    <div class="agent-grid pt-100 pb-70">
        <div class="container">
            <div class="row gx-xl-5">
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="agent-box radius-md mb-30">
                                <div class="agent-img">
                                    <figure>
                                        <a href="#" class="lazy-container ratio ratio-1-2">
                                            <img class="lazyload"
                                                src="{{ $admin->image ? asset('assets/img/admins/' . $admin->image) : asset('assets/img/blank-user.jpg') }}"
                                                data-src="{{ $admin->image ? asset('assets/img/admins/' . $admin->image) : asset('assets/img/blank-user.jpg') }}">
                                        </a>
                                    </figure>
                                    <div class="agent-ratings d-flex align-items-center justify-content-between">
                                        <div class="ratings">

                                        </div>
                                        <span class="label">{{ __('Real Estate') }}</span>
                                    </div>

                                </div>
                                <div class="agent-details text-center">
                                    @php
                                        $admin_info = App\Models\AdminInfo::where([
                                            ['admin_id', $admin->id],
                                            ['language_id', $language->id],
                                        ])
                                            ->select('first_name', 'last_name')
                                            ->first();
                                        $adminProperties = App\Models\Property\Property::where([
                                            ['vendor_id', 0],
                                            ['approve_status', 1],
                                        ])->count();
                                        $adminAgents = App\Models\Agent::where('vendor_id', 0)->count();
                                        $adminProjects = App\Models\Project\Project::where([
                                            ['vendor_id', 0],
                                            ['approve_status', 1],
                                        ])->count();

                                    @endphp
                                    <span class="color-primary font-sm">{{ $adminProperties }}
                                        {{ __('Properties') }}</span> |
                                    <span class="color-primary font-sm">{{ $adminAgents }}
                                        {{ __('Agents') }}</span> |
                                    <span class="color-primary font-sm">{{ $adminProjects }}
                                        {{ __('Projects') }}</span>


                                    <h4 class="agent-title"><a
                                            href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}">{{ @$admin_info->first_name . ' ' . @$admin_info->last_name }}</a>
                                    </h4>
                                    <ul class="agent-info list-unstyled p-0">

                                        @if ($admin->show_phone_number == 1)
                                            @if (!is_null($admin->phone))
                                                <li class="icon-start ">
                                                    <a href="tel:{{ $admin->phone }}"> <i class="fal fa-phone-plus"></i>
                                                        {{ $admin->phone }}</a>
                                                </li>
                                            @endif
                                        @endif

                                        @if ($admin->show_email_addresss == 1)
                                            <li class="icon-start font-sm">
                                                <a href="mailto:{{ $admin->email }}"> <i class="fal fa-envelope"></i>
                                                    {{ $admin->email }}</a>
                                            </li>
                                        @endif
                                    </ul>
                                    <a href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}"
                                        class="btn-text">{{ __('View Profile') }}</a>
                                </div>
                            </div><!-- agent-default -->
                        </div>

                        @foreach ($vendors as $vendor)
                            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                                <div class="agent-box radius-md mb-30">
                                    <div class="agent-img">
                                        <figure>
                                            <a href="#" class="lazy-container ratio ratio-1-2">
                                                <img class="lazyload"
                                                    src="{{ $vendor->photo ? asset('assets/admin/img/vendor-photo/' . $vendor->photo) : asset('assets/img/blank-user.jpg') }}"
                                                    data-src="{{ $vendor->photo ? asset('assets/admin/img/vendor-photo/' . $vendor->photo) : asset('assets/img/blank-user.jpg') }}">
                                            </a>
                                        </figure>
                                        <div class="agent-ratings d-flex align-items-center justify-content-between">
                                            <div class="ratings">

                                            </div>
                                            <span class="label">{{ __('Real Estate') }}</span>
                                        </div>

                                    </div>
                                    <div class="agent-details text-center">
                                        @php
                                            $vendor_info = App\Models\VendorInfo::where([
                                                ['vendor_id', $vendor->id],
                                                ['language_id', $language->id],
                                            ])
                                                ->select('name')
                                                ->first();

                                        @endphp
                                        <span
                                            class="color-primary font-sm">{{ count($vendor->properties->where('approve_status', 1)) }}
                                            {{ __('Properties') }}</span> |
                                        <span class="color-primary font-sm">{{ count($vendor->agents) }}
                                            {{ __('Agents') }}</span> |
                                        <span
                                            class="color-primary font-sm">{{ count($vendor->projects->where('approve_status', 1)) }}
                                            {{ __('Projects') }}</span>


                                        <h4 class="agent-title"><a
                                                href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}">{{ @$vendor_info->name }}</a>
                                        </h4>
                                        <ul class="agent-info list-unstyled p-0">

                                            @if ($vendor->show_phone_number == 1)
                                                @if (!is_null($vendor->phone))
                                                    <li class="icon-start ">
                                                        <a href="tel:{{ $vendor->phone }}"> <i
                                                                class="fal fa-phone-plus"></i> {{ $vendor->phone }}</a>
                                                    </li>
                                                @endif
                                            @endif

                                            @if ($vendor->show_email_addresss == 1)
                                                <li class="icon-start font-sm">
                                                    <a href="mailto:{{ $vendor->email }}"> <i class="fal fa-envelope"></i>
                                                        {{ $vendor->email }}</a>
                                                </li>
                                            @endif
                                        </ul>
                                        <a href="{{ route('frontend.vendor.details', ['username' => $vendor->username]) }}"
                                            class="btn-text">{{ __('View Profile') }}</a>
                                    </div>
                                </div><!-- agent-default -->
                            </div>
                        @endforeach
                    </div>
                    <div class="pagination mb-30 justify-content-center">
                        {{ $vendors->links() }}

                    </div>
                    @if (!empty(showAd(3)))
                        <div class="text-center mt-4">
                            {!! showAd(3) !!}
                        </div>
                    @endif
                </div>
                <div class="col-lg-3">
                    <aside class="sidebar-widget-area" data-aos="fade-up">
                        <div class="widget widget-form radius-md mb-30">
                            <form action="{{ route('frontend.vendors') }}" method="GET">
                                <h3 class="title mb-20">{{ __('Find Vendor') }}</h3>
                                <div class="form-group mb-20">

                                    <input type="text" name="name" value="{{ request()->input('name') }}"
                                        class="form-control " placeholder="{{ __('Vendor name/username') }}">
                                </div>
                                <div class="form-group mb-20">
                                    <select class="nice-select" aria-label="#" id="type" name="type">
                                        <option value="" selected>{{ __('Select Property Type') }}</option>

                                        <option value="residential"
                                            {{ request()->input('type') == 'residential' ? 'selected' : '' }}>
                                            {{ __('Residential') }} </option>

                                        <option value="commercial"
                                            {{ request()->input('type') == 'commercial' ? 'selected' : '' }}>
                                            {{ __('Commercial') }} </option>


                                    </select>
                                </div>
                                <div class="form-group mb-20">

                                    <input type="text" name="location" class="form-control  "
                                        value="{{ request()->input('location') }}"
                                        placeholder="{{ __('Enter location') }}">
                                </div>
                                <button type="submit" class="btn btn-md btn-primary w-100">{{ __('Search Now') }}</button>
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
