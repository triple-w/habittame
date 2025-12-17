@extends('backend.layout')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Section Show') . '/' . __('Hide') }}</h4>
        <ul class="breadcrumbs">
            <li class="nav-home">
                <a href="{{ route('admin.dashboard') }}">
                    <i class="flaticon-home"></i>
                </a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Home Page') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Section Show') . '/' . __('Hide') }}</a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action="{{ route('admin.home_page.update_section_status') }}" method="POST">
                    @csrf
                    <div class="card-header">
                        <div class="card-title d-inline-block">{{ __('Customize Sections') }}</div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-3">


                                @if ($themeVersion != 1)
                                    <div class="form-group">
                                        <label>{{ __('Work Process Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="work_process_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->work_process_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="work_process_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->work_process_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('work_process_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion != 1)
                                    <div class="form-group">
                                        <label>{{ __('Category Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="category_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->category_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="category_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->category_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('category_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion != 3)
                                    <div class="form-group">
                                        <label>{{ __('Featured Properties Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="featured_properties_section_status"
                                                    value="1" class="selectgroup-input"
                                                    {{ $sectionInfo->featured_properties_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="featured_properties_section_status"
                                                    value="0" class="selectgroup-input"
                                                    {{ $sectionInfo->featured_properties_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('featured_properties_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif

                                <div class="form-group">
                                    <label>{{ __('Property Section Status') }}</label>
                                    <div class="selectgroup w-100">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="property_section_status" value="1"
                                                class="selectgroup-input"
                                                {{ $sectionInfo->property_section_status == 1 ? 'checked' : '' }}>
                                            <span class="selectgroup-button">{{ __('Enable') }}</span>
                                        </label>

                                        <label class="selectgroup-item">
                                            <input type="radio" name="property_section_status" value="0"
                                                class="selectgroup-input"
                                                {{ $sectionInfo->property_section_status == 0 ? 'checked' : '' }}>
                                            <span class="selectgroup-button">{{ __('Disable') }}</span>
                                        </label>
                                    </div>
                                    @error('property_section_status')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                @if ($themeVersion == 3)
                                    <div class="form-group">
                                        <label>{{ __('Projects Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="project_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->project_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="project_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->project_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('project_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion != 2)
                                    <div class="form-group">
                                        <label>{{ __('About Us Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="about_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->about_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="about_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->about_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('about_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion != 2)
                                    <div class="form-group">
                                        <label>{{ __('Counter Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="counter_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->counter_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="counter_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->counter_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('counter_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion == 1)
                                    <div class="form-group">
                                        <label>{{ __('Vendor Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="vendor_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->vendor_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="vendor_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->vendor_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('vendor_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif

                                @if ($themeVersion == 2)
                                    <div class="form-group">
                                        <label>{{ __('Pricing Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="pricing_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->pricing_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="pricing_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->pricing_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('pricing_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion != 1)
                                    <div class="form-group">
                                        <label>{{ __('Brand Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="brand_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->brand_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="brand_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->brand_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('brand_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                <div class="form-group">
                                    <label>{{ __('Testimonial Section Status') }}</label>
                                    <div class="selectgroup w-100">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="testimonial_section_status" value="1"
                                                class="selectgroup-input"
                                                {{ $sectionInfo->testimonial_section_status == 1 ? 'checked' : '' }}>
                                            <span class="selectgroup-button">{{ __('Enable') }}</span>
                                        </label>

                                        <label class="selectgroup-item">
                                            <input type="radio" name="testimonial_section_status" value="0"
                                                class="selectgroup-input"
                                                {{ $sectionInfo->testimonial_section_status == 0 ? 'checked' : '' }}>
                                            <span class="selectgroup-button">{{ __('Disable') }}</span>
                                        </label>
                                    </div>
                                    @error('testimonial_section_status')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                @if ($themeVersion == 2)
                                    <div class="form-group">
                                        <label>{{ __('Call To Action Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="call_to_action_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->call_to_action_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="call_to_action_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->call_to_action_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('call_to_action_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion == 1)
                                    <div class="form-group">
                                        <label>{{ __('Cities Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="cities_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->cities_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="cities_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->cities_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('cities_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion == 1)
                                    <div class="form-group">
                                        <label>{{ __('Subscribe Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="subscribe_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->subscribe_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="subscribe_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->subscribe_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('subscribe_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                @if ($themeVersion == 1)
                                    <div class="form-group">
                                        <label>{{ __('Why Choose Us Section Status') }}</label>
                                        <div class="selectgroup w-100">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="why_choose_us_section_status" value="1"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->why_choose_us_section_status == 1 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Enable') }}</span>
                                            </label>

                                            <label class="selectgroup-item">
                                                <input type="radio" name="why_choose_us_section_status" value="0"
                                                    class="selectgroup-input"
                                                    {{ $sectionInfo->why_choose_us_section_status == 0 ? 'checked' : '' }}>
                                                <span class="selectgroup-button">{{ __('Disable') }}</span>
                                            </label>
                                        </div>
                                        @error('why_choose_us_section_status')
                                            <p class="mb-0 text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                @endif
                                <div class="form-group">
                                    <label>{{ __('Footer Section Status') }}</label>
                                    <div class="selectgroup w-100">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="footer_section_status" value="1"
                                                class="selectgroup-input"
                                                {{ $sectionInfo->footer_section_status == 1 ? 'checked' : '' }}>
                                            <span class="selectgroup-button">{{ __('Enable') }}</span>
                                        </label>

                                        <label class="selectgroup-item">
                                            <input type="radio" name="footer_section_status" value="0"
                                                class="selectgroup-input"
                                                {{ $sectionInfo->footer_section_status == 0 ? 'checked' : '' }}>
                                            <span class="selectgroup-button">{{ __('Disable') }}</span>
                                        </label>
                                    </div>
                                    @error('footer_section_status')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-footer">
                        <div class="row">
                            <div class="col-12 text-center">
                                <button type="submit" class="btn btn-success">
                                    {{ __('Update') }}
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
