 <div {{ $attributes }}>
     <div class="product-default radius-md mb-30" {{ $animation ? 'data-aos="fade-up" data-aos-delay="100"' : '' }}>
         <figure class="product-img">
             <a href="{{ route('frontend.property.details', ['slug' => $property->slug ?? $property->propertyContent->slug]) }}"
                 class="lazy-container ratio ratio-1-1">
                 <img class="lazyload" src="assets/images/placeholder.png"
                     data-src="{{ asset('assets/img/property/featureds/' . $property->featured_image) }}">
             </a>
         </figure>
         <div class="product-details">
             <div class="d-flex align-items-center justify-content-between mb-10">
                 <div class="author  ">

                     @if ($property->agent)
                         <a class="color-medium"
                             href="{{ route('frontend.agent.details', ['username' => $property->agent->username]) }}"
                             target="_self">

                             <img class="blur-up ls-is-cached lazyloaded"
                                 data-src="{{ $property->agent->image ? asset('assets/img/agents/' . $property->agent->image) : asset('assets/img/blank-user.jpg') }}"
                                 src="{{ $property->agent->image ? asset('assets/img/agents/' . $property->agent->image) : asset('assets/img/blank-user.jpg') }}">
                             <span>{{ __('By') }} {{ $property->agent->username }}</span>
                         @elseif ($property->vendor)
                             <a class="color-medium"
                                 href="{{ route('frontend.vendor.details', ['username' => $property->vendor->username]) }}"
                                 target="_self">

                                 <img class="blur-up ls-is-cached lazyloaded"
                                     data-src="{{ $property->vendor->photo ? asset('assets/admin/img/vendor-photo/' . $property->vendor->photo) : asset('assets/img/blank-user.jpg') }}"
                                     src="{{ $property->vendor->photo ? asset('assets/admin/img/vendor-photo/' . $property->vendor->photo) : asset('assets/img/blank-user.jpg') }}">
                                 <span>{{ __('By') }} {{ $property->vendor->username }}</span>
                             @elseif($property->vendor_id == 0)
                                 @php
                                     $admin = App\Models\Admin::where('role_id', null)->with('adminInfo')->first();
                                 @endphp
                                 <a class="color-medium"
                                     href="{{ route('frontend.vendor.details', ['username' => $admin->username, 'admin' => 'true']) }}"
                                     target="_self">

                                     <img class="blur-up ls-is-cached lazyloaded"
                                         data-src="{{ $admin->image ? asset('assets/img/admins/' . $admin->image) : asset('assets/img/blank-user.jpg') }}"
                                         src="{{ $admin->image ? asset('assets/img/admins/' . $admin->image) : asset('assets/img/blank-user.jpg') }}">
                                     <span>{{ __('By') }} {{ $admin->username }}</span>
                     @endif

                     </a>
                 </div>

                 <span class="product-category text-sm">{{ __(ucfirst($property->type)) }}</span>

             </div>
             <h3 class="product-title">
                 <a
                     href="{{ route('frontend.property.details', $property->slug ?? $property->propertyContent->slug) }}">{{ $property->title ?? $property->propertyContent->title }}</a>
             </h3>

             <span class="product-location icon-start"> <i class="fal fa-map-marker-alt"></i>
                 {{ $property->city->getContent($property->language_id)?->name }}
                 {{ $property->isStateActive ? ', ' . $property->state?->getContent($property->language_id)?->name : '' }}
                 {{ $property->isCountryActive ? ', ' . $property->country?->getContent($property->language_id)?->name : '' }}
             </span>
             <div class="product-price">
                 <span class="new-price">{{ __('Price:') }}
                     {{ $property->price ? symbolPrice($property->price) : __('Negotiable') }}</span>
             </div>
             <ul class="product-info p-0 list-unstyled d-flex align-items-center">
                 <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top" title="{{ __('Area') }}">
                     <i class="fal fa-vector-square"></i>
                     <span>{{ $property->area }} {{ __('Sqft') }}</span>
                 </li>
                 @if ($property->type == 'residential')
                     <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top" title="{{ __('Beds') }}">
                         <i class="fal fa-bed"></i>
                         <span>{{ $property->beds }} {{ __('Beds') }}</span>
                     </li>
                     <li class="icon-start" data-tooltip="tooltip" data-bs-placement="top" title="{{ __('Baths') }}">
                         <i class="fal fa-bath"></i>
                         <span>{{ $property->bath }} {{ __('Baths') }}</span>
                     </li>
                 @endif
             </ul>
         </div>
         <span class="label">{{ __(ucfirst($property->purpose)) }}</span>
         @if (Auth::guard('web')->check())
             @php
                 $user_id = Auth::guard('web')->user()->id;
                 $checkWishList = checkWishList($property->id, $user_id);
             @endphp
         @else
             @php
                 $checkWishList = false;
             @endphp
         @endif
         <a href="{{ $checkWishList == false ? route('addto.wishlist', $property->id) : route('remove.wishlist', $property->id) }}"
             class="btn-wishlist {{ $checkWishList == false ? '' : 'wishlist-active' }}" data-tooltip="tooltip"
             data-bs-placement="top" title="{{ $checkWishList == false ? __('Add to Wishlist') : __('Saved') }}">
             <i class="fal fa-heart"></i>
         </a>
     </div><!-- product-default -->
 </div>
