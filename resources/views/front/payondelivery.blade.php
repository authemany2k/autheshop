@extends('layouts.front.app')

@section('content')
    <div class="container product-in-cart-list">
        <div class="row">
            <div class="col-md-12">
                <hr>
                <h2><i class="fa fa-map-marker"></i> Your Order Details have been sent to your mail</h2>
                <p class="alert alert-success">You have successfully made your order and your order is on the way!
                    Please note it will take maximum of seven working days for your order to be delivered to you <a href="{{ url('category/new-arrivals') }}">Shop more!</a>
                </p>
                <h5 style="color: black" > <strong> TOTAL ORDERED AMOUNT:&nbsp;  &#8358; {{$order->total_paid }}</strong>  (PLEASE NOTE THIS IS WITHOUT SHIPPING FEE)</h5>
                <h5 style="color: black" >  <strong>  REF No:&nbsp;{{ $order->reference }}</strong></h5> &nbsp; Please keep this REF No: with you!
<hr>
                <p>You have successfully made your order and your order is on the way!
                    Please note it will take maximum of seven working days for your order to be delivered to you <a href="{{ url('category/new-arrivals') }} " style="color:red; background: #337AB7;">SHOP MORE!</a>
                </p>
            </div>
        </div>
    </div>
@endsection