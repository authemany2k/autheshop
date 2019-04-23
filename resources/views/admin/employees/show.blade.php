@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/employees') }}"><i class="fa fa-dashboard"></i> Employees</a></li>
                <li class="active">Show Employee</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <div class="box-body">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="col-md-4">ID</td>
                            <td class="col-md-4">Name</td>
                            <td class="col-md-4">Email</td>
                            <td class="col-md-4">Role</td>
                        </tr>
                    </tbody>
                    <tbody>
                    <tr>
                        <td>{{ $employee->id }}</td>
                        <td>{{ $employee->name }}</td>
                        <td>{{ $employee->email }}</td>

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

                        {{--<td>--}}
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
                        {{--</td>--}}

                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <div class="btn-group">
                    <a href="{{ route('admin.employees.index') }}" class="btn btn-default btn-sm">Back</a>
                </div>
            </div>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
