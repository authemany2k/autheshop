@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($addresses)
            <div class="box">
                <div class="box-body">
                    <h2>Addresses</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/addresses') }}"><i class="fa fa-dashboard"></i> Customer Address</a></li>--}}
                        <li class="active">Addresses</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <section class="content">
                    <p class="pull-left"><a href="{{ route('admin.addresses.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-address"
                                    data-toggle="tooltip" data-original-title="Create New Address"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Address </b>
                            </button>
                        </a>
                    </p>

                    @include('layouts.search', ['route' => route('admin.addresses.index')])
                        <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-2">Alias</td>
                            <td class="col-md-2">Address 1</td>
                            <td class="col-md-1">Phone Number</td>
                            <td class="col-md-1">Country</td>
                            <td class="col-md-1">Province</td>
                            <td class="col-md-1">City</td>
                            <td class="col-md-1">Zip Code</td>
                            <td class="col-md-1">Status</td>
                            <td class="col-md-2">Actions</td>
                        </tr>
                        </tbody>
                        <tbody>
                        @foreach ($addresses as $address)
                            <tr>
                                <td><a href="{{ route('admin.customers.show', $address->customer_id) }}">{{ $address->alias }}</a></td>
                                <td>{{ $address->address_1 }}</td>
                                <td>{{ $address->phone_no }}</td>
                                <td>{{ $address->country }}</td>
                                <td>{{ $address->province }}</td>
                                <td>{{ $address->city }}</td>
                                <td>{{ $address->zip }}</td>
                                <td>@include('layouts.status', ['status' => $address->status])</td>
                                <td>
                                    <form action="{{ route('admin.addresses.destroy', $address->id) }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ route('admin.addresses.edit', $address->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    @if($addresses instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator)
                        <div class="row">
                            <div class="col-md-12">
                                <div class="pull-left">{{ $addresses->links() }}</div>
                            </div>
                        </div>
                    @endif
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        @else
            <div class="box">
                <div class="box-body"><p class="alert alert-warning">No addresses found.</p></div>
            </div>
        @endif
    </section>
    <!-- /.content -->
@endsection