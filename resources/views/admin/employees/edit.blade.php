@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/employees') }}"><i class="fa fa-dashboard"></i> Employees</a></li>
                <li class="active">Edit Employee</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <form action="{{ route('admin.employees.update', $employee->id) }}" method="post" class="form">
                <div class="box-body">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="put">
                    <div class="form-group">
                        <label for="name">Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="{!! $employee->name ?: old('name')  !!}">
                    </div>

                    <div class="form-group">
                        <label for="email">Email <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input type="text" name="email" id="email" placeholder="Email" class="form-control" value="{!! $employee->email ?: old('email')  !!}">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="role">Role <span class="text-danger">*</span></label>
                                <select class="form-control role_id" name="role_id">
                                    @foreach($employeeRoles as $employeeRole)
                                        @if($employee->id == $employeeRole->employee_id)
                                            @foreach($roles as $role)
                                                <option
                                                        @if($role->id == $employeeRole->role_id)
                                                        selected
                                                        @endif
                                                        value="{{$role->id}}">{{$role->display_name}}</option>
                                            @endforeach
                                        @endif
                                    @endforeach
                                </select>
                            </div>



                    <div class="form-group">
                        <label for="password">Password <span class="text-danger">*</span></label>
                        <input type="password" name="password" id="password" placeholder="xxxxx" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="password_confirmation">Confirm Password <span class="text-danger">*</span></label>
                        <input type="password" name="password_confirmation" id="password-confirm" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="status">Status </label>
                        <select name="status" id="status" class="form-control">
                            <option value="0" @if($employee->status == 0) selected="selected" @endif>Disable</option>
                            <option value="1" @if($employee->status == 1) selected="selected" @endif>Enable</option>
                        </select>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.employees.index') }}" class="btn btn-default btn-sm">Back</a>
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
