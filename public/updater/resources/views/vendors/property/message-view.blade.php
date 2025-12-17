<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">{{ __('Message Details') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">  
                
                <div class="row no-gutters">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="">{{ __('Name') }}</label>
                            <input type="text" id="in_name" class="form-control" readonly>
                            <p id="editErr_username" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="">{{ __('Phone') }}</label>
                            <input type="text" id="in_phone" class="form-control" readonly>
                            <p id="editErr_first_name" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    </div>

                </div>

                <div class="row no-gutters">


                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="">{{ __('Email') }}</label>
                            <input type="email" id="in_email" class="form-control" name="email" readonly>
                            <p id="editErr_email" class="mt-2 mb-0 text-danger em"></p>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="">{{ __('Message') }}</label>
                            <textarea rows="4" readonly class="form-control" id="in_message"></textarea>

                        </div>
                    </div>
                </div> 
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
