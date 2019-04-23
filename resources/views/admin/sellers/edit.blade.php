@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/sellers') }}"><i class="fa fa-dashboard"></i> Sellers</a></li>
                <li class="active">Edit Seller</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <form action="{{ route('admin.sellers.update', $seller->id) }}" method="post" class="form">
                <div class="box-body">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="put">
                    <div class="form-group">
                        <label for="name">Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="{!! $seller->name ?: old('name')  !!}">
                    </div>

                    <div class="form-group">
                        <label for="phone_no">Phone Number <span class="text-danger">*</span></label>
                        <input type="text" name="phone_no" id="phone_no" placeholder="Phone No" class="form-control" value="{!! $seller->phone_no ?: old('phone_no')  !!}">
                    </div>

                    <div class="form-group">
                        <label for="sex">Sex </label>
                        <select name="sex" id="sex" class="form-control" required>
                            <option value="" disabled selected>Select</option>
                            <option value="0" @if($seller->sex == 0) selected="selected" @endif>Male</option>
                            <option value="1" @if($seller->sex == 1) selected="selected" @endif>Female</option>
                        </select>
                    </div>



                    <?php
                    $category_name = $seller->category_name;
                    $category_name_string = str_replace('; ', ',', $category_name);
                    $category_name_array = explode(",",$category_name_string);
                    //echo  $assetType_array[0];
                    ?>



                    <div class="form-group">
                        <label for="category_name">Product Category (Press Ctrl to select more than an item ) </label>
                            <select class="form-control category_name" name="category_name[]" multiple="multiple">
                                {{--<select class="form-control assetType_id" name="assetType_id" required>--}}
                                <option value=""></option>
                                @foreach($categories as $category)
                                    <option value="{{$category->name}}"{{ (in_array($category->name,$category_name_array) ? 'selected="selected"' : '') }} >{{$category->name}}</option>
                                @endforeach
                            </select>
                        </div>

                </div>

                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.sellers.index') }}" class="btn btn-default btn-sm">Back</a>
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
