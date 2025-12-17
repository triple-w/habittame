<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">{{ __('Add City') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="ajaxForm" class="modal-form create"
                    action="{{ route('admin.property_specification.store_city') }}" method="post"
                    enctype="multipart/form-data">
                    @csrf

                    @if ($settings->property_country_status == 1)
                        <div class="form-group">
                            <label for="">{{ __('Country') . '*' }}</label>
                            <select name="country" class="form-control" id="country">
                                <option selected disabled>{{ __('Select a Country') }}</option>
                                @foreach ($countries as $country)
                                    <option value="{{ $country->id }}">{{ $country->countryContent?->name }}</option>
                                @endforeach
                            </select>
                            <p id="err_country" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    @endif
                    @if ($settings->property_state_status == 1)
                        <div class="form-group" id="state">
                            <label for="">{{ __('State') . '*' }}</label>
                            <select name="state" class="form-control js-example-basic-single3">
                                <option selected disabled value="">{{ __('Select a State') }}</option>
                                @foreach ($states as $state)
                                    <option value="{{ $state->id }}">{{ $state->stateContent?->name }} </option>
                                @endforeach

                            </select>
                            <p id="err_state" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    @endif
                    <div class="form-group">
                        <label for="">{{ __('Image') . '*' }}</label>
                        <br>
                        <div class="thumb-preview">
                            <img src="{{ asset('assets/img/noimage.jpg') }}" alt="..." class="uploaded-img">
                        </div>

                        <div class="mt-3">
                            <div role="button" class="btn btn-primary btn-sm upload-btn">
                                {{ __('Choose Image') }}
                                <input type="file" class="img-input" name="image">
                            </div>
                        </div>

                        <p id="err_image" class=" mb-0 text-danger em"></p>
                    </div>
                    @foreach ($langs as $lang)
                        <div class="form-group {{ $lang->direction == 1 ? 'rtl text-right' : '' }}">
                            <label for="">{{ __('Name') . '*' }} ({{ $lang->name }})</label>
                            <input type="text" class="form-control" name="{{ $lang->code }}_name"
                                placeholder="Enter city name">
                            <p id="err_{{ $lang->code }}_name" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    @endforeach
                    <div class="form-group">
                        <label for="">{{ __('Status') . '*' }}</label>
                        <select name="status" class="form-control">
                            <option selected disabled>{{ __('Select City Status') }}</option>
                            <option value="1">{{ __('Active') }}</option>
                            <option value="0">{{ __('Deactive') }}</option>
                        </select>
                        <p id="err_status" class="mt-2 mb-0 text-danger em"></p>
                    </div>

                    <div class="form-group">
                        <label for="">{{ __('Serial Number') . '*' }}</label>
                        <input type="number" class="form-control ltr" name="serial_number"
                            placeholder="Enter Serial Number">
                        <p id="err_serial_number" class="mt-2 mb-0 text-danger em"></p>
                        <p class="text-warning mt-2 mb-0">
                            <small>{{ __('The higher the serial number is, the later the city will be shown.') }}</small>
                        </p>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">
                    {{ __('Close') }}
                </button>
                <button id="submitBtn" type="button" class="btn btn-primary btn-sm">
                    {{ __('Save') }}
                </button>
            </div>
        </div>
    </div>
</div>
