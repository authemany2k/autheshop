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
                <h4 style="color: black" > <strong>{{'Payment Successful'}}</strong></h4>
                <h5 style="color: black" > <strong> TOTAL AMOUNT PAID:&nbsp;  &#8358;{{$order->total_paid }}</strong> (PLEASE NOTE THIS IS WITHOUT SHIPPING FEE)</h5>
                <h5 style="color: black" >  <strong>  REF No:&nbsp;{{ $order->reference }}</strong></h5> &nbsp; Please keep this REF No: with you!
                <hr>
                <p>You have successfully made your order and your order is on the way!
                    Please note it will take maximum of seven working days for your order to be delivered to you,  <a href="{{ url('category/new-arrivals') }} " style="color:#FFFFFF; background: #E45722;">click to shop more!</a>
                </p>
            </div>
        </div>
    </div>
@endsection



{{--<style>--}}
    {{--a:link, a:visited {--}}
        {{--background-color: #f44336;--}}
        {{--color: white;--}}
        {{--padding: 14px 25px;--}}
        {{--text-align: center;--}}
        {{--text-decoration: none;--}}
        {{--display: inline-block;--}}
    {{--}--}}

    {{--a:hover, a:active {--}}
        {{--background-color: red;--}}
    {{--}--}}
{{--</style>--}}