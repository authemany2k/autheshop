@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

        @include('layouts.errors-and-messages')
        <!-- Default box -->
        @if($employees)
        <div class="box">
            <div class="box-body">
                <h2>Employees</h2>
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    {{--<li><a href="{{url('/admin/employees') }}"><i class="fa fa-dashboard"></i> Employees</a></li>--}}
                    <li class="active">Employees</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>

                <p class="pull-left"><a href="{{ route('admin.employees.create') }}">
                        <button type="button" class="btn btn-primary" name="create-new-Employee"
                                data-toggle="tooltip" data-original-title="Create New Employee"><span
                                    class='fa fa-plus' aria-hidden='true'></span> <b>Create New Employee </b>
                        </button>
                    </a>
                </p>

                <table class="table">
                    <tbody>
                        <tr>
                            <td class="col-md-1">ID</td>
                            <td class="col-md-2">Name</td>
                            <td class="col-md-3">Email</td>
                            <td class="col-md-2">Employee's Role</td>
                            <td class="col-md-1">Status</td>
                            <td class="col-md-3">Actions</td>
                        </tr>
                    </tbody>
                    <tbody>
                    @foreach ($employees as $employee)
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

                            <td>@include('layouts.status', ['status' => $employee->status])</td>
                            <td>
                                <form action="{{ route('admin.employees.destroy', $employee->id) }}" method="post" class="form-horizontal">
                                    {{ csrf_field() }}
                                    <input type="hidden" name="_method" value="delete">
                                    <div class="btn-group">
                                        <a href="{{ route('admin.employees.show', $employee->id) }}" class="btn btn-default btn-sm"><i class="fa fa-eye"></i> Show</a>
                                        <a href="{{ route('admin.employees.edit', $employee->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                        <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                {{ $employees->links() }}
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection
