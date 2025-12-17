<div class="sidebar sidebar-style-2"
    data-background-color="{{ $settings->admin_theme_version == 'light' ? 'white' : 'dark2' }}">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="avatar-sm float-left mr-2">
                    @if (Auth::guard('admin')->user()->image != null)
                        <img src="{{ asset('assets/img/admins/' . Auth::guard('admin')->user()->image) }}"
                            alt="Admin Image" class="avatar-img rounded-circle">
                    @else
                        <img src="{{ asset('assets/img/blank_user.jpg') }}" alt=""
                            class="avatar-img rounded-circle">
                    @endif
                </div>

                <div class="info">
                    <a data-toggle="collapse" href="#adminProfileMenu" aria-expanded="true">
                        <span>
                            {{ Auth::guard('admin')->user()->first_name }}

                            @if (is_null($roleInfo))
                                <span class="user-level">{{ __('Super Admin') }}</span>
                            @else
                                <span class="user-level">{{ $roleInfo->name }}</span>
                            @endif

                            <span class="caret"></span>
                        </span>
                    </a>

                    <div class="clearfix"></div>

                    <div class="collapse in" id="adminProfileMenu">
                        <ul class="nav">
                            <li>
                                <a href="{{ route('admin.edit_profile') }}">
                                    <span class="link-collapse">{{ 'Edit Profile' }}</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.change_password') }}">
                                    <span class="link-collapse">{{ 'Change Password' }}</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.logout') }}">
                                    <span class="link-collapse">{{ 'Logout' }}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            @php
                if (!is_null($roleInfo)) {
                    $rolePermissions = json_decode($roleInfo->permissions);
                }
            @endphp

            <ul class="nav nav-primary">
                {{-- search --}}
                <div class="row mb-3">
                    <div class="col-12">
                        <form action="">
                            <div class="form-group py-0">
                                <input name="term" type="text" class="form-control sidebar-search ltr"
                                    placeholder="Search Menu Here...">
                            </div>
                        </form>
                    </div>
                </div>

                {{-- dashboard --}}
                <li class="nav-item @if (request()->routeIs('admin.dashboard')) active @endif">
                    <a href="{{ route('admin.dashboard') }}">
                        <i class="la flaticon-paint-palette"></i>
                        <p>{{ 'Dashboard' }}</p>
                    </a>
                </li>

                {{-- Property specifications --}}

                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Property Features', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.property_specification.categories')) active 
                        @elseif (request()->routeIs('admin.property_specification.countries')) active 
              @elseif (request()->routeIs('admin.property_specification.settings')) active 
              @elseif (request()->routeIs('admin.property_specification.states')) active 
              @elseif (request()->routeIs('admin.property_specification.cities')) active  @endif">
                        <a data-toggle="collapse" href="#propertySpecification">
                            <i class="far fa-file-alt"></i>
                            <p>{{ __('Property Specifications') }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="propertySpecification"
                            class="collapse 
              @if (request()->routeIs('admin.property_specification.categories')) show 
              @elseif (request()->routeIs('admin.property_specification.settings')) show 
              @elseif (request()->routeIs('admin.property_specification.countries')) show 
              @elseif (request()->routeIs('admin.property_specification.states')) show 
              @elseif (request()->routeIs('admin.property_specification.cities')) show 
              @elseif(request()->routeIs('admin.property_specification.amenities'))  show 
              @elseif(request()->routeIs('admin.property_specification.cities'))  show @endif">
                            <ul class="nav nav-collapse">
                                <li
                                    class="{{ request()->routeIs('admin.property_specification.settings') ? 'active' : '' }}">
                                    <a href="{{ route('admin.property_specification.settings') }}">
                                        <span class="sub-item">{{ __('Settings') }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.property_specification.categories') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.property_specification.categories', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ __('Categories') }}</span>
                                    </a>
                                </li>


                                <li
                                    class="{{ request()->routeIs('admin.property_specification.amenities') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.property_specification.amenities', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ __('Amenities') }}</span>
                                    </a>
                                </li>
                                @if ($settings->property_country_status == 1)
                                    <li
                                        class="{{ request()->routeIs('admin.property_specification.countries') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.property_specification.countries', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ __('Countries') }}</span>
                                        </a>
                                    </li>
                                @endif
                                @if ($settings->property_state_status == 1)
                                    <li
                                        class="{{ request()->routeIs('admin.property_specification.states') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.property_specification.states', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ __('States') }}</span>
                                        </a>
                                    </li>
                                @endif
                                <li
                                    class="{{ request()->routeIs('admin.property_specification.cities') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.property_specification.cities', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ __('Cities') }}</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                @endif

                {{-- end property specifications  --}}

                {{-- Property management --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Property Management', $rolePermissions)))
                    <li
                        class="nav-item
                     @if (request()->routeIs('admin.property_management.create_property')) active
                     @elseif (request()->routeIs('admin.property_management.properties')) active 
                     @elseif (request()->routeIs('admin.property_management.edit')) active 
                     @elseif (request()->routeIs('admin.property_management.settings')) active 
                      @elseif(request()->routeIs('admin.property_management.type')) active @endif">
                        <a data-toggle="collapse" href="#carManagement">
                            <i class="far fa-home"></i>
                            <p>{{ __('Property Management') }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="carManagement"
                            class="collapse 
              @if (request()->routeIs('admin.property_management.create_property')) show 
              @elseif (request()->routeIs('admin.property_management.type')) show 
              @elseif (request()->routeIs('admin.property_management.properties')) show 
              @elseif (request()->routeIs('admin.property_management.settings')) show 
              @elseif (request()->routeIs('admin.property_management.edit')) show @endif
              ">
                            <ul class="nav nav-collapse">
                                <li
                                    class="{{ request()->routeIs('admin.property_management.settings') ? 'active' : '' }}">
                                    <a href="{{ route('admin.property_management.settings') }}">
                                        <span class="sub-item">{{ __('Settings') }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.property_management.create_property') || request()->routeIs('admin.property_management.type') ? 'active' : '' }}">
                                    <a href="{{ route('admin.property_management.type') }}">
                                        <span class="sub-item">{{ __('Add Property') }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.property_management.properties') ||
                                    request()->routeIs('admin.property_management.edit')
                                        ? 'active'
                                        : '' }}">
                                    <a
                                        href="{{ route('admin.property_management.properties', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ __('Manage Properties') }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                {{-- end property management  --}}

                {{-- start featured properties  --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Featured Properties', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.featured_pricing.index')) active @elseif(request()->routeIs('admin.featured_pricing.edit')) active @elseif(request()->routeIs('admin.requested_for_featured')) active @endif">
                        <a data-toggle="collapse" href="#featuredPricing">
                            <i class="far fa-money-bill-alt"></i>
                            <p>{{ 'Featured Properties' }}</p>

                            <span class="caret"></span>
                        </a>

                        <div id="featuredPricing"
                            class="collapse 
              @if (request()->routeIs('admin.featured_pricing.index')) show @elseif(request()->routeIs('admin.featured_pricing.edit')) show @elseif(request()->routeIs('admin.requested_for_featured')) show @endif">
                            <ul class="nav nav-collapse">

                                <li
                                    class="{{ request()->routeIs('admin.featured_pricing.index') || request()->routeIs('admin.featured_pricing.edit') ? 'active' : '' }}">
                                    <a href="{{ route('admin.featured_pricing.index') }}">
                                        <span class="sub-item">{{ 'Pricing' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.requested_for_featured') && request()->input('status') == 'all' ? 'active' : '' }}">
                                    <a href="{{ route('admin.requested_for_featured', ['status' => 'all']) }}">
                                        <span class="sub-item">{{ 'All Request' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.requested_for_featured') && request()->input('status') == 'pending' ? 'active' : '' }}">
                                    <a href="{{ route('admin.requested_for_featured', ['status' => 'pending']) }}">
                                        <span class="sub-item">{{ 'Pending Request' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.requested_for_featured') && request()->input('status') == 'accepted' ? 'active' : '' }}">
                                    <a href="{{ route('admin.requested_for_featured', ['status' => 'accepted']) }}">
                                        <span class="sub-item">{{ 'Accepted Request' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.requested_for_featured') && request()->input('status') == 'rejected' ? 'active' : '' }}">
                                    <a href="{{ route('admin.requested_for_featured', ['status' => 'rejected']) }}">
                                        <span class="sub-item">{{ 'Rejected Request' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                {{-- end featured properties  --}}

                {{-- start property messages  --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Property Messages', $rolePermissions)))
                    <li class="nav-item  @if (request()->routeIs('admin.property_message.index')) active @endif">
                        <a href="{{ route('admin.property_message.index') }}">
                            <i class="fas fa-comment"></i>
                            <p>{{ __('Property Messages') }}</p>
                        </a>
                    </li>
                @endif
                {{-- end property messages  --}}

                {{-- Project management  start --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Project Management', $rolePermissions)))
                    <li
                        class="nav-item
                     @if (request()->routeIs('admin.project_management.projects')) active
                     @elseif (request()->routeIs('admin.project_management.create_project')) active 
                     @elseif (request()->routeIs('admin.project_management.project_types')) active 
                     @elseif (request()->routeIs('admin.project_management.settings')) active 
                     @elseif (request()->routeIs('admin.project_management.edit')) active @endif">
                        <a data-toggle="collapse" href="#projectManagement">
                            <i class="fal fa-building"></i>
                            <p>{{ __('Project Management') }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="projectManagement"
                            class="collapse 
              @if (request()->routeIs('admin.project_management.create_project')) show 
              @elseif (request()->routeIs('admin.project_management.projects')) show  
              @elseif (request()->routeIs('admin.project_management.settings')) show  
               @elseif (request()->routeIs('admin.project_management.edit')) show
              @elseif (request()->routeIs('admin.project_management.project_types')) show @endif
              ">
                            <ul class="nav nav-collapse">

                                <li
                                    class="{{ request()->routeIs('admin.project_management.settings') ? 'active' : '' }}">
                                    <a href="{{ route('admin.project_management.settings') }}">
                                        <span class="sub-item">{{ __('Settings') }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.project_management.create_project') ? 'active' : '' }}">
                                    <a href="{{ route('admin.project_management.create_project') }}">
                                        <span class="sub-item">{{ __('Add Project') }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.project_management.projects') ||
                                    request()->routeIs('admin.property_management.edit') ||
                                    request()->routeIs('admin.project_management.project_types')
                                        ? 'active'
                                        : '' }}">
                                    <a
                                        href="{{ route('admin.project_management.projects', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ __('Manage Projects') }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                {{-- Project Management end  --}}


                {{-- Start Agnet  --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Agent', $rolePermissions)))
                    <li class="nav-item  @if (request()->routeIs('admin.agent_management.index')) active @endif">
                        <a href="{{ route('admin.agent_management.index') }}">
                            <i class="fal fa-users-cog"></i>
                            <p> {{ 'Agents' }} </p>
                        </a>
                    </li>
                @endif
                {{-- end agent  --}}

                {{-- start package management --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Package Management', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.package.settings')) active 
            @elseif (request()->routeIs('admin.package.index')) active 
            @elseif (request()->routeIs('admin.package.edit')) active @endif">
                        <a data-toggle="collapse" href="#packageManagement">
                            <i class="fal fa-receipt"></i>
                            <p>{{ 'Package Management' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="packageManagement"
                            class="collapse 
              @if (request()->routeIs('admin.package.settings')) show 
              @elseif (request()->routeIs('admin.package.index')) show 
              @elseif (request()->routeIs('admin.package.edit')) show @endif">
                            <ul class="nav nav-collapse">

                                <li class="{{ request()->routeIs('admin.package.settings') ? 'active' : '' }}">
                                    <a href="{{ route('admin.package.settings') }}">
                                        <span class="sub-item">{{ 'Settings' }}</span>
                                    </a>
                                </li>

                                <li class="{{ request()->routeIs('admin.package.index') ? 'active' : '' }}">
                                    <a href="{{ route('admin.package.index') }}">
                                        <span class="sub-item">{{ 'Packages' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                {{-- end package management  --}}

                {{-- menu builder --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Menu Builder', $rolePermissions)))
                    <li class="nav-item @if (request()->routeIs('admin.menu_builder')) active @endif">
                        <a href="{{ route('admin.menu_builder', ['language' => $defaultLang->code]) }}">
                            <i class="fal fa-bars"></i>
                            <p>{{ 'Menu Builder' }}</p>
                        </a>
                    </li>
                @endif



                {{-- payment log --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Payment Log', $rolePermissions)))
                    <li class="nav-item @if (request()->routeIs('admin.payment-log.index')) active @endif">
                        <a href="{{ route('admin.payment-log.index') }}">
                            <i class="fas fa-list-ol"></i>
                            <p>{{ 'Payment Log' }}</p>
                        </a>
                    </li>
                @endif

                {{-- start user management --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('User Management', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.user_management.registered_users')) active 
            @elseif (request()->routeIs('admin.user_management.registered_user.create')) active 
            @elseif (request()->routeIs('admin.user_management.registered_user.edit')) active 
            @elseif (request()->routeIs('admin.user_management.user.change_password')) active 
            @elseif (request()->routeIs('admin.user_management.subscribers')) active 
            @elseif (request()->routeIs('admin.user_management.mail_for_subscribers')) active @endif">
                        <a data-toggle="collapse" href="#user">
                            <i class="la flaticon-users"></i>
                            <p>{{ 'Users Management' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="user"
                            class="collapse 
              @if (request()->routeIs('admin.user_management.registered_users')) show 
              @elseif (request()->routeIs('admin.user_management.registered_user.create')) show 
              @elseif (request()->routeIs('admin.user_management.registered_user.edit')) show 
              @elseif (request()->routeIs('admin.user_management.user.change_password')) show 
              @elseif (request()->routeIs('admin.user_management.subscribers')) show 
              @elseif (request()->routeIs('admin.user_management.mail_for_subscribers')) show @endif">
                            <ul class="nav nav-collapse">
                                <li
                                    class="@if (request()->routeIs('admin.user_management.registered_users')) active 
                  @elseif (request()->routeIs('admin.user_management.user.change_password')) active
@elseif (request()->routeIs('admin.user_management.registered_user.edit'))
active @endif
                  ">
                                    <a href="{{ route('admin.user_management.registered_users') }}">
                                        <span class="sub-item">{{ 'Registered Users' }}</span>
                                    </a>
                                </li>

                                <li class="@if (request()->routeIs('admin.user_management.registered_user.create')) active @endif
                  ">
                                    <a href="{{ route('admin.user_management.registered_user.create') }}">
                                        <span class="sub-item">{{ 'Add User' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="@if (request()->routeIs('admin.user_management.subscribers')) active 
                  @elseif (request()->routeIs('admin.user_management.mail_for_subscribers')) active @endif">
                                    <a href="{{ route('admin.user_management.subscribers') }}">
                                        <span class="sub-item">{{ 'Subscribers' }}</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                @endif
                {{-- end user management  --}}

                {{-- start vendors management --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Vendors Management', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.vendor_management.registered_vendor')) active
            @elseif (request()->routeIs('admin.vendor_management.add_vendor')) active
            @elseif (request()->routeIs('admin.vendor_management.vendor_details')) active
            @elseif (request()->routeIs('admin.edit_management.vendor_edit')) active
            @elseif (request()->routeIs('admin.vendor_management.settings')) active
            @elseif (request()->routeIs('admin.vendor_management.vendor.change_password')) active @endif">
                        <a data-toggle="collapse" href="#vendor">
                            <i class="la flaticon-users"></i>
                            <p>{{ 'Vendors Management' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="vendor"
                            class="collapse
              @if (request()->routeIs('admin.vendor_management.registered_vendor')) show
              @elseif (request()->routeIs('admin.vendor_management.vendor_details')) show
              @elseif (request()->routeIs('admin.edit_management.vendor_edit')) show
              @elseif (request()->routeIs('admin.vendor_management.add_vendor')) show
              @elseif (request()->routeIs('admin.vendor_management.settings')) show
              @elseif (request()->routeIs('admin.vendor_management.vendor.change_password')) show @endif">
                            <ul class="nav nav-collapse">
                                <li class="@if (request()->routeIs('admin.vendor_management.settings')) active @endif">
                                    <a href="{{ route('admin.vendor_management.settings') }}">
                                        <span class="sub-item">{{ 'Settings' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="@if (request()->routeIs('admin.vendor_management.registered_vendor')) active
                  @elseif (request()->routeIs('admin.vendor_management.vendor_details')) active
                  @elseif (request()->routeIs('admin.edit_management.vendor_edit')) active
                  @elseif (request()->routeIs('admin.vendor_management.vendor.change_password')) active @endif">
                                    <a href="{{ route('admin.vendor_management.registered_vendor') }}">
                                        <span class="sub-item">{{ 'Registered vendors' }}</span>
                                    </a>
                                </li>
                                <li class="@if (request()->routeIs('admin.vendor_management.add_vendor')) active @endif">
                                    <a href="{{ route('admin.vendor_management.add_vendor') }}">
                                        <span class="sub-item">{{ 'Add vendor' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                {{-- end vendors management  --}}

                {{-- Support Tickets --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Support Tickets', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.support_ticket.setting')) active
            @elseif (request()->routeIs('admin.support_tickets')) active
            @elseif (request()->routeIs('admin.support_tickets.message')) active active @endif">
                        <a data-toggle="collapse" href="#support_ticket">
                            <i class="la flaticon-web-1"></i>
                            <p>{{ 'Support Tickets' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="support_ticket"
                            class="collapse
              @if (request()->routeIs('admin.support_ticket.setting')) show
              @elseif (request()->routeIs('admin.support_tickets')) show
              @elseif (request()->routeIs('admin.support_tickets.message')) show @endif">
                            <ul class="nav nav-collapse">
                                <li class="@if (request()->routeIs('admin.support_ticket.setting')) active @endif">
                                    <a href="{{ route('admin.support_ticket.setting') }}">
                                        <span class="sub-item">{{ 'Setting' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.support_tickets') && empty(request()->input('status')) ? 'active' : '' }}">
                                    <a href="{{ route('admin.support_tickets') }}">
                                        <span class="sub-item">{{ 'All Tickets' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.support_tickets') && request()->input('status') == 1 ? 'active' : '' }}">
                                    <a href="{{ route('admin.support_tickets', ['status' => 1]) }}">
                                        <span class="sub-item">{{ 'Pending Tickets' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.support_tickets') && request()->input('status') == 2 ? 'active' : '' }}">
                                    <a href="{{ route('admin.support_tickets', ['status' => 2]) }}">
                                        <span class="sub-item">{{ 'Open Tickets' }}</span>
                                    </a>
                                </li>
                                <li
                                    class="{{ request()->routeIs('admin.support_tickets') && request()->input('status') == 3 ? 'active' : '' }}">
                                    <a href="{{ route('admin.support_tickets', ['status' => 3]) }}">
                                        <span class="sub-item">{{ 'Closed Tickets' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                {{-- end support tickets  --}}



                {{-- home page --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Home Page', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.home_page.hero_section.slider_version')) active 
            @elseif (request()->routeIs('admin.home_page.about_section')) active 
            @elseif (request()->routeIs('admin.home_page.category_section')) active  
            @elseif (request()->routeIs('admin.home_page.work_process_section')) active 
            @elseif (request()->routeIs('admin.home_page.feature_section')) active 
            @elseif (request()->routeIs('admin.home_page.counter_section')) active 
            @elseif (request()->routeIs('admin.home_page.testimonial_section')) active  
            @elseif (request()->routeIs('admin.home_page.call_to_action_section')) active 
            @elseif (request()->routeIs('admin.home_page.hero_section.static_version')) active 
            @elseif (request()->routeIs('admin.home_page.about_section')) active 
            @elseif (request()->routeIs('admin.home_page.brand_section')) active 
            @elseif (request()->routeIs('admin.home_page.why_choose_us')) active 
            @elseif (request()->routeIs('admin.home_page.city_section')) active 
            @elseif (request()->routeIs('admin.home_page.subscribe_section')) active 
            @elseif (request()->routeIs('admin.home_page.vendor_section')) active  
            @elseif (request()->routeIs('admin.home_page.project_section')) active 
            @elseif (request()->routeIs('admin.home_page.property_section')) active 
            @elseif (request()->routeIs('admin.home_page.section_customization')) active 
            @elseif (request()->routeIs('admin.home_page.pricing_section')) active 
            @elseif (request()->routeIs('admin.home_page.partners')) active @endif">
                        <a data-toggle="collapse" href="#home_page">
                            <i class="fal fa-layer-group"></i>
                            <p>{{ 'Home Page' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="home_page"
                            class="collapse 
              @if (request()->routeIs('admin.home_page.hero_section.slider_version')) show 
               
              @elseif (request()->routeIs('admin.home_page.about_section')) show  
              @elseif (request()->routeIs('admin.home_page.category_section')) show 
              @elseif (request()->routeIs('admin.home_page.work_process_section')) show 
              @elseif (request()->routeIs('admin.home_page.feature_section')) show 
              @elseif (request()->routeIs('admin.home_page.counter_section')) show 
              @elseif (request()->routeIs('admin.home_page.testimonial_section')) show  
              @elseif (request()->routeIs('admin.home_page.call_to_action_section')) show  
              @elseif (request()->routeIs('admin.home_page.hero_section.static_version')) show 
              @elseif (request()->routeIs('admin.home_page.about_section')) show 
              @elseif (request()->routeIs('admin.home_page.brand_section')) show 
              @elseif (request()->routeIs('admin.home_page.why_choose_us_section')) show 
              @elseif (request()->routeIs('admin.home_page.city_section')) show 
              @elseif (request()->routeIs('admin.home_page.subscribe_section')) show 
              @elseif (request()->routeIs('admin.home_page.vendor_section')) show 
              @elseif (request()->routeIs('admin.home_page.project_section')) show 
              @elseif (request()->routeIs('admin.home_page.property_section')) show 
              @elseif (request()->routeIs('admin.home_page.section_customization')) show 
              @elseif (request()->routeIs('admin.home_page.pricing_section')) show 
              @elseif (request()->routeIs('admin.home_page.partners')) show @endif">
                            <ul class="nav nav-collapse">
                                <li class="submenu">
                                    <a data-toggle="collapse" href="#hero_section">
                                        <span class="sub-item">{{ 'Hero Section' }}</span>
                                        <span class="caret"></span>
                                    </a>

                                    <div id="hero_section"
                                        class="collapse 
                    @if (request()->routeIs('admin.home_page.hero_section.slider_version')) show             @elseif (request()->routeIs('admin.home_page.hero_section.static_version')) show @endif">
                                        <ul class="nav nav-collapse subnav">
                                            @if ($settings->theme_version == 2)
                                                <li
                                                    class="{{ request()->routeIs('admin.home_page.hero_section.slider_version') ? 'active' : '' }}">
                                                    <a
                                                        href="{{ route('admin.home_page.hero_section.slider_version', ['language' => $defaultLang->code]) }}">
                                                        <span class="sub-item">{{ 'Slider Version' }}</span>
                                                    </a>
                                                </li>
                                            @else
                                                <li
                                                    class="{{ request()->routeIs('admin.home_page.hero_section.static_version') ? 'active' : '' }}">
                                                    <a
                                                        href="{{ route('admin.home_page.hero_section.static_version', ['language' => $defaultLang->code]) }}">
                                                        <span class="sub-item">{{ 'Static Version' }}</span>
                                                    </a>
                                                </li>
                                            @endif
                                        </ul>
                                    </div>
                                </li>

                                @if ($settings->theme_version == 2 || $settings->theme_version == 3)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.category_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.category_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Category Section' }}</span>
                                        </a>
                                    </li>
                                @endif
                                @if ($settings->theme_version == 1 || $settings->theme_version == 3)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.about_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.about_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'About Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                @if ($settings->theme_version == 1)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.why_choose_us_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.why_choose_us_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Why Choose Us Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                @if ($settings->theme_version == 1 || $settings->theme_version == 2)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.brand_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.brand_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Brand Section' }}</span>
                                        </a>
                                        </>
                                @endif

                                <li
                                    class="{{ request()->routeIs('admin.home_page.property_section') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.home_page.property_section', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Property Section' }}</span>
                                    </a>
                                </li>


                                @if ($settings->theme_version == 1 || $settings->theme_version == 2)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.feature_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.feature_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Featured Property Section' }}</span>
                                        </a>
                                    </li>
                                @endif
                                @if ($settings->theme_version == 3)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.project_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.project_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Project Section' }}</span>
                                        </a>
                                        </>
                                @endif

                                @if ($settings->theme_version == 2)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.pricing_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.pricing_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Pricing Section' }}</span>
                                        </a>
                                        </>
                                @endif

                                @if ($settings->theme_version == 2 || $settings->theme_version == 3)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.work_process_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.work_process_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Work Process Section' }}</span>
                                        </a>
                                    </li>
                                @endif
                                @if ($settings->theme_version != 2)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.counter_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.counter_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Counter Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                @if ($settings->theme_version == 1)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.city_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.city_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'City Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                <li
                                    class="{{ request()->routeIs('admin.home_page.testimonial_section') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.home_page.testimonial_section', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Testimonial Section' }}</span>
                                    </a>
                                </li>



                                @if ($settings->theme_version == 2)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.call_to_action_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.call_to_action_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Call To Action Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                @if ($settings->theme_version == 1)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.vendor_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.vendor_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Vendor Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                @if ($settings->theme_version == 1)
                                    <li
                                        class="{{ request()->routeIs('admin.home_page.subscribe_section') ? 'active' : '' }}">
                                        <a
                                            href="{{ route('admin.home_page.subscribe_section', ['language' => $defaultLang->code]) }}">
                                            <span class="sub-item">{{ 'Subscribe Section' }}</span>
                                        </a>
                                    </li>
                                @endif

                                <li
                                    class="{{ request()->routeIs('admin.home_page.section_customization') ? 'active' : '' }}">
                                    <a href="{{ route('admin.home_page.section_customization') }}">
                                        <span class="sub-item">{{ 'Section Show/Hide' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif



                {{-- footer --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Footer', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.footer.logo_and_image')) active 
            @elseif (request()->routeIs('admin.footer.content')) active 
            @elseif (request()->routeIs('admin.footer.quick_links')) active @endif">
                        <a data-toggle="collapse" href="#footer">
                            <i class="fal fa-shoe-prints"></i>
                            <p>{{ 'Footer' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="footer"
                            class="collapse @if (request()->routeIs('admin.footer.logo_and_image')) show 
              @elseif (request()->routeIs('admin.footer.content')) show 
              @elseif (request()->routeIs('admin.footer.quick_links')) show @endif">
                            <ul class="nav nav-collapse">
                                <li class="{{ request()->routeIs('admin.footer.logo_and_image') ? 'active' : '' }}">
                                    <a href="{{ route('admin.footer.logo_and_image') }}">
                                        <span class="sub-item">{{ 'Logo & Image' }}</span>
                                    </a>
                                </li>

                                <li class="{{ request()->routeIs('admin.footer.content') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.footer.content', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Content' }}</span>
                                    </a>
                                </li>

                                <li class="{{ request()->routeIs('admin.footer.quick_links') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.footer.quick_links', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Quick Links' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                {{-- custom page --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Custom Pages', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.custom_pages')) active 
            @elseif (request()->routeIs('admin.custom_pages.create_page')) active 
            @elseif (request()->routeIs('admin.custom_pages.edit_page')) active @endif">
                        <a href="{{ route('admin.custom_pages', ['language' => $defaultLang->code]) }}">
                            <i class="la flaticon-file"></i>
                            <p>{{ 'Custom Pages' }}</p>
                        </a>
                    </li>
                @endif

                {{-- blog --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Blog Management', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.blog_management.categories')) active 
            @elseif (request()->routeIs('admin.blog_management.blogs')) active 
            @elseif (request()->routeIs('admin.blog_management.create_blog')) active 
            @elseif (request()->routeIs('admin.blog_management.edit_blog')) active @endif">
                        <a data-toggle="collapse" href="#blog">
                            <i class="fal fa-blog"></i>
                            <p>{{ 'Blog Management' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="blog"
                            class="collapse 
              @if (request()->routeIs('admin.blog_management.categories')) show 
              @elseif (request()->routeIs('admin.blog_management.blogs')) show 
              @elseif (request()->routeIs('admin.blog_management.create_blog')) show 
              @elseif (request()->routeIs('admin.blog_management.edit_blog')) show @endif">
                            <ul class="nav nav-collapse">
                                <li
                                    class="{{ request()->routeIs('admin.blog_management.categories') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.blog_management.categories', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Categories' }}</span>
                                    </a>
                                </li>



                                <li
                                    class="@if (request()->routeIs('admin.blog_management.blogs')) active 
                  @elseif (request()->routeIs('admin.blog_management.create_blog')) active 
                  @elseif (request()->routeIs('admin.blog_management.edit_blog')) active @endif">
                                    <a
                                        href="{{ route('admin.blog_management.blogs', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Posts' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                {{-- faq --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('FAQ Management', $rolePermissions)))
                    <li class="nav-item {{ request()->routeIs('admin.faq_management') ? 'active' : '' }}">
                        <a href="{{ route('admin.faq_management', ['language' => $defaultLang->code]) }}">
                            <i class="la flaticon-round"></i>
                            <p>{{ 'FAQ Management' }}</p>
                        </a>
                    </li>
                @endif

                {{-- advertise --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Advertise', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.advertise.settings')) active 
            @elseif (request()->routeIs('admin.advertise.all_advertisement')) active @endif">
                        <a data-toggle="collapse" href="#customid">
                            <i class="fab fa-buysellads"></i>
                            <p>{{ 'Advertisements' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="customid"
                            class="collapse @if (request()->routeIs('admin.advertise.settings')) show 
              @elseif (request()->routeIs('admin.advertise.all_advertisement')) show @endif">
                            <ul class="nav nav-collapse">
                                <li class="{{ request()->routeIs('admin.advertise.settings') ? 'active' : '' }}">
                                    <a href="{{ route('admin.advertise.settings') }}">
                                        <span class="sub-item">{{ 'Settings' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.advertise.all_advertisement') ? 'active' : '' }}">
                                    <a href="{{ route('admin.advertise.all_advertisement') }}">
                                        <span class="sub-item">{{ 'All Advertisements' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                {{-- announcement popup --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Announcement Popups', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.announcement_popups')) active 
            @elseif (request()->routeIs('admin.announcement_popups.select_popup_type')) active 
            @elseif (request()->routeIs('admin.announcement_popups.create_popup')) active 
            @elseif (request()->routeIs('admin.announcement_popups.edit_popup')) active @endif">
                        <a href="{{ route('admin.announcement_popups', ['language' => $defaultLang->code]) }}">
                            <i class="fal fa-bullhorn"></i>
                            <p>{{ 'Announcement Popups' }}</p>
                        </a>
                    </li>
                @endif




                {{-- basic settings --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Basic Settings', $rolePermissions)))
                    <li
                        class="nav-item 
            @if (request()->routeIs('admin.basic_settings.contact_page')) active
            @elseif (request()->routeIs('admin.basic_settings.mail_from_admin')) active
            @elseif (request()->routeIs('admin.basic_settings.mail_to_admin')) active
            @elseif (request()->routeIs('admin.basic_settings.mail_templates')) active
            @elseif (request()->routeIs('admin.basic_settings.edit_mail_template')) active
            @elseif (request()->routeIs('admin.basic_settings.breadcrumb')) active
            @elseif (request()->routeIs('admin.basic_settings.page_headings')) active
            @elseif (request()->routeIs('admin.basic_settings.plugins')) active
            @elseif (request()->routeIs('admin.basic_settings.seo')) active 
            @elseif (request()->routeIs('admin.basic_settings.maintenance_mode')) active
            @elseif (request()->routeIs('admin.basic_settings.general_settings')) active
            @elseif (request()->routeIs('admin.basic_settings.cookie_alert')) active
            @elseif (request()->routeIs('admin.basic_settings.social_medias')) active @endif">
                        <a data-toggle="collapse" href="#basic_settings">
                            <i class="la flaticon-settings"></i>
                            <p>{{ 'Basic Settings' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="basic_settings"
                            class="collapse 
              @if (request()->routeIs('admin.basic_settings.contact_page')) show
              @elseif (request()->routeIs('admin.basic_settings.mail_from_admin')) show
              @elseif (request()->routeIs('admin.basic_settings.mail_to_admin')) show
              @elseif (request()->routeIs('admin.basic_settings.mail_templates')) show
              @elseif (request()->routeIs('admin.basic_settings.edit_mail_template')) show
              @elseif (request()->routeIs('admin.basic_settings.breadcrumb')) show
              @elseif (request()->routeIs('admin.basic_settings.page_headings')) show
              @elseif (request()->routeIs('admin.basic_settings.plugins')) show
              @elseif (request()->routeIs('admin.basic_settings.seo')) show 
              @elseif (request()->routeIs('admin.basic_settings.maintenance_mode')) show
              @elseif (request()->routeIs('admin.basic_settings.cookie_alert')) show
              @elseif (request()->routeIs('admin.basic_settings.general_settings')) show
              @elseif (request()->routeIs('admin.basic_settings.social_medias')) show @endif">
                            <ul class="nav nav-collapse">
                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.general_settings') ? 'active' : '' }}">
                                    <a href="{{ route('admin.basic_settings.general_settings') }}">
                                        <span class="sub-item">{{ 'General Settings' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.contact_page') ? 'active' : '' }}">
                                    <a href="{{ route('admin.basic_settings.contact_page') }}">
                                        <span class="sub-item">{{ 'Contact Page' }}</span>
                                    </a>
                                </li>

                                <li class="submenu">
                                    <a data-toggle="collapse" href="#mail-settings">
                                        <span class="sub-item">{{ 'Email Settings' }}</span>
                                        <span class="caret"></span>
                                    </a>

                                    <div id="mail-settings"
                                        class="collapse 
                    @if (request()->routeIs('admin.basic_settings.mail_from_admin')) show 
                    @elseif (request()->routeIs('admin.basic_settings.mail_to_admin')) show
                    @elseif (request()->routeIs('admin.basic_settings.mail_templates')) show
                    @elseif (request()->routeIs('admin.basic_settings.edit_mail_template')) show @endif">
                                        <ul class="nav nav-collapse subnav">
                                            <li
                                                class="{{ request()->routeIs('admin.basic_settings.mail_from_admin') ? 'active' : '' }}">
                                                <a href="{{ route('admin.basic_settings.mail_from_admin') }}">
                                                    <span class="sub-item">{{ 'Mail From Admin' }}</span>
                                                </a>
                                            </li>

                                            <li
                                                class="{{ request()->routeIs('admin.basic_settings.mail_to_admin') ? 'active' : '' }}">
                                                <a href="{{ route('admin.basic_settings.mail_to_admin') }}">
                                                    <span class="sub-item">{{ 'Mail To Admin' }}</span>
                                                </a>
                                            </li>

                                            <li
                                                class="@if (request()->routeIs('admin.basic_settings.mail_templates')) active 
                        @elseif (request()->routeIs('admin.basic_settings.edit_mail_template')) active @endif">
                                                <a href="{{ route('admin.basic_settings.mail_templates') }}">
                                                    <span class="sub-item">{{ 'Mail Templates' }}</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.breadcrumb') ? 'active' : '' }}">
                                    <a href="{{ route('admin.basic_settings.breadcrumb') }}">
                                        <span class="sub-item">{{ 'Breadcrumb' }}</span>
                                    </a>
                                </li>


                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.page_headings') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.basic_settings.page_headings', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Page Headings' }}</span>
                                    </a>
                                </li>

                                <li class="{{ request()->routeIs('admin.basic_settings.plugins') ? 'active' : '' }}">
                                    <a href="{{ route('admin.basic_settings.plugins') }}">
                                        <span class="sub-item">{{ 'Plugins' }}</span>
                                    </a>
                                </li>

                                <li class="{{ request()->routeIs('admin.basic_settings.seo') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.basic_settings.seo', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'SEO Informations' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.maintenance_mode') ? 'active' : '' }}">
                                    <a href="{{ route('admin.basic_settings.maintenance_mode') }}">
                                        <span class="sub-item">{{ 'Maintenance Mode' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.cookie_alert') ? 'active' : '' }}">
                                    <a
                                        href="{{ route('admin.basic_settings.cookie_alert', ['language' => $defaultLang->code]) }}">
                                        <span class="sub-item">{{ 'Cookie Alert' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.basic_settings.social_medias') ? 'active' : '' }}">
                                    <a href="{{ route('admin.basic_settings.social_medias') }}">
                                        <span class="sub-item">{{ 'Social Medias' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                {{-- payment gateway --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Payment Gateways', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.payment_gateways.online_gateways')) active 
            @elseif (request()->routeIs('admin.payment_gateways.offline_gateways')) active @endif">
                        <a data-toggle="collapse" href="#payment_gateways">
                            <i class="la flaticon-paypal"></i>
                            <p>{{ 'Payment Gateways' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="payment_gateways"
                            class="collapse 
              @if (request()->routeIs('admin.payment_gateways.online_gateways')) show 
              @elseif (request()->routeIs('admin.payment_gateways.offline_gateways')) show @endif">
                            <ul class="nav nav-collapse">
                                <li
                                    class="{{ request()->routeIs('admin.payment_gateways.online_gateways') ? 'active' : '' }}">
                                    <a href="{{ route('admin.payment_gateways.online_gateways') }}">
                                        <span class="sub-item">{{ 'Online Gateways' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.payment_gateways.offline_gateways') ? 'active' : '' }}">
                                    <a href="{{ route('admin.payment_gateways.offline_gateways') }}">
                                        <span class="sub-item">{{ 'Offline Gateways' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif


                {{-- admin --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Admin Management', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.admin_management.role_permissions')) active 
            @elseif (request()->routeIs('admin.admin_management.role.permissions')) active 
            @elseif (request()->routeIs('admin.admin_management.registered_admins')) active @endif">
                        <a data-toggle="collapse" href="#admin">
                            <i class="fal fa-users-cog"></i>
                            <p>{{ 'Admin Management' }}</p>
                            <span class="caret"></span>
                        </a>

                        <div id="admin"
                            class="collapse 
              @if (request()->routeIs('admin.admin_management.role_permissions')) show 
              @elseif (request()->routeIs('admin.admin_management.role.permissions')) show 
              @elseif (request()->routeIs('admin.admin_management.registered_admins')) show @endif">
                            <ul class="nav nav-collapse">
                                <li
                                    class="@if (request()->routeIs('admin.admin_management.role_permissions')) active 
                  @elseif (request()->routeIs('admin.admin_management.role.permissions')) active @endif">
                                    <a href="{{ route('admin.admin_management.role_permissions') }}">
                                        <span class="sub-item">{{ 'Role & Permissions' }}</span>
                                    </a>
                                </li>

                                <li
                                    class="{{ request()->routeIs('admin.admin_management.registered_admins') ? 'active' : '' }}">
                                    <a href="{{ route('admin.admin_management.registered_admins') }}">
                                        <span class="sub-item">{{ 'Registered Admins' }}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                {{-- language --}}
                @if (is_null($roleInfo) || (!empty($rolePermissions) && in_array('Language Management', $rolePermissions)))
                    <li
                        class="nav-item @if (request()->routeIs('admin.language_management')) active 
            @elseif (request()->routeIs('admin.language_management.edit_keyword')) active @endif">
                        <a href="{{ route('admin.language_management') }}">
                            <i class="fal fa-language"></i>
                            <p>{{ 'Language Management' }}</p>
                        </a>
                    </li>
                @endif
            </ul>
        </div>
    </div>
</div>
