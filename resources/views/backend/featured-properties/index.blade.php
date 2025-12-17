@extends('backend.layout')

@includeIf('backend.partials.rtl_style')
@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Feature Properties') }}</h4>
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
                <a href="#">{{ __('Feature Properties') }}</a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Pricing') }}</a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-6">
                            <div class="card-title d-inline-block">{{ __(' Pricing') }}</div>
                        </div>
                        <div class="col-6  ">
                            <a href="#" class="btn btn-primary float-right btn-sm" data-toggle="modal"
                                data-target="#createModal"><i class="fas fa-plus"></i>
                                {{ __('Add Pricing') }}</a>
                             
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            @if (count($featuredPricing) == 0)
                                <h3 class="text-center">{{ __('NO PRICING FOUND YET') }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3" id="basic-datatables">
                                        <thead>
                                            <tr>


                                                <th scope="col">{{ __('Number of Days') }}</th>
                                                <th scope="col">{{ __('Cost') }}</th>
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($featuredPricing as $key => $pricing)
                                                <tr>


                                                    <td> {{ $pricing->number_of_days }} </td>
                                                    <td> {{ symbolPrice($pricing->price) }} </td>
                                                    <td>
                                                        @if ($pricing->status == 1)
                                                            <h2 class="d-inline-block">
                                                                <span
                                                                    class="badge badge-success">{{ __('Active') }}</span>
                                                            </h2>
                                                        @else
                                                            <h2 class="d-inline-block">
                                                                <span
                                                                    class="badge badge-danger">{{ __('Inactive') }}</span>
                                                            </h2>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle btn-sm"
                                                                type="button" id="dropdownMenuButton"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                                {{ __('Select') }}
                                                            </button>

                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                                                <a class="dropdown-item"
                                                                    href="{{ route('admin.featured_pricing.edit', $pricing->id) . '?language=' . request()->input('language') }}">
                                                                    <span class="btn-label">
                                                                        <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                    </span>
                                                                </a>
                                                                <form class="deleteForm d-inline-block dropdown-item"
                                                                    action="{{ route('admin.featured_pricing.delete') }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <input type="hidden" name="pricing_id"
                                                                        value="{{ $pricing->id }}">
                                                                    <button type="submit" class="btn p-0 deleteBtn">
                                                                        <span class="btn-label">
                                                                            <i class="fas fa-trash-alt"></i>
                                                                            {{ __('Delete') }}
                                                                        </span>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Create Blog Modal -->
    <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">{{ __('Add Pricing') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="ajaxForm" enctype="multipart/form-data" class="modal-form"
                        action="{{ route('admin.featured_pricing.store') }}" method="POST">
                        @csrf



                        <div class="form-group">
                            <label class="form-label">{{ __('Number Of Days') }}
                                *</label>
                            <input type="text" name="number_of_days" class="form-control"
                                placeholder="{{ __('Enter how many properties does the vendor make featured') }}">
                            <p id="err_number_of_days" class="mb-0 text-danger em"></p>
                        </div>

                        <div class="form-group">
                            <label for="price">{{ __('Price') }} ({{ $settings->base_currency_text }})*</label>
                            <input id="price" type="number" class="form-control" name="price"
                                placeholder="{{ __('Enter featured price') }}" value="">
                            <p class="text-warning mb-0">
                                <small>{{ __('If price is 0 , than it will appear as free') }}</small>
                            </p>
                            <p id="err_price" class="mb-0 text-danger em"></p>
                        </div>



                        <div class="form-group">
                            <label for="status">{{ __('Status') }}*</label>
                            <select id="status" class="form-control ltr" name="status">
                                <option value="" selected disabled>{{ __('Select a status') }}</option>
                                <option value="1">{{ __('Active') }}</option>
                                <option value="0">{{ __('Inactive') }}</option>
                            </select>
                            <p id="err_status" class="mb-0 text-danger em"></p>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
                    <button id="submitBtn" type="button" class="btn btn-primary">{{ __('Submit') }}</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/packages.js') }}"></script>
@endsection
