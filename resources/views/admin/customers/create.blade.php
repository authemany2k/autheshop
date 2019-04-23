@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/customers') }}"><i class="fa fa-dashboard"></i> Customers</a></li>
                <li class="active">Create Customer</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <form action="{{ route('admin.customers.store') }}" method="post" class="form">
                <div class="box-body">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="name">Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="{{ old('name') }}">
                    </div>
                    <div class="form-group">
                        <label for="email">Email <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input type="text" name="email" id="email" placeholder="Email" class="form-control" value="{{ old('email') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password <span class="text-danger">*</span></label>
                        <input type="password" name="password" id="password" placeholder="xxxxx" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="status">Status </label>
                        <select name="status" id="status" class="form-control">
                            <option value="0">Disable</option>
                            <option value="1">Enable</option>
                        </select>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.products.index') }}" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
