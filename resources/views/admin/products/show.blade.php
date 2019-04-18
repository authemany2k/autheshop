@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($product)
            <div class="box">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    <li><a href="{{url('/admin/products') }}"><i class="fa fa-dashboard"></i> Products</a></li>
                    <li class="active"> Show Product</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>
                <div class="box-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-2">Name</td>
                            <td class="col-md-3">Description</td>
                            <td class="col-md-3">Specification</td>
                            <td class="col-md-3">Cover</td>
                            <td class="col-md-2">Quantity</td>
                            <td class="col-md-2">Price</td>
                        </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td>{{ $product->name }}</td>
                                <td>{{ $product->description }}</td>
                                <td>{{ $product->specification }}</td>
                                <td>
                                    @if(isset($product->cover))
                                        <img src="{{ asset("uploads/$product->cover") }}" class="img-responsive" alt="">
                                    @endif
                                </td>
                                <td>{{ $product->quantity }}</td>
                                <td>&#8358; {{ $product->price }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.products.index') }}" class="btn btn-default btn-sm">Back</a>
                    </div>
                </div>
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection
