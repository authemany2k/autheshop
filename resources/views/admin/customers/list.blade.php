@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($customers)
            <div class="box">
                <div class="box-body">
                    <h2>Customers</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/customers') }}"><i class="fa fa-dashboard"></i> Customer</a></li>--}}
                        <li class="active">Customers</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <p class="pull-left"><a href="{{ route('admin.customers.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-customer"
                                    data-toggle="tooltip" data-original-title="Create New Customer"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Customer </b>
                            </button>
                        </a>
                    </p>
                    @include('layouts.search', ['route' => route('admin.customers.index')])
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-2">ID</td>
                            <td class="col-md-2">Name</td>
                            <td class="col-md-2">Email</td>
                            <td class="col-md-2">Status</td>
                            <td class="col-md-4">Actions</td>
                        </tr>
                        </tbody>
                        <tbody>
                        @foreach ($customers as $customer)
                            <tr>
                                <td>{{ $customer['id'] }}</td>
                                <td>{{ $customer['name'] }}</td>
                                <td>{{ $customer['email'] }}</td>
                                <td>@include('layouts.status', ['status' => $customer['status']])</td>
                                <td>
                                    <form action="{{ route('admin.customers.destroy', $customer['id']) }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ route('admin.customers.show', $customer['id']) }}" class="btn btn-default btn-sm"><i class="fa fa-eye"></i> Show</a>
                                            <a href="{{ route('admin.customers.edit', $customer['id']) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $customers->links() }}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection