@php
      $version = $basicInfo->theme_version;
@endphp
@extends("frontend.layouts.layout-v$version")

@section('pageHeading')
    {{ !empty($pageHeading) ? $pageHeading->faq_page_title : __('FAQ') }}
@endsection

@section('metaKeywords')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_keyword_faq }}
    @endif
@endsection

@section('metaDescription')
    @if (!empty($seoInfo))
        {{ $seoInfo->meta_description_faq }}
    @endif
@endsection

@section('content')
    @includeIf('frontend.partials.breadcrumb', [
        'breadcrumb' => $bgImg->breadcrumb,
        'title' => !empty($pageHeading) ? $pageHeading->faq_page_title : __('FAQ'),
        'subtitle' => __('FAQ'),
    ])

    <div class="faq-area pt-100 pb-70">
        <div class="container">
            <div class="accordion" id="faqAccordion">
                <div class="row">
                    @if (isset($faqs) && count($faqs) > 0)
                        <div class="col-lg-6 has-time-line" data-aos="fade-right">
                            <div class="row">
                                @foreach ($faqs->chunk(ceil($faqs->count() / 2))->first() as $key => $faq)
                                    @if ($key == 0)
                                        <div class="col-12">
                                            <div class="accordion-item">
                                                <h6 class="accordion-header" id="heading{{ $faq->serial_number }}">
                                                    <button class="accordion-button" type="button"
                                                        data-bs-toggle="collapse"
                                                        data-bs-target="#collapse{{ $faq->serial_number }}"
                                                        aria-expanded="true"
                                                        aria-controls="collapse{{ $faq->serial_number }}">
                                                        {{ $faq->serial_number }}. {{ $faq->question }}
                                                    </button>
                                                </h6>
                                                <div id="collapse{{ $faq->serial_number }}"
                                                    class="accordion-collapse collapse show"
                                                    aria-labelledby="heading{{ $faq->serial_number }}"
                                                    data-bs-parent="#faqAccordion">
                                                    <div class="accordion-body">
                                                        <p>{{ $faq->answer }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                        <div class="col-12">
                                            <div class="accordion-item">
                                                <h6 class="accordion-header" id="heading{{ $faq->serial_number }}">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse"
                                                        data-bs-target="#collapse{{ $faq->serial_number }}"
                                                        aria-expanded="true"
                                                        aria-controls="collapse{{ $faq->serial_number }}">
                                                        {{ $faq->serial_number }}. {{ $faq->question }}
                                                    </button>
                                                </h6>
                                                <div id="collapse{{ $faq->serial_number }}"
                                                    class="accordion-collapse collapse"
                                                    aria-labelledby="heading{{ $faq->serial_number }}"
                                                    data-bs-parent="#faqAccordion">
                                                    <div class="accordion-body">
                                                        <p>{{ $faq->answer }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach

                            </div>
                        </div>
                        <div class="col-lg-6" data-aos="fade-left">
                            <div class="row">
                                @if (count($faqs) > 1)
                                    @foreach ($faqs->chunk(ceil($faqs->count() / 2))->last() as $key => $faq)
                                        <div class="col-12">
                                            <div class="accordion-item">
                                                <h6 class="accordion-header" id="heading{{ $faq->serial_number }}">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse"
                                                        data-bs-target="#collapse{{ $faq->serial_number }}"
                                                        aria-expanded="true"
                                                        aria-controls="collapse{{ $faq->serial_number }}">
                                                        {{ $faq->serial_number }}. {{ $faq->question }}
                                                    </button>
                                                </h6>
                                                <div id="collapse{{ $faq->serial_number }}"
                                                    class="accordion-collapse collapse"
                                                    aria-labelledby="heading{{ $faq->serial_number }}"
                                                    data-bs-parent="#faqAccordion">
                                                    <div class="accordion-body">
                                                        <p>{{ $faq->answer }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @endif

                            </div>
                        </div>
                    @else
                        <div class="col-12">
                            <h3 class="text-center mt-3">{{ __('No Faq Found') . '!' }}</h3>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!-- Faq-area end -->
@endsection
