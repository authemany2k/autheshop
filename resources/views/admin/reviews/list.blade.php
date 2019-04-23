@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($reviews)
            <div class="box">
                <div class="box-body">
                    <h2>Reviews</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/reviews') }}"><i class="fa fa-dashboard"></i> Reviews</a></li>--}}
                        <li class="active"> Reviews</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    @include('layouts.search', ['route' => route('admin.reviews.index')])
                    <table class="table table-responsive">
                        <tr>
                            <th>Name</th>
                            <th>Rating</th>
                            <th>Comment</th>
                            <th>Product Name</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>

                        @foreach($reviews as $review)
                            @if($review->status != '0')
                            <tr>
                                <td>{{$review->customer->name }} </td>
                                <td>{{ $review->star }}</td>
                                <td>{{ $review->comment }}</td>
                                <td>{{ $review->product->name }}</td>
                                <td>{{ $review->created_at }}</td>
                                <td>
                                    <form action="{{ url('admin/reviews/'. $review->id.'/')  }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ url('admin/reviews/'. $review->id.'/edit/') }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            @endif
                        @endforeach
                    </table>
                    {{--@if($review instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator)--}}
                        <div class="row">
                            <div class="col-md-12">
                                <div class="pull-left">{{ $pagenateResults->links() }}</div>
                            </div>
                        </div>
                    {{--@endif--}}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection