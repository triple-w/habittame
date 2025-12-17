<!-- Footer-area start -->
@if ($footerSectionStatus == 1)
    <footer class="footer-area border">
        <!-- Background Image -->
        @if (!empty($basicInfo->footer_background_image))
            <!-- Background Image -->
            <img class="lazyload blur-up bg-img" src="{{ asset('assets/img/' . $basicInfo->footer_background_image) }}">
        @endif

        <div class="footer-top">
            <div class="container">
                <div class="row gx-xl-5 justify-content-xl-between">
                    <div class="col-lg-5">
                        <div class="footer-widget">
                            <div class="navbar-brand">
                                @if (!empty($basicInfo->footer_logo))
                                    <a href="{{ route('index') }}">
                                        <img src="{{ asset('assets/img/' . $basicInfo->footer_logo) }}">
                                    </a>
                                @endif
                            </div>
                            <p class="text"> {{ !empty($footerInfo) ? $footerInfo->about_company : '' }} </p>

                            @if (count($socialMediaInfos) > 0)
                                <div class="social-link">
                                    @foreach ($socialMediaInfos as $socialMediaInfo)
                                        <a href="{{ $socialMediaInfo->url }}" target="_blank"><i
                                                class="{{ $socialMediaInfo->icon }}"></i></a>
                                    @endforeach
                                </div>
                            @endif

                        </div>
                    </div>
                    <div class="col-lg-3 col-xl-2 col-sm-6">
                        <div class="footer-widget">
                            <h4>{{ __('Useful Links') }}</h4>
                            @if (count($quickLinkInfos) == 0)
                                <h6 class="">{{ __('No Link Found') . '!' }}</h6>
                            @else
                                <ul class="footer-links">
                                    @foreach ($quickLinkInfos as $quickLinkInfo)
                                        <li>
                                            <a href="{{ $quickLinkInfo->url }}">{{ $quickLinkInfo->title }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-3 col-sm-6">
                        <div class="footer-widget">
                            <h4>{{ __('Contact Us') }}</h4>
                            <ul class="footer-links">
                                <li>
                                    <i class="fal fa-map-marker-alt"></i>
                                    @if (!empty($basicInfo->address))
                                        <span>{{ $basicInfo->address }}</span>
                                    @endif
                                </li>
                                @if (!empty($basicInfo->contact_number))
                                    <li>
                                        <i class="fal fa-phone-plus"></i>
                                        <a
                                            href="tel:{{ $basicInfo->contact_number }}">{{ $basicInfo->contact_number }}</a>
                                    </li>
                                @endif
                                @if (!empty($basicInfo->email_address))
                                    <li>
                                        <i class="fal fa-envelope"></i>
                                        <a
                                            href="mailto:{{ $basicInfo->email_address }}">{{ $basicInfo->email_address }}</a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right-area border-top">
            <div class="container">
                <div class="copy-right-content">
                    <span>
                        {!! @$footerInfo->copyright_text !!}
                    </span>
                </div>
            </div>
        </div>
    </footer>
    <!-- Go to Top -->
    <div class="go-top"><i class="fal fa-angle-double-up"></i></div>
    <!-- Go to Top -->
@endif
<!-- Footer-area end-->
