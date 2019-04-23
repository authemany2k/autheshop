@extends('layouts.front.app')
@section('content')
    <div class="container product">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="{{ route('home') }}"> <i class="fa fa-home"></i> Home</a></li>
                    @if(isset($category))
                    <li><a href="{{ route('front.category.slug', $category->slug) }}">{{ $category->name }}</a></li>
                    @endif
                    <li class="active">Product</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-warning" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>
            </div>
        </div>
        @include('layouts.front.product')
    </div>
@endsection