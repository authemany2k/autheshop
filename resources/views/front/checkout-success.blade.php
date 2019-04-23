{{--@extends('layouts.front.app')--}}

{{--@section('content')--}}
{{--<div class="container product-in-cart-list">--}}
{{--<div class="row">--}}
{{--<div class="col-md-12">--}}
{{--<hr>--}}
{{--<p class="alert alert-success">Your order is under way! It will be delivered to you in maximum of seven working days <a href="{{ route('home') }}">Shop more!</a></p>--}}
{{--</div>--}}
{{--</div>--}}
{{--</div>--}}
{{--@endsection--}}


@extends('layouts.front.app')

@section('content')
    <div class="container product-in-cart-list">
        <div class="row" style="margin-bottom:40px;">
            <div class="col-md-8 col-md-offset-2">
                <p>
                    <div class="row">
                        <div class="col-md-12">
                            <h2><i class="fa fa-map-marker"></i> Your Order Details has been sent to your mail</h2>

                <p class="alert alert-success">You have successfully made your order and your order is on the way!
                    Please note it will take maximum of seven working for the order to be delivered <a href="{{ url('category/newest') }}">Shop now!</a>
                </p>

            </div>
        </div>
    </div>

@endsection


