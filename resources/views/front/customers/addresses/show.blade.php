@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="container content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        <div class="box">
            <div class="box-body">
                <h2>My Address</h2>
                <ol class="breadcrumb">
                    <li><a href="{{url('accounts') }}"><i class="fa fa-dashboard"></i> Account</a></li>
                    <li><a href="{{ route('customer.address.index', $customer->id) }}"><i class="fa fa-dashboard"></i> Address</a></li>
                    <li class="active">Show Address</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>
                <table class="table">
                    <tbody>
                    <tr>
                        <td class="col-md-1">Address Alias</td>
                        <td class="col-md-1">Address 1</td>
                        <td class="col-md-1">Address 2</td>
                        <td class="col-md-1">Phone Number</td>
                        <td class="col-md-1">City</td>
                        <td class="col-md-1">Country</td>
                        <td class="col-md-1">Zip</td>
                        <td class="col-md-1">Status</td>
                        {{--<td class="col-md-2">Action</td>--}}
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
                        {{--<td>--}}
                            {{--<form action="{{ url('customer/'.$address->id.'/address/'. $customer->id.'/')  }}" method="post" class="form-horizontal">--}}
                            {{--{{ csrf_field() }}--}}
                            {{--<input type="hidden" name="_method" value="delete">--}}
                            {{--<div class="btn-group">--}}
                                {{--<a href="{{ url('customer/'.$address->id.'/address/'. $customer->id.'/edit/') }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>--}}
                                {{--<button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>--}}
                            {{--</div>--}}
                            {{--</form>--}}
                        {{--</td>--}}
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <div class="btn-group">
                    {{--<a href="{{ route('customer.address.index', $customer->id) }}" class="btn btn-default">Back</a>--}}
                </div>
            </div>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection