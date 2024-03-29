@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/couriers') }}"><i class="fa fa-dashboard"></i> Couriers</a></li>
                <li class="active">Edit Courier</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <form action="{{ route('admin.couriers.update', $courier->id) }}" method="post" class="form">
                <div class="box-body">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="put">
                    <div class="form-group">
                        <label for="name">Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="{{ $courier->name ?: old('name') }}">
                    </div>
                    <div class="form-group">
                        <label for="description">Description </label>
                        <textarea name="description" id="description" rows="5" class="form-control" placeholder="Description">{{ $courier->description ?: old('description') }}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="URL">URL</label>
                        <div class="input-group">
                            <span class="input-group-addon">http://</span>
                            <input type="text" name="url" id="url" placeholder="Link" class="form-control" value="{{ $courier->url ?: old('url') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="is_free">Free Delivery? </label>
                        <select name="is_free" id="is_free" class="form-control">
                            <option value="0" @if($courier->is_free == 0) selected="selected" @endif>No</option>
                            <option value="1" @if($courier->is_free == 1) selected="selected" @endif>Yes</option>
                        </select>
                    </div>
                    <div class="form-group">
                        @include('admin.shared.status-select', ['status' => $courier->status])
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.couriers.index') }}" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
