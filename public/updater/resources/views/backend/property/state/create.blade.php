<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">{{ __('Add State') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="ajaxForm" class="modal-form create"
                    action="{{ route('admin.property_specification.store_state') }}" method="post"
                    enctype="multipart/form-data">
                    @csrf
                    @if ($settings->property_country_status == 1)
                        <div class="form-group">
                            <label for="">{{ __('Country') . '*' }}</label>
                            <select name="country" class="form-control">
                                <option selected disabled>{{ __('Select a Country') }}</option>
                                @foreach ($countries as $country)
                                    <option value="{{ $country->id }}">{{ $country->countryContent->name }}</option>
                                @endforeach
                            </select>
                            <p id="err_country" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    @endif

                    @foreach ($langs as $lang)
                        <div class="form-group {{ $lang->direction == 1 ? 'rtl text-right' : '' }}">
                            <label for="">{{ __('State Name') . ' *' }} ({{ $lang->name }})</label>
                            <input type="text" class="form-control" name="{{ $lang->code }}_name"
                                placeholder="Enter state name">
                            <p id="err_{{ $lang->code }}_name" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    @endforeach

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
