@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@php
    $title = strlen($details->title) > 40 ? mb_substr($details->title, 0, 40, 'UTF-8') . '...' : $details->title;
@endphp
@section('pageHeading')
    @if (!empty($title))
        {{ $title ? $title : $pageHeading->blog_page_title }}
    @endif
@endsection

@section('metaKeywords')
    {{ $details->meta_keywords }}
@endsection

@section('metaDescription')
    {{ $details->meta_description }}
@endsection

@section('content')
    <!-- Page title start-->

    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => $details->title ? $details->title : __('Post'),
        'subtitle' => __('Post Details'),
    ])
    <!-- Page title end-->

    <!--====== Start Blog Section ======-->

    <div class="blog-details-area pt-100 pb-70">
        <div class="container">
            <div class="row justify-content-center gx-xl-5">
                <div class="col-lg-8">
                    <div class="blog-description mb-40">
                        <article class="item-single">
                            <div class="image radius-md">
                                <div class="lazy-container ratio ratio-16-9">
                                    <img class="lazyload" src="{{ asset('assets/front/images/placeholder.png') }}"
                                        data-src="{{ asset('assets/img/blogs/' . $details->image) }}">
                                </div>

                            </div>
                            <div class="content">
                                <ul class="info-list">
                                    <li><i class="fal fa-user"></i>{{ $details->author }} </li>
                                    <li><i
                                            class="fal fa-calendar"></i>{{ Carbon\Carbon::parse($details->created_at)->format('d M Y') }}
                                    </li>
                                    <li><a href="{{ route('blog', ['category' => $details->categorySlug]) }}"> <i
                                                class="fal fa-list"></i>
                                            {{ $details->categoryName }}</a></li>
                                </ul>
                                <h3 class="title">
                                    {{ $details->title }}
                                </h3>
                                <div class="summernote-content">{!! replaceBaseUrl($details->content, 'summernote') !!}</div>
                            </div>
                        </article>
                        @if (!empty(showAd(3)))
                            <div class="text-center mt-4">
                                {!! showAd(3) !!}
                            </div>
                        @endif
                    </div>
                    <div class="comments mb-30">
                        @if ($disqusInfo->disqus_status == 1)
                            <h4 class="mb-20">{{ __('Comments') }}</h4>
                            <div id="disqus_thread"></div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-4">
                    <aside class="sidebar-widget-area">
                        <div class="widget widget-search radius-md mb-30">

                            <h4 class="title mb-15">{{ __('Search Posts') }}</h4>
                            <form class="search-form radius-md" action="{{ route('blog') }}" method="GET">
                                <input type="search" class="search-input"placeholder="{{ __('Search By Title') }}"
                                    name="title"
                                    value="{{ !empty(request()->input('title')) ? request()->input('title') : '' }}">

                                @if (!empty(request()->input('category')))
                                    <input type="hidden" name="category" value="{{ request()->input('category') }}">
                                @endif
                                <button class="btn-search" type="submit">
                                    <i class="far fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <div class="widget widget-blog-categories radius-md mb-30">
                            <h3 class="title mb-15">{{ __('Categories') }}</h3>
                            <ul class="list-unstyled m-0">

                                @foreach ($categories as $category)
                                    <li class="d-flex align-items-center justify-content-between">
                                        <a href="{{ route('blog', ['category' => $category->slug]) }}"><i
                                                class="fal fa-folder"></i>
                                            {{ $category->name }}</a>
                                        <span class="tqy">({{ $category->blogCount }})</span>
                                    </li>
                                @endforeach

                            </ul>
                        </div>
                        <div class="widget widget-post radius-md mb-30">
                            <h3 class="title mb-15">{{ __('Recent Posts') }}</h3>
                            @foreach ($recent_blogs as $blog)
                                <article class="article-item mb-30">
                                    <div class="image">
                                        <a href="{{ route('blog_details', ['slug' => $blog->slug]) }}"
                                            class="lazy-container ratio ratio-1-1">

                                            <img class="lazyload" src="{{ asset('assets/front/images/placeholder.png') }}"
                                                data-src="{{ asset('assets/img/blogs/' . $blog->image) }}">
                                        </a>
                                    </div>
                                    <div class="content">
                                        <ul class="info-list">
                                            <li><i class="fal fa-user"></i>{{ $blog->author }}</li>
                                            <li><i class="fal fa-calendar"></i>
                                                {{ Carbon\Carbon::parse($blog->created_at)->format('d M Y') }}</li>
                                        </ul>
                                        <h6>
                                            <a href="{{ route('blog_details', ['slug' => $blog->slug]) }}">
                                                {{ strlen($blog->title) > 40 ? mb_substr($blog->title, 0, 40, 'UTF-8') . '...' : $blog->title }}
                                            </a>
                                        </h6>
                                    </div>
                                </article>
                            @endforeach

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
    <!--====== End Blog Section ======-->
@endsection
@section('script')
    @if ($disqusInfo->disqus_status == 1)
        <script>
            'use strict';
            const shortName = '{{ $disqusInfo->disqus_short_name }}';
        </script>
        <script type="text/javascript" src="{{ asset('assets/front/js/blog.js') }}"></script>
    @endif
@endsection
