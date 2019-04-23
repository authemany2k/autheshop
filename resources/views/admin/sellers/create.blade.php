@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/sellers') }}"><i class="fa fa-dashboard"></i> Sellers</a></li>
                <li class="active">Create Seller</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <form action="{{ route('admin.sellers.store') }}" method="post" class="form">
                <div class="box-body">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="name">Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="{{ old('name') }}">
                    </div>
                    <div class="form-group">
                        <label for="phone_no">Phone Number <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-addon">*</span>
                            <input type="text" name="phone_no" id="phone_no" placeholder="Phone No:" class="form-control" value="{{ old('phone_no') }}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sex">Sex </label>
                        <select name="sex" id="sex" class="form-control" required>
                            <option value="" disabled selected>Select</option>
                            <option value="0">Male</option>
                            <option value="1">Female</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="category_name">Product Category (Press Ctrl to select more than an item ) </label>

                            <select class="form-control category_name" name="category_name[]" multiple="multiple">
                                <option value=""></option>
                                @foreach($categories as $category)
                                    <option value="{{ $category->name }}">{{ $category->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    {{--</div>--}}


                    {{--<div class="form-group">--}}
                        {{--<label for="category_id">Product Category </label>--}}
                        {{--<select name="category_id" id="category_id" class="form-control">--}}
                            {{--<option value="" disabled selected>Select</option>--}}
                            {{--@foreach($categories as $category)--}}
                                {{--<option value="{{ $category->id }}">{{ $category->name }}</option>--}}
                            {{--@endforeach--}}
                        {{--</select>--}}
                    {{--</div>--}}

                    {{--<div class="form-group">--}}
                        {{--<label for="status">Status </label>--}}
                        {{--<select name="status" id="status" class="form-control">--}}
                            {{--<option value="0">Disable</option>--}}
                            {{--<option value="1">Enable</option>--}}
                        {{--</select>--}}
                    {{--</div>--}}

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.sellers.index') }}" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->

@endsection


{{--note--}}


{{--<div class="form-group{{ hasErrorForClass($errors, 'assetType_id') }} col-xs-6 padding-0">--}}
    {{--<div class="col-xs-3">--}}
        {{--<h5><b>Requesting Machines:</b></h5>--}}
    {{--</div>--}}
    {{--<div class="col-xs-6 padding-0">--}}
        {{--<select class="form-control assetType_id" name="assetType_id[]" multiple="multiple">--}}
            {{--<option value=""></option>--}}
            {{--@foreach($assetTypes as $assetType)--}}
                {{--<option value="{{$assetType->id}}">{{$assetType->type_name}}</option>--}}
            {{--@endforeach--}}
        {{--</select>--}}
        {{--{{ hasErrorForField($errors, 'assetType_id') }}--}}
    {{--</div>--}}
{{--</div>--}}