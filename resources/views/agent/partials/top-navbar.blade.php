<div class="main-header">
    <!-- Logo Header Start -->
    <div class="logo-header"
        data-background-color="{{ Session::get('agent_theme_version') == 'light' ? 'white' : 'dark2' }}">

        @if (!empty($websiteInfo->logo))
            <a href="{{ route('index') }}" class="logo" target="_blank">
                <img src="{{ asset('assets/img/' . $websiteInfo->logo) }}" alt="logo" class="navbar-brand"
                    width="120">
            </a>
        @endif

        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse"
            data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
                <i class="icon-menu"></i>
            </span>
        </button>
        <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>

        <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar">
                <i class="icon-menu"></i>
            </button>
        </div>
    </div>
    <!-- Logo Header End -->

    <!-- Navbar Header Start -->
    <nav class="navbar navbar-header navbar-expand-lg"
        data-background-color="{{ Session::get('agent_theme_version') == 'light' ? 'white2' : 'dark' }}">
        <div class="container-fluid">
            <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                @if ($agent->vendor_id != 0)
                    <li>
                        <button type="button" class="btn  btn-secondary mr-2  btn-sm btn-round" data-toggle="modal"
                            data-target="#allLimits">

                            @if (!is_null($currentPackage))
                                @php
                                    $agentsD = $currentPackage->number_of_agent - $featuresCount['agents'];
                                    $propertiesD = $currentPackage->number_of_property - $featuresCount['properties'];
                                    $projectsD = $currentPackage->number_of_projects - $featuresCount['projects'];
                                @endphp
                                @if (
                                    $proGalImgDown ||
                                        $projectTypeDown ||
                                        $proSpeciDown ||
                                        $projectGalImgDown ||
                                        $projectSpeciDown ||
                                        $agentsD < 0 ||
                                        $propertiesD < 0 ||
                                        $projectsD < 0)
                                    <i class="fas fa-exclamation-triangle text-danger"></i>
                                @endif
                            @endif
                            {{ __('Check Limit') }}

                        </button>
                    </li>
                @endif
                <li>
                    <a class="btn btn-primary btn-sm btn-round" target="_blank"
                        href="{{ route('frontend.agent.details', ['username' => Auth::guard('agent')->user()->username]) }}"
                        title="View Profile">
                        <i class="fas fa-eye"></i>
                    </a>
                </li>
                <form action="{{ route('agent.change_theme') }}" class="form-inline mr-3" method="POST">

                    @csrf
                    <div class="form-group">
                        <div class="selectgroup selectgroup-secondary selectgroup-pills">
                            <label class="selectgroup-item">
                                <input type="radio" name="agent_theme_version" value="light"
                                    class="selectgroup-input"
                                    {{ Session::get('agent_theme_version') == 'light' ? 'checked' : '' }}
                                    onchange="this.form.submit()">
                                <span class="selectgroup-button selectgroup-button-icon"><i
                                        class="fa fa-sun"></i></span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="radio" name="agent_theme_version" value="dark"
                                    class="selectgroup-input"
                                    {{ Session::get('agent_theme_version') == 'dark' ? 'checked' : '' }}
                                    onchange="this.form.submit()">
                                <span class="selectgroup-button selectgroup-button-icon"><i
                                        class="fa fa-moon"></i></span>
                            </label>
                        </div>
                    </div>
                </form>


                <li class="nav-item dropdown hidden-caret">
                    <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                        <div class="avatar-sm">
                            @if (Auth::guard('agent')->user()->image != null)
                                <img src="{{ asset('assets/img/agents/' . Auth::guard('agent')->user()->image) }}"
                                    alt="Vendor Image" class="avatar-img rounded-circle">
                            @else
                                <img src="{{ asset('assets/img/blank-user.jpg') }}" alt=""
                                    class="avatar-img rounded-circle">
                            @endif
                        </div>
                    </a>

                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                        <div class="dropdown-user-scroll scrollbar-outer">
                            <li>
                                <div class="user-box">
                                    <div class="avatar-lg">
                                        @if (Auth::guard('agent')->user()->image != null)
                                            <img src="{{ asset('assets/img/agents/' . Auth::guard('agent')->user()->image) }}"
                                                alt="Agent Image" class="avatar-img rounded-circle">
                                        @else
                                            <img src="{{ asset('assets/img/blank-user.jpg') }}" alt=""
                                                class="avatar-img rounded-circle">
                                        @endif
                                    </div>

                                    <div class="u-text">
                                        <h4>
                                            {{ Auth::guard('agent')->user()->username }}
                                        </h4>
                                        <p class="text-muted">{{ Auth::guard('agent')->user()->email }}</p>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{{ route('agent.edit.profile') }}">
                                    {{ __('Edit Profile') }}
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{{ route('agent.change_password') }}">
                                    {{ __('Change Password') }}
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{{ route('agent.logout') }}">
                                    {{ __('Logout') }}
                                </a>
                            </li>
                        </div>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Navbar Header End -->
</div>


<!-- Modal -->
@if ($agent->vendor_id != 0)
    @if (!is_null($currentPackage))
        <div class="modal fade" id="allLimits" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title card-title" id="exampleModalLabel">
                            {{ __('All Limit') }}</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        @php

                            $agentLeft = $currentPackage->number_of_agent - $featuresCount['agents'];
                            $propertiesLeft = $currentPackage->number_of_property - $featuresCount['properties'];
                            $projectLeft = $currentPackage->number_of_projects - $featuresCount['projects'];

                        @endphp
                        @if (
                            $propertiesLeft < 0 ||
                                $proGalImgDown ||
                                $proSpeciDown ||
                                $projectLeft < 0 ||
                                $projectGalImgDown ||
                                $projectTypeDown ||
                                $projectSpeciDown)
                            <div class="alert alert-warning">
                                <span
                                    class="text-warning">{{ __("If any of your package feature's limit exceeds, you can not add or edit any other feature.") }}</span>
                            </div>
                        @endif
                        @if ($agentLeft < 0)
                            <div class="alert alert-warning">
                                <span
                                    class="text-warning">{{ __('You cannot add / edit any feature. Please contact with Vendor.') }}</span>
                            </div>
                        @endif
                        <ul class="list-group border ">

                            <li class="list-group-item">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($propertiesLeft < 0)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Properties Left:') }}
                                    </span>

                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_property == 999999 ? 'Unlimited' : ($currentPackage->number_of_property - $featuresCount['properties'] < 0 ? 0 : $currentPackage->number_of_property - $featuresCount['properties']) }}
                                    </span>
                                </div>

                                @if ($propertiesLeft == 0)
                                    <p class="text-warning m-0">
                                        {{ __('Your property features limit is over. You can\'t add more property.') }}
                                    </p>
                                @endif
                                @if ($featuresCount['properties'] > $currentPackage->number_of_property)
                                    <p class="text-warning m-0">{{ __('Limit has been crossed, you have to delete') }}


                                        {{ abs($currentPackage->number_of_property - $featuresCount['properties']) }}
                                        {{ abs($currentPackage->number_of_property - $featuresCount['properties']) == 1 ? 'property' : 'properties' }}

                                    </p>
                                @endif
                            <li class="list-group-item ">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($proGalImgDown)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Gallery Images Limit (Per Property):') }}
                                    </span>

                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_property_gallery_images == 999999 ? 'Unlimited' : $currentPackage->number_of_property_gallery_images }}
                                    </span>
                                </div>


                                @if ($proImgCount > $currentPackage->number_of_property_gallery_images)
                                    <p class="text-warning m-0">
                                        {{ __("Please remove some 'gallery images' from properties & make sure each property has maximum ") }}
                                        {{ abs($currentPackage->number_of_property_gallery_images) }}
                                        {{ __('gallery images') }}
                                    </p>
                                @endif
                            </li>


                            <li class="list-group-item ">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($proSpeciDown)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Additional Features Limit (Per Property):') }}
                                    </span>
                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_property_adittionl_specifications == 999999 ? 'Unlimited' : $currentPackage->number_of_property_adittionl_specifications }}
                                    </span>

                                </div>


                                @if ($proSpeciCount > $currentPackage->number_of_property_adittionl_specifications)
                                    <p class="text-warning m-0">
                                        {{ __("Please remove some 'additional features' from properties & make sure each property has maximum ") }}
                                        {{ abs($currentPackage->number_of_property_adittionl_specifications) }}
                                        {{ __('additional features') }}
                                    </p>
                                @endif
                            </li>
                            </li>


                            <li class="list-group-item">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($projectLeft < 0)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Projects Left:') }}
                                    </span>

                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_projects == 999999 ? 'Unlimited' : ($currentPackage->number_of_projects - $featuresCount['projects'] < 0 ? 0 : $currentPackage->number_of_projects - $featuresCount['projects']) }}
                                    </span>
                                </div>

                                @if ($projectLeft == 0)
                                    <p class="text-warning m-0">
                                        {{ __('Your project features limit is over. You can\'t add more project.') }}
                                    </p>
                                @endif

                                @if ($featuresCount['projects'] > $currentPackage->number_of_projects)
                                    <p class="text-warning m-0">{{ __('Limit has been crossed, you have to delete') }}


                                        {{ abs($currentPackage->number_of_projects - $featuresCount['projects']) }}
                                        {{ abs($currentPackage->number_of_projects - $featuresCount['projects']) == 1 ? 'project' : 'projects' }}

                                    </p>
                                @endif


                            <li class="list-group-item ">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($projectGalImgDown)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Gallery Images Limit (Per Project):') }}
                                    </span>
                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_project_gallery_images == 999999 ? 'Unlimited' : $currentPackage->number_of_project_gallery_images }}
                                    </span>

                                </div>


                                @if ($projectImgCount > $currentPackage->number_of_project_gallery_images)
                                    <p class="text-warning m-0">
                                        {{ __("Please remove some 'gallery images' from projects & make sure each project has maximum ") }}
                                        {{ abs($currentPackage->number_of_project_gallery_images) }}
                                        {{ __('gallery images') }}
                                    </p>
                                @endif
                            </li>

                            <li class="list-group-item ">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($projectTypeDown)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Project Types Limit (Per Project):') }}
                                    </span>
                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_project_types == 999999 ? 'Unlimited' : $currentPackage->number_of_project_types }}
                                    </span>

                                </div>


                                @if ($projectTypeCount > $currentPackage->number_of_project_types)
                                    <p class="text-warning m-0">
                                        {{ __("Please remove some 'project type' from projects & make sure each project has maximum ") }}
                                        {{ abs($currentPackage->number_of_project_types) }}
                                        {{ __('project types') }}
                                    </p>
                                @endif
                            </li>

                            <li class="list-group-item ">
                                <div class="d-flex  justify-content-between">
                                    <span class="text-focus">
                                        @if ($projectSpeciDown)
                                            <i class="fas fa-exclamation-circle text-danger"></i>
                                        @endif
                                        {{ __('Additional Features Limit (Per Project):') }}
                                    </span>
                                    <span class="badge badge-primary badge-sm">
                                        {{ $currentPackage->number_of_project_additionl_specifications == 999999 ? 'Unlimited' : $currentPackage->number_of_project_additionl_specifications }}
                                    </span>

                                </div>

                                @if ($projectSpeciCount > $currentPackage->number_of_project_additionl_specifications)
                                    <p class="text-warning m-0">
                                        {{ __("Please remove some 'additional features' from projects & make sure each project has maximum ") }}
                                        {{ abs($currentPackage->number_of_project_additionl_specifications) }}
                                        {{ __('additional features') }}
                                    </p>
                                @endif
                            </li>


                            </li>



                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">{{ __('Close') }}</button>

                    </div>
                </div>
            </div>
        </div>
    @endif
@endif
