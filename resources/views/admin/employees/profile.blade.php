@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <form action="{{ route('admin.employee.profile.update', $employee->id) }}" method="post" class="form">
            <input type="hidden" name="_method" value="put">
        {{ csrf_field() }}
        <!-- Default box -->
            <div class="box">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    <li><a href="{{url('/admin/employees') }}"><i class="fa fa-dashboard"></i> Employees</a></li>
                    <li class="active">Employee</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>
                <div class="box-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-4">Name</td>
                            <td class="col-md-4">Email</td>
                            <td class="col-md-4">Role</td>
                            {{--<td class="col-md-4">Password</td>--}}
                        </tr>
                        </tbody>
                        <tbody>
                        <tr>
                            <td>
                                {{ $employee->name }}
                                {{--<div class="form-group">--}}
                                    {{--<input name="name" type="text" class="form-control" value="{{ $employee->name }}">--}}
                                {{--</div>--}}
                            </td>
                            <td>
                                {{ $employee->email }}
                                {{--<div class="form-group">--}}
                                    {{--<input name="email" type="email" class="form-control" value="{{ $employee->email }}">--}}
                                {{--</div>--}}
                            </td>



                            <td>
                                @foreach($employeeRoles as $employeeRole)
                                    @if($employee->id == $employeeRole->employee_id)
                                        @foreach($roles as $role)
                                            @if($role->id == $employeeRole->role_id)
                                                {{$role->display_name}}
                                            @endif
                                        @endforeach
                                    @endif
                                @endforeach
                            </td>

                            {{--<div class="row">--}}
                                {{--<div class="col-xs-9 padding-0">--}}
                                    {{--<div class="col-xs-6">--}}
                                        {{--<h5>Role:</h5>--}}
                                    {{--</div>--}}
                                    {{--<div class="col-xs-6 padding-0">--}}
                                        {{--<select disabled="" class="form-control role_id" name="role_id">--}}
                                            {{--@foreach($employeeRoles as $employeeRole)--}}
                                                {{--@if($employee->id == $employeeRole->employee_id)--}}
                                                    {{--@foreach($roles as $role)--}}
                                                        {{--<option--}}
                                                                {{--@if($role->id == $employeeRole->role_id)--}}
                                                                {{--selected--}}
                                                                {{--@endif--}}
                                                                {{--value="{{$role->id}}">{{$role->display_name}}</option>--}}
                                                    {{--@endforeach--}}
                                                {{--@endif--}}
                                            {{--@endforeach--}}
                                        {{--</select>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}

                            {{--<td>--}}
                                {{--<div class="form-group">--}}
                                    {{--<input name="password" type="password" class="form-control" value="" placeholder="xxxxxx">--}}
                                {{--</div>--}}
                            {{--</td>--}}

                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.dashboard') }}" class="btn btn-default btn-sm">Back</a>
                        {{--<button class="btn btn-success btn-sm" type="submit"> <i class="fa fa-save"></i> Save</button>--}}
                    </div>
                </div>
            </div>
            <!-- /.box -->
        </form>

    </section>
    <!-- /.content -->
@endsection