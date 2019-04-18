@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <div class="box-body">
                <h2>Create Attribute</h2>
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    {{--<li><a href="{{url('/admin/products') }}"><i class="fa fa-dashboard"></i> Products</a></li>--}}
                    <li class="active"> Attribute</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>

                <form action="{{ route('admin.attributes.store') }}" method="post" class="form">
                <div class="box-body">
                    <div class="row">
                        {{ csrf_field() }}
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name">Attribute name <span class="text-danger">*</span></label>
                                <input type="text" name="name" id="name" placeholder="Attribute name" class="form-control" value="{!! old('name')  !!}">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.attributes.index') }}" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </div>
            </form>
        </div>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection
