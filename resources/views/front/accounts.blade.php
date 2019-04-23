@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="container content">
        <div class="row">
            <div class="col-md-12">
                <h2> <i class="fa fa-home"></i> My Account</h2>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
                        <li role="presentation"><a href="#orders" aria-controls="orders" role="tab" data-toggle="tab">Orders</a></li>
                        <li role="presentation"><a href="#address" aria-controls="address" role="tab" data-toggle="tab">Addresses</a></li>
                        <li role="presentation"><a href="#wishlist" aria-controls="wishlist" role="tab" data-toggle="tab">Wishlist</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content customer-order-list">
                        <div role="tabpanel" class="tab-pane active" id="profile">
                            {{$customer->name}} <br /><small>{{$customer->email}}</small> <br /><small>{{$customer->phone_no}}</small>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="orders">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td class="col-md-3">Date</td>
                                    <td class="col-md-2">Courier</td>
                                    <td class="col-md-2">Total</td>
                                    <td class="col-md-2">Status</td>
                                </tr>
                                </tbody>
                                <tbody>
                                @foreach ($orders as $order)
                                    <tr>
                                        <td>
                                            <a data-toggle="modal" data-target="#order_modal_{{$order['id']}}" title="Show order" href="javascript: void(0)">{{ date('M d, Y h:i a', strtotime($order['created_at'])) }}</a>
                                            <!-- Button trigger modal -->
                                            <!-- Modal -->
                                            <div class="modal fade" id="order_modal_{{$order['id']}}" tabindex="-1" role="dialog" aria-labelledby="MyOrders">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">Reference #{{$order['reference']}}</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table">
                                                                <thead>
                                                                    <th>Address</th>
                                                                    <th>Payment</th>
                                                                    <th>Total</th>
                                                                    <th>Status</th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <address>
                                                                                <strong>{{$order['address']->alias}}</strong><br />
                                                                                {{$order['address']->address_1}} {{$order['address']->address_2}} {{$order['address']->phone_no}}<br><br>
                                                                            </address>
                                                                        </td>
                                                                        <td>{{$order['payment']}}</td>
                                                                        <td>{{$order['total']}}</td>
                                                                        <td>{{$order['status']->name}}</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>{{ $order['courier']->name }}</td>
                                        <td><span class="label @if($order['total'] != $order['total_paid']) label-danger @else label-success @endif"><b>‎&#8358;</b> {{ $order['total'] }}</span></td>
                                        <td><p class="text-center" style="color: #ffffff; background-color: {{ $order['status']->color }}">{{ $order['status']->name }}</p></td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div role="tabpanel" class="tab-pane" id="address">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="{{route('customer.address.create', auth()->user()->id)}}" class="btn btn-primary">Create your address</a>
                                </div>
                            </div>

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

                            <table class="table">
                            </table>
                        </div>

                        <div role="tabpanel" class="tab-pane" id="wishlist">
                            @include('front.wishlists.wishlist')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
@endsection
