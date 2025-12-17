@extends('vendors.layout')

@section('content')
    <div class="page-header">
        <h4 class="page-title">{{ __('Agents') }}</h4>
        <ul class="breadcrumbs">
            <li class="nav-home">
                <a href="{{ route('vendor.dashboard') }}">
                    <i class="flaticon-home"></i>
                </a>
            </li>
            <li class="separator">
                <i class="flaticon-right-arrow"></i>
            </li>
            <li class="nav-item">
                <a href="#">{{ __('Agents') }}</a>
            </li>


        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card-title d-inline-block">{{ __('All Agents') }}</div>
                            <span>{{ __('(Login Url:') }} <a target="_blank"
                                    href="{{ route('agent.login') }}">{{ route('agent.login') }}</a>{{ ')' }}</span>
                        </div>

                        <div class="col-lg-6 mt-2 mt-lg-0">
                            <a href="#" data-toggle="modal" data-target="#createModal"
                                class="btn btn-primary btn-sm float-lg-right float-left"><i class="fas fa-plus"></i>
                                {{ __('Add Agent') }}</a>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">

                            @if (count($agents) == 0)
                                <h3 class="text-center mt-2">{{ __('NO AGENTS FOUND') . '!' }}</h3>
                            @else
                                <div class="table-responsive">
                                    <table class="table table-striped mt-3" id="basic-datatables">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">{{ __('Profile Picture') }}</th>
                                                <th scope="col">{{ __('Username') }}</th>
                                                <th scope="col">{{ __('Email ID') }}</th>
                                                <th scope="col">{{ __('Status') }}</th>
                                                <th scope="col">{{ __('Actions') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($agents as $agent)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        <img src="{{ asset('assets/img/agents/' . $agent->image) }}"
                                                            alt="admin image" width="45">
                                                    </td>
                                                    <td>{{ $agent->username }}</td>
                                                    <td>{{ $agent->email }}</td>

                                                    <td>
                                                        <form id="statusForm-{{ $agent->id }}" class="d-inline-block"
                                                            action="{{ route('vendor.agent_management.change_status', ['id' => $agent->id]) }}"
                                                            method="post">
                                                            @csrf
                                                            <select
                                                                class="form-control form-control-sm {{ $agent->status == 1 ? 'bg-success' : 'bg-danger' }}"
                                                                name="status"
                                                                onchange="document.getElementById('statusForm-{{ $agent->id }}').submit()">
                                                                <option value="1"
                                                                    {{ $agent->status == 1 ? 'selected' : '' }}>
                                                                    {{ __('Active') }}
                                                                </option>
                                                                <option value="0"
                                                                    {{ $agent->status == 0 ? 'selected' : '' }}>
                                                                    {{ __('Deactive') }}
                                                                </option>
                                                            </select>
                                                        </form>
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



                                                                <a class="dropdown-item editBtn" href="#"
                                                                    data-toggle="modal" data-target="#editModal"
                                                                    data-id="{{ $agent->id }}"
                                                                    data-role_id="{{ $agent->role_id }}"
                                                                    data-first_name="{{ $agent->first_name }}"
                                                                    data-last_name="{{ $agent->last_name }}"
                                                                    data-image="{{ asset('assets/img/agents/' . $agent->image) }}"
                                                                    data-username="{{ $agent->username }}"
                                                                    data-email="{{ $agent->email }}">

                                                                    {{ __('Edit') }}

                                                                </a>
                                                                <form class="deleteForm d-block"
                                                                    action="{{ route('vendor.agent_management.destroy', ['id' => $agent->id]) }}"
                                                                    method="post">
                                                                    @csrf
                                                                    <button type="submit" class="deleteBtn">
                                                                        {{ __('Delete') }}
                                                                    </button>
                                                                </form>
                                                                <a target="_blank"
                                                                    href="{{ route('vendor.agent_management.secret_login', ['id' => $agent->id]) }}"
                                                                    class="dropdown-item">
                                                                    {{ __('Secret Login') }}
                                                                </a>
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

                <div class="card-footer"></div>
            </div>
        </div>
    </div>

    {{-- create modal --}}
    @include('vendors.agent.create')

    {{-- edit modal --}}
    @include('vendors.agent.edit')
@endsection
