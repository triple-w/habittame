@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ !empty($pageHeading) ? $pageHeading->project_page_title : __('Projects') }}
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keywords_projects }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_projects }}
    @endif
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->project_page_title : __('Projects'),
        'subtitle' => __('Projects'),
    ])
    <div class="projects-area pt-100 pb-70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product-sort-area mb-20" data-aos="fade-up">
                        <div class="row align-items-center">
                            <div class="col-lg-8">
                                <form action="{{ route('frontend.projects') }}" method="GET">
                                    <div class="project-filter-form radius-md pb-10">
                                        <div class="row">
                                            <div class="col-lg-4 mb-10">
                                                <input type="search" name="title" class="form-control"
                                                    placeholder="{{ __('Search By Title') }}"
                                                    value="{{ request()->input('title') }}">
                                            </div>
                                            <div class="col-lg-4 mb-10">
                                                <input type="search" name="location" class="form-control"
                                                    placeholder="{{ __('Search By Location') }}"
                                                    value="{{ request()->input('location') }}">
                                            </div>
                                            <div class="col-lg-3 mb-10">
                                                <button class="btn btn-lg btn-primary w-100" type="submit">
                                                    <i class="far fa-search"></i> {{ __('Search') }}
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4 mb-20">
                                <ul class="product-sort-list text-lg-end list-unstyled">
                                    <li class="item">
                                        <form action="{{ route('frontend.projects') }}" method="GET" onchange="submit();">
                                            <div class="sort-item d-flex align-items-center">
                                                <label class="color-dark me-2">{{ __('Sort By') }}:</label>
                                                <select class="nice-select" name="sort">
                                                    <option value="new">{{ __('Newest') }} </option>
                                                    <option value="old">{{ __('Oldest') }} </option>
                                                    <option value="high-to-low">{{ __('High to Low') }}</option>
                                                    <option value="low-to-high">{{ __('Low to High') }}</option>

                                                </select>
                                            </div>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        @forelse ($projects as $project)
                            <div class="col-lg-4 col-sm-6" data-aos="fade-up" data-aos-delay="100">
                                <a href="{{ route('frontend.projects.details', ['slug' => $project->slug]) }}">
                                    <div class="card mb-30 product-default">
                                        <div class="card-img">
                                            <div class="lazy-container ratio ratio-1-3">
                                                <img class="lazyload"
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
                                            <h3 class="card-title product-title color-white mb-1">
                                                {{ $project->title }}

                                            </h3>
                                            <span class="location icon-start"><i
                                                    class="fal fa-map-marker-alt"></i>{{ $project->address }}</span>
                                            <br>
                                            <span class="price"> {{ symbolPrice($project->min_price) }}
                                                {{ !empty($project->max_price) ? ' - ' . symbolPrice($project->max_price) : '' }}

                                            </span>


                                            @if ($project->agent)
                                                <a class="color-medium"
                                                    href="{{ route('frontend.agent.details', ['username' => $project->agent->username]) }}"
                                                    target="_self">
                                                    <div class="user rounded-pill mt-10">
                                                        <div class="user-img lazy-container ratio ratio-1-1 rounded-pill">
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
                                                        <div class="user-img lazy-container ratio ratio-1-1 rounded-pill">
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
                                                        <div class="user-img lazy-container ratio ratio-1-1 rounded-pill">
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
                            <div class="col-lg-12">
                                <h3 class="text-center mt-5"> {{ __('No Project Found') }}</h3>
                            </div>
                        @endforelse

                    </div>

                    <div class="pagination mb-30 justify-content-center">
                        {{ $projects->links() }}

                    </div>
                    @if (!empty(showAd(3)))
                        <div class="text-center mt-4">
                            {!! showAd(3) !!}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
