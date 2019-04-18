@extends('layouts.front.app')
@section('content')
    <div class="container product-in-cart-list">
        <div class="row">
            <div class="col-md-12">
                <hr>
                <p class="alert alert-fail">failed order <a href="{{ url('category/newest') }}">Shop now!</a></p>
            </div>
        </div>
    </div>
@endsection