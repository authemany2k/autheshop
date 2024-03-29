@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <form action="{{ route('admin.products.store') }}" method="post" class="form" enctype="multipart/form-data">
                <div class="box-body">
                    {{ csrf_field() }}
                    <div class="row">
                        {{ csrf_field() }}
                        <div class="col-md-8">

                            <h2>Product Create</h2>
                            <ol class="breadcrumb">
                                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                                <li><a href="{{url('/admin/products') }}"><i class="fa fa-dashboard"></i> Products</a></li>
                                <li class="active"> Products</li>
                                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                            </ol>


                            <div class="form-group">
                                <label for="sku">SKU <span class="text-danger">*</span></label>
                                <input type="text" name="sku" id="sku" placeholder="xxxxx" class="form-control" value="{{ old('sku') }}">
                            </div>
                            <div class="form-group">
                                <label for="name">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="{{ old('name') }}">
                            </div>
                            <div class="form-group">
                                <label for="description">Description </label>
                                <textarea class="form-control ckeditor" name="description" id="description" rows="5" placeholder="Description">{{ old('description') }}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="specification">Specification </label>
                                <textarea class="form-control ckeditor" name="specification" id="specification" rows="5" placeholder="Specification">{{ old('specification') }}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="cover">Cover </label>
                                <input type="file" name="cover" id="cover" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="image">Images</label>
                                <input type="file" name="image[]" id="image" class="form-control" multiple>
                                <span class="text-warning">You can use ctr (cmd) to select multiple images</span>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Quantity <span class="text-danger">*</span></label>
                                <input type="text" name="quantity" id="quantity" placeholder="Quantity" class="form-control" value="{{ old('quantity') }}">
                            </div>
                            <div class="form-group">
                                <label for="seller_id">Seller </label>
                                <select name="seller_id" id="seller_id" class="form-control">
                                    <option value="" disabled selected>Select</option>
                                    @foreach($sellers as $seller)
                                        <option value="{{ $seller->id }}">{{ $seller->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="price">Price <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-addon">&#8358;</span>
                                    <input type="text" name="price" id="price" placeholder="Price" class="form-control" value="{{ old('price') }}">
                                </div>
                            </div>

                            @if(!$brands->isEmpty())
                                <div class="form-group">
                                    <label for="brand_id">Brand </label>
                                    <select name="brand_id" id="brand_id" class="form-control select2">
                                        <option value=""></option>
                                        @foreach($brands as $brand)
                                            <option @if(old('brand_id') == $brand->id) selected="selected" @endif value="{{ $brand->id }}">{{ $brand->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            @endif
                            <div class="form-group">
                                <label for="status">Status </label>
                                <select name="status" id="status" class="form-control">
                                    <option value="0">Disable</option>
                                    <option value="1">Enable</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <h2>Categories</h2>
                            @include('admin.shared.categories', ['categories' => $categories])
                        </div>
                    </div>
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.products.index') }}" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection

<script type="text/javascript">
$(document).ready(function() {
$(".seller_id").select2();
});
</script>
