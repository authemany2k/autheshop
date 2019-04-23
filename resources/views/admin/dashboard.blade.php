@extends('layouts.admin.app')

@section('content')


    <!-- Content Header (Page header) -->
    <section class="content-header" xmlns="http://www.w3.org/1999/html">
        {{--@role(('super-admin'))--}}
        <h1>
            Super Admin
            <small>Dashboard</small>
        </h1>
        {{--@endrole--}}
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            {{--@role(('superadmin'))--}}
            {{--@permission(('view-dashboard'))--}}
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <a href="{{ route('admin.products.create') }}"><span class="info-box-icon bg-blue">
                            <i  class="fa fa-plus"></i></span></a>
                    <div class="info-box-content">
                        <span class="info-box-text">Add New<br>Product</span>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <a href="{{ route('admin.categories.create') }}"><span class="info-box-icon bg-blue">
                            <i class="fa fa-plus"></i></span></a>
                    <div class="info-box-content">
                        <span class="info-box-text">Add New<br>Category</span>
                    </div>
                </div>
            </div>

            @role(('superadmin'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <a href="{{ route('admin.customers.create') }}"><span class="info-box-icon bg-blue">
                            <i class="fa fa-plus"></i></span></a>
                    <div class="info-box-content">
                        <span class="info-box-text">Add New<br>Customer</span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <a href="{{ route('admin.addresses.create') }}"><span class="info-box-icon bg-blue">
                            <i class="fa fa-plus"></i></span></a>
                    <div class="info-box-content">
                        <span class="info-box-text">Add New<br>Address</span>
                    </div>
                </div>
            </div>
            {{--@endpermission--}}
            {{--@endrole--}}
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Employee Management</h3>
                    </div>
                    <div class="box-body">

                        <a href="{{url('admin/employees')}}" class="btn btn-app">
                            <i class="fa fa-group"></i> Employees
                        </a>
                    </div>
                </div>
            </div>


            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Roles</h3>
                    </div>
                    <div class="box-body">
                        <a href="{{url('admin/roles')}}" class="btn btn-app">
                        {{--<a href="#" class="btn btn-app">--}}
                            <i class="fa fa-bolt"></i> Roles
                        </a>
                    </div>
                </div>
            </div>


            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Permissions</h3>
                    </div>
                    <div class="box-body">
                        <a href="{{url('admin/permissions')}}" class="btn btn-app">
                        {{--<a href="#" class="btn btn-app">--}}
                            <i class="fa fa-check"></i> Permissions
                        </a>
                    </div>
                </div>
            </div>


            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Other Settings</h3>
                    </div>
                    <div class="box-body">

                        <a href="#" class="btn btn-app">
                            <i class="fa fa-check"></i> Other Settings
                        </a>
                    </div>
                </div>
            </div>
@endrole

        </div>


    </section>



@endsection