@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <ol class="breadcrumb">
                <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                <li><a href="{{url('/admin/reviews') }}"><i class="fa fa-dashboard"></i> Reviews</a></li>
                <li class="active"> Edit Comment</li>
                <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
            </ol>
            <form action="{{ url('admin/reviews/'. $review->id) }}" method="post">
                {{--{{ url('customer/'.$address->id.'/address/'. $customer->id.'/edit/') }}--}}
                <div class="box-body">
                    <div class="row">
                        {{--{{method_field('PATCH')}}--}}
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="put">
                        <div class="col-md-8">


                            <div class="form-group">
                                <label for="name"> Star<span class="text-danger">*</span></label>
                                <input type="number" name="star" id="star" min="1" max="5" step="0.1" placeholder="Star" class="form-control" value="{!! $review->star ?: old('star')  !!}" required>
                            </div>

                            <div class="form-group">
                                <label for="name">Comment<span class="text-danger">*</span></label>
                                <input type="text" name="comment" id="comment" placeholder="Comment" class="form-control" value="{!! $review->comment ?: old('comment')  !!}">
                            </div>

                            <div class="form-group">
                                <label for="name">Product Name<span class="text-danger">*</span></label>
                                <input type="text" name="product" id="product" placeholder="Product Name" class="form-control" value="{!! $review->product->name ?: old('product')  !!}">
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        {{--<a href="{{ url('admin/reviews') }}" class="btn btn-default">Back</a>--}}
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
