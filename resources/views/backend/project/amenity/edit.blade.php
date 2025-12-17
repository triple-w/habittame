<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">{{ __('Edit Amenity') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="ajaxEditForm" class="modal-form"
                    action="{{ route('admin.project_management.update_amenity') }}" method="post">
                    @csrf
                    <input type="hidden" id="in_id" name="id">
                    <input type="hidden" id="in_index" name="index">
                    <div class="form-group">
                        <label for="">{{ __('Icon') . '*' }}</label>
                        <div class="btn-group d-block">
                            <button type="button" class="btn btn-primary iconpicker-component iconpicker-upd"><i
                                    class="{{ $counterInformation->icon ?? 'fa fa-fw fa-heart' }}"></i></button>
                            <button type="button" class="icp icp-dd  btn btn-primary dropdown-toggle"
                                data-selected="fa-car" data-toggle="dropdown"></button>
                            <div class="dropdown-menu"></div>
                        </div>
                        <input type="hidden" id="in_icon" name="icon">
                        <p id="editErr_icon" class="mt-1 mb-0 text-danger em"></p>
                        <div class="text-warning mt-2">
                            <small>{{ __('Click on the dropdown icon to select a icon.') }}</small>
                        </div>
                    </div> 

                    @foreach ($langs as $lan)
                        <div class="form-group {{ $lan->direction == 1 ? 'rtl text-right' : '' }}">
                            <label for="">{{ __('Name') . '*' }} ({{ $lan->name }})</label>
                            <input type="text" id="in_{{ $lan->code }}_name" class="form-control"
                                name="{{ $lan->code }}_name" placeholder="Enter aminity name">
                            <p id="editErr_{{ $lan->code }}_name" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    @endforeach

                    <div class="form-group">
                        <label for="">{{ __('Status') . '*' }}</label>
                        <select name="status" id="in_status" class="form-control">
                            <option disabled>{{ __('Select Status') }}</option>
                            <option value="1">{{ __('Active') }}</option>
                            <option value="0">{{ __('Deactive') }}</option>
                        </select>
                        <p id="editErr_status" class="mt-2 mb-0 text-danger em"></p>
                    </div>

                    <div class="form-group">
                        <label for="">{{ __('Serial Number') . '*' }}</label>
                        <input type="number" id="in_serial_number" class="form-control ltr" name="serial_number"
                            placeholder="Enter Serial Number">
                        <p id="editErr_serial_number" class="mt-2 mb-0 text-danger em"></p>
                        <p class="text-warning mt-2 mb-0">
                            <small>{{ __('The higher the serial number is, the later the brand will be shown.') }}</small>
                        </p>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">
                    {{ __('Close') }}
                </button>
                <button id="updateBtn" type="button" class="btn btn-primary btn-sm">
                    {{ __('Update') }}
                </button>
            </div>
        </div>
    </div>
</div>
