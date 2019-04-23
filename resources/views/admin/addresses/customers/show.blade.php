@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        <div class="box">
            <div class="box-body">
                <h2>Addresses</h2>
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    <li><a href="{{url('/admin/customers') }}"><i class="fa fa-dashboard"></i> Customer Address</a></li>
                    <li class="active">Show Customer Address</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>
                <table class="table">
                    <tbody>
                    <tr>
                        <td class="col-md-1">Alias</td>
                        <td class="col-md-2">Address 1</td>
                        <td class="col-md-2">Address 2</td>
                        <td class="col-md-2">Phone No</td>
                        <td class="col-md-2">City</td>
                        <td class="col-md-2">Country</td>
                        <td class="col-md-2">Zip</td>
                        <td class="col-md-1">Status</td>
                    </tr>
                    </tbody>
                    <tbody>
                    <tr>
                        <td>{{ $address->alias }}</td>
                        <td>{{ $address->address_1 }}</td>
                        <td>{{ $address->address_2 }}</td>
                        <td>{{ $address->phone_no }}</td>
                        <td>{{ $address->city->name }}</td>
                        <td>{{ $address->country->name }}</td>
                        <td>{{ $address->zip }}</td>
                        <td>@include('layouts.status', ['status' => $address->status])</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <div class="btn-group">
                    <a href="{{ route('admin.customers.show', $customerId) }}" class="btn btn-default btn-sm">Back</a>
                </div>
            </div>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection