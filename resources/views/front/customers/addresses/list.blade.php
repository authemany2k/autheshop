@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="content container">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($addresses)
            <div class="box">
                <div class="box-body">
                    <h2>Addresses</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{url('accounts') }}"><i class="fa fa-dashboard"></i> Account</a></li>

                        <li><a href="{{ route('customer.address.index', $customer->id) }}"><i class="fa fa-dashboard"></i> Address</a></li>
                        <li class="active">Show Address</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>

                    <table class="table">
                        <thead>
                        <th>Address Alias</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>Province</th>
                        <th>Action</th>
                        </thead>
                        <tbody>
                        @foreach($addresses as $address)
                            <tr>
                                <td><a href="{{ url('customer/'.$address->id.'/address/'. $customer->id.'/')  }}">{{ $address->alias }}</a></td>
                                <td>{{$address->address_1}} {{$address->address_2}}</td>
                                <td>{{$address->phone_no}}</td>
                                <td>{{$address->city->name}}</td>
                                <td>
                                    <form action="{{ url('customer/'.$address->id.'/address/'. $customer->id.'/')  }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ url('customer/'.$address->id.'/address/'. $customer->id.'/edit/') }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>

                            </tr>
                        @endforeach
                        </tbody>
                    </table>
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