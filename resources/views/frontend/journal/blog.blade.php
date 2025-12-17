@php
    $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    @if (!empty($pageHeading))
        {{ $pageHeading->blog_page_title }}
    @else
        {{ __('Posts') }}
    @endif
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keyword_blog }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_blog }}
    @endif
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->blog_page_title : __('Blog'),
        'subtitle' => __('Blog'),
    ])

    <div class="blog-area pt-100 pb-70">
        <div class="container">
            <div class="row justify-content-center">
                @if (count($blogs) == 0)
                    <div class="col-lg-12">

                        <h3 class="text-center mt-3">{{ __('No Post Found') . '!' }}</h3>
                    </div>
                @else
                    @foreach ($blogs as $blog)
                        <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="100">
                            <article class="card mb-30">
                                <div class="card-image">
                                    <a href="{{ route('blog_details', ['slug' => $blog->slug]) }}"
                                        class="lazy-container ratio ratio-16-9">
                                        <img class="lazyload" src="{{ asset('assets/front/images/placeholder.png') }}"
                                            data-src="{{ asset('assets/img/blogs/' . $blog->image) }}">
                                    </a>
                                    <a href="{{ route('blog', ['category' => $blog->categorySlug]) }}"> <span
                                            class="tag">{{ $blog->categoryName }}</span></a>
                                </div>
                                <div class="content">
                                    <ul class="info-list justify-content-around">
                                        <li><i class="fal fa-user"></i>{{ $blog->author }}</li>
                                        <li><i class="fal fa-calendar"></i>
                                            {{ Carbon\Carbon::parse($blog->created_at)->format('d M Y') }}
                                        </li>

                                    </ul>
                                    <h3 class="card-title">
                                        <a href="{{ route('blog_details', ['slug' => $blog->slug]) }}">
                                            {{ @$blog->title }}
                                        </a>
                                    </h3>
                                    <p class="card-text">
                                        {{ strlen(strip_tags($blog->content)) > 90 ? mb_substr(strip_tags($blog->content), 0, 90, 'UTF-8') . '...' : strip_tags($blog->content) }}
                                    </p>
                                    <a href="{{ route('blog_details', ['slug' => $blog->slug]) }}"
                                        class="card-btn">{{ __('Read More') }}</a>
                                </div>
                            </article>
                        </div>
                    @endforeach
                @endif
                @if (!empty(showAd(3)))
                    <div class="text-center mt-4">
                        {!! showAd(3) !!}
                    </div>
                @endif
            </div>
            <div class="pagination mb-30 justify-content-center" data-aos="fade-up">
                {{ $blogs->links() }}
            </div>
        </div>
    </div>
@endsection
