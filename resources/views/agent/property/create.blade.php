@extends('agent.layout')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Agregar Propiedad') }}</h4>
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
                <a href="#">{{ __('Porperty Management') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Agregar Propiedad') }}
                    @if (request('type') == 'residential')
                        {{ '(Residential)' }}
                    @else
                        {{ '(Commercial)' }}
                    @endif
                </a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title d-inline-block">{{ __('Agregar Propiedad') }}</div>
                </div>

                <div class="card-body">
                    <div class="row">
                        @if ($agent->vendor_id != 0)
                            <div class="col-lg-10 offset-lg-1">
                                <div class="alert alert-warning">
                                    {{ __('You can upload maximum ' . $currentPackage->number_of_property_gallery_images . ' gallery images under one property') }}
                                </div>
                            </div>
                        @endif
                        <div class="col-lg-10 offset-lg-1">
                            <div class="alert alert-danger pb-1 dis-none" id="carErrors">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <ul></ul>
                            </div>
                            <div class="col-lg-12">
                                <label for="" class="mb-2"><strong>{{ __('Galeria de Imagenes') }} **</strong></label>
                                <form action="{{ route('agent.property.imagesstore') }}" id="my-dropzone"
                                    enctype="multipart/form-data" class="dropzone create">
                                    @csrf
                                    <div class="fallback">
                                        <input name="file" type="file" multiple />
                                    </div>
                                </form>
                                <p class="em text-danger mb-0" id="errslider_images"></p>
                            </div>


                            <form id="carForm"
                                action=" {{ $agent->vendor_id != 0 ? route('agent.property_management.store_property') : route('agent.admin.property_management.store_property') }} "
                                method="POST" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="type" value="{{ request()->type }}">
                                <div id="sliders"></div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="">{{ __('Imagen Principal') . '*' }}</label>
                                            <br>
                                            <div class="thumb-preview ">
                                                <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                    class="uploaded-img">
                                            </div>

                                            <div class="mt-3">
                                                <div role="button" class="btn btn-primary btn-sm upload-btn">
                                                    {{ __('Elegir Imagen') }}
                                                    <input type="file" class="img-input" name="featured_image">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="">{{ __('Imagen de Planos') }}</label>
                                            <br>
                                            <div class="thumb-preview remove">
                                                <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                    class="uploaded-img2">
                                            </div>

                                            <div class="mt-3">
                                                <div role="button" class="btn btn-primary btn-sm upload-btn">
                                                    {{ __('Elegir Imagen') }}
                                                    <input type="file" class="img-input2" name="floor_planning_image">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="">{{ __('Imagen de Video') }}</label>
                                            <br>
                                            <div class="thumb-preview remove">
                                                <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..."
                                                    class="uploaded-img3">
                                            </div>

                                            <div class="mt-3">
                                                <div role="button" class="btn btn-primary btn-sm upload-btn">
                                                    {{ __('Elegir Imagen') }}
                                                    <input type="file" class="img-input3" name="video_image">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Video Url') }} </label>
                                            <input type="text" class="form-control" name="video_url"
                                                placeholder="Enter video url">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Proposito') }}*</label>

                                            <select name="purpose" class="form-control">
                                                <option selected disabled value=""> {{ __('Select a Purpose') }} </option>
                                                <option value="rent">{{ __('Rentar') }}</option>
                                                <option value="sale">{{ __('Vender') }}</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group ">
                                            <label>{{ __('Categoria') }} *</label>
                                            <select name="category_id" class="form-control category">
                                                <option disabled selected>
                                                    {{ __('Select a Category') }}
                                                </option>

                                                @foreach ($propertyCategories as $category)
                                                    <option value="{{ $category->id }}">
                                                        {{ $category->categoryContent->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    @if ($settings->property_country_status == 1)
                                        <div class="col-lg-3">
                                            <div class="form-group">


                                                <label>{{ __('País') }} *</label>
                                                <select name="country_id"
                                                    class="form-control country js-example-basic-single3">
                                                    <option disabled selected>{{ __('Select Country') }}
                                                    </option>

                                                    @foreach ($propertyCountries as $country)
                                                        <option value="{{ $country->id }}">
                                                            {{ $country->countryContent->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    @endif
                                    @if ($settings->property_state_status == 1)
                                        <div class="col-lg-3 state">
                                            <div class="form-group  ">

                                                <label>{{ __('Estado') }} *</label>
                                                <select onchange="getCities(event)" name="state_id"
                                                    class="form-control state_id states js-example-basic-single3">
                                                    <option selected disabled>{{ __('Select State') }}
                                                    </option>
                                                    @foreach ($states as $state)
                                                        <option value="{{ $state->id }}">
                                                            {{ $state->stateContent->name }}</option>
                                                    @endforeach

                                                </select>
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-lg-3 city">
                                        <div class="form-group ">


                                            <label>{{ __('Ciudad') }} *</label>
                                            <select name="city_id" class="form-control city_id js-example-basic-single3">
                                                <option selected disabled>{{ __('Select City') }}
                                                </option>
                                                @if ($settings->property_state_status == 0 && $settings->property_country_status == 0)
                                                    @foreach ($cities as $city)
                                                        <option value="{{ $city->id }}">
                                                            {{ $city->cityContent->name }}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">{{ __('Amenidades') }}*</label>
                                            <select name="amenities[]" class="form-control js-example-basic-single2"
                                                multiple="multiple">
                                                <option value="" disabled>
                                                    {{ __('Please Select Amenities') }}
                                                </option>
                                                @foreach ($amenities as $amenity)
                                                    <option value="{{ $amenity->id }}">
                                                        {{ $amenity->amenityContent->name }}</option>
                                                @endforeach
                                            </select>

                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Precio') . ' (' . $settings->base_currency_text . ')' }} </label>
                                            <input type="number" class="form-control" name="price"
                                                placeholder="Enter Current Price">

                                            <p class="text-warning">
                                                {{ __('If you leave it blank, price will be negotiable.') }}
                                            </p>
                                        </div>
                                    </div>

                                    @if (request('type') == 'residential')
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>{{ __('Habitaciones') }} *</label>
                                                <input type="text" class="form-control" name="beds"
                                                    placeholder="Enter number of bed">
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>{{ __('Baños') }} *</label>
                                                <input type="text" class="form-control" name="bath"
                                                    placeholder="Enter number of bath">
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Metros (terreno)') }} *</label>
                                            <input type="text" class="form-control" name="area"
                                                placeholder="Enter area (sqft) ">
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Status') }} *</label>
                                            <select name="status" id="" class="form-control">
                                                <option value="1">{{ __('Active') }}</option>
                                                <option value="0">{{ __('Inactive') }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Latitude') }} *</label>
                                            <input type="text" class="form-control" name="latitude" id="latitude"
                                                placeholder="Enter Latitude">
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>{{ __('Longitude') }} *</label>
                                            <input type="text" class="form-control" name="longitude" id="longitude"
                                                placeholder="Enter Longitude">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group mt-3">
                                            <label>{{ __('Ubicacion de la propiedad') }}</label>
                                            <input type="text" class="form-control mb-2"
                                                id="property_address_autocomplete"
                                                placeholder="Busca una direccion, colonia o punto de referencia">
                                            <div id="map" style="width:100%; height:400px; border-radius:8px;"></div>
                                            <small class="text-muted">
                                                Da click en el mapa o mueve el pin para ajustar la ubicacion.
                                            </small>
                                        </div>
                                    </div>
                                </div>

                                <div id="accordion" class="mt-3">
                                    @foreach ($languages as $language)
                                        <div class="version">
                                            <div class="version-header" id="heading{{ $language->id }}">
                                                <h5 class="mb-0">
                                                    <button type="button" class="btn btn-link" data-toggle="collapse"
                                                        data-target="#collapse{{ $language->id }}"
                                                        aria-expanded="{{ $language->is_default == 1 ? 'true' : 'false' }}"
                                                        aria-controls="collapse{{ $language->id }}">
                                                        {{ $language->name . __(' Language') }}
                                                        {{ $language->is_default == 1 ? '(Default)' : '' }}
                                                    </button>
                                                </h5>
                                            </div>

                                            <div id="collapse{{ $language->id }}"
                                                class="collapse {{ $language->is_default == 1 ? 'show' : '' }}"
                                                aria-labelledby="heading{{ $language->id }}" data-parent="#accordion">
                                                <div class="version-body">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Titulo') }} *</label>
                                                                <input type="text" class="form-control"
                                                                    name="{{ $language->code }}_title"
                                                                    placeholder="Enter Title">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Address') . '*' }}</label>
                                                                <input type="text"
                                                                    name="{{ $language->code }}_address"
                                                                    class="form-control" placeholder="Enter Address"
                                                                    @if ($language->is_default == 1) data-default-address="1" @endif>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Descripción') }} *</label>
                                                                <textarea id="{{ $language->code }}_description" class="form-control summernote"
                                                                    name="{{ $language->code }}_description" data-height="300"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Palabras Clave Meta *Esto mejora tu busqueda en Google(despues de escibir cada palabra da ENTER)') }}</label>
                                                                <input class="form-control"
                                                                    name="{{ $language->code }}_meta_keyword"
                                                                    placeholder="Ej. Casa Renta Leon Gran Jardin "
                                                                    data-role="tagsinput">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <label>{{ __('Descripcion Meta') }}</label>
                                                                <textarea class="form-control" name="{{ $language->code }}_meta_description" rows="5"
                                                                    placeholder="Escribe una Descripcion como crees que tu cliente buscaria esta casa, Esto ayuda a los buscadores para que te encuentren mas facil"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            @php $currLang = $language; @endphp

                                                            @foreach ($languages as $language)
                                                                @continue($language->id == $currLang->id)

                                                                <div class="form-check py-0">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            onchange="cloneInput('collapse{{ $currLang->id }}', 'collapse{{ $language->id }}', event)">
                                                                        <span
                                                                            class="form-check-sign">{{ __('Clonar para') }}
                                                                            <strong
                                                                                class="text-capitalize text-secondary">{{ $language->name }}</strong>
                                                                            {{ __('*En caso de no necesitar textos en otro idioma') }}</span>
                                                                    </label>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>

                                <div class="row">
                                    <div class="col-lg-12" id="variation_pricing">
                                        <h4 for="">{{ __('Caracteristicas Especiales (Optional)') }}</h4>
                                        @if ($agent->vendor_id != 0)
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="alert alert-warning">
                                                        {{ __('You can add maximum ' . $currentPackage->number_of_property_adittionl_specifications . ' additional features under one property') }}
                                                    </div>
                                                </div>
                                            </div>
                                        @endif
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>{{ __('Nombre (ej. Mascotas)') }}</th>
                                                    <th>{{ __('Valor (ej. Si o NO)') }}</th>
                                                    <th><a href="" class="btn btn-sm btn-success addRow"><i
                                                                class="fas fa-plus-circle"></i></a></th>
                                                </tr>
                                            <tbody id="tbody">
                                                <tr>
                                                    <td>
                                                        @foreach ($languages as $language)
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <input type="text"
                                                                    name="{{ $language->code }}_label[]"
                                                                    class="form-control"
                                                                    placeholder="Label ({{ $language->name }})">
                                                            </div>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        @foreach ($languages as $language)
                                                            <div
                                                                class="form-group {{ $language->direction == 1 ? 'rtl text-right' : '' }}">
                                                                <input type="text"
                                                                    name="{{ $language->code }}_value[]"
                                                                    class="form-control"
                                                                    placeholder="Value ({{ $language->name }})">
                                                            </div>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        <a href="javascript:void(0)"
                                                            class="btn btn-danger  btn-sm deleteRow">
                                                            <i class="fas fa-minus"></i></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            </thead>
                                        </table>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="submit" id="PropertySubmit" class="btn btn-success">
                                {{ __('Save') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@php
    $languages = App\Models\Language::get();
    $labels = '';
    $values = '';
    foreach ($languages as $language) {
        $label_name = $language->code . '_label[]';
        $value_name = $language->code . '_value[]';
        if ($language->direction == 1) {
            $direction = 'form-group rtl text-right';
        } else {
            $direction = 'form-group';
        }

        $labels .=
            "<div class='$direction'><input type='text' name='" .
            $label_name .
            "' class='form-control' placeholder='Label ($language->name)'></div>";
        $values .= "<div class='$direction'><input type='text' name='$value_name' class='form-control' placeholder='Value ($language->name)'></div>";
    }
@endphp

@section('script')
    <script>
        'use strict';
        var labels = "{!! $labels !!}";
        var values = "{!! $values !!}";
        var storeUrl =
            "{{ $agent->vendor_id != 0 ? route('agent.property.imagesstore') : route('agent.admin.property.imagesstore') }}";
        var removeUrl = "{{ route('agent.property.imagermv') }}";
        var stateUrl = "{{ route('agent.property_specification.get_state_cities') }}";
        let cityUrl = "{{ route('agent.property_specification.get_cities') }}";
        var galleryImages = {{ $agent->vendor_id != 0 ? $currentPackage->number_of_property_gallery_images : 999999 }};
    </script>
    <script>
        let map;
        let marker;
        let autocomplete;

        function initMap() {
            const latInput = document.getElementById("latitude");
            const lngInput = document.getElementById("longitude");
            const defaultPosition = {
                lat: 21.1226, // Leon, GTO
                lng: -101.6866
            };

            let startLat = parseFloat(latInput.value);
            let startLng = parseFloat(lngInput.value);
            if (Number.isNaN(startLat) || Number.isNaN(startLng)) {
                startLat = defaultPosition.lat;
                startLng = defaultPosition.lng;
            }

            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 14,
                center: { lat: startLat, lng: startLng },
            });

            marker = new google.maps.Marker({
                position: { lat: startLat, lng: startLng },
                map: map,
                draggable: true,
            });

            setLatLng(startLat, startLng);

            map.addListener("click", function (event) {
                marker.setPosition(event.latLng);
                setLatLng(event.latLng.lat(), event.latLng.lng());
            });

            marker.addListener("dragend", function (event) {
                setLatLng(event.latLng.lat(), event.latLng.lng());
            });

            const addressInput = document.getElementById("property_address_autocomplete");
            if (addressInput) {
                autocomplete = new google.maps.places.Autocomplete(addressInput, {
                    fields: ["geometry", "formatted_address"],
                });

                autocomplete.addListener("place_changed", function () {
                    const place = autocomplete.getPlace();
                    if (!place.geometry || !place.geometry.location) {
                        return;
                    }

                    const location = place.geometry.location;
                    marker.setPosition(location);
                    map.panTo(location);
                    map.setZoom(16);
                    setLatLng(location.lat(), location.lng());

                    const defaultAddress = document.querySelector('[data-default-address="1"]');
                    if (defaultAddress && place.formatted_address) {
                        defaultAddress.value = place.formatted_address;
                    }
                });
            }
        }

        function setLatLng(lat, lng) {
            if (document.getElementById("latitude")) {
                document.getElementById("latitude").value = lat;
            }
            if (document.getElementById("longitude")) {
                document.getElementById("longitude").value = lng;
            }
        }
    </script>
    <script type="text/javascript" src="{{ asset('assets/js/admin-dropzone.js') }}"></script>
    <script src="{{ asset('assets/js/property.js') }}"></script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVHSZ0rqp7Euat465O5bQ0uGMGBwOnRoE&libraries=places&callback=initMap"></script>
@endsection
