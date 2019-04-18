@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($products)
            <div class="box">
                <div class="box-body">
                    <h2>Products</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/products') }}"><i class="fa fa-dashboard"></i> Products</a></li>--}}
                        <li class="active"> Products</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <p class="pull-left"><a href="{{ route('admin.products.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-product"
                                    data-toggle="tooltip" data-original-title="Create New product"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Product</b>
                            </button>
                        </a>
                    </p>
                    @include('layouts.search', ['route' => route('admin.products.index')])
                    @include('admin.shared.products')
                    {{ $products->links() }}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection
