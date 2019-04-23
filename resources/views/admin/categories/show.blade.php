@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($category)
            <div class="box">
                <div class="box-body">
                    <h2>Category</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        <li><a href="{{url('/admin/categories') }}"><i class="fa fa-dashboard"></i> Categories</a></li>
                        <li class="active">Show Category</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-4">Name</td>
                            <td class="col-md-4">Description</td>
                            <td class="col-md-4">Cover</td>
                        </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td>{{ $category->name }}</td>
                                <td>{{ $category->description }}</td>
                                <td>
                                    @if(isset($category->cover))
                                    {{ $category->cover }}
                                        {{--<img src="{{asset("uploads/categories/$category->cover")}}" alt="category image" class="img-thumbnail">--}}
                                    @endif
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                @if(!$categories->isEmpty())
                <hr>
                    <div class="box-body">
                        <h2>Sub Categories</h2>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td class="col-md-3">Name</td>
                                <td class="col-md-3">Description</td>
                                <td class="col-md-3">Cover</td>
                                <td class="col-md-3">Actions</td>
                            </tr>
                            </tbody>
                            <tbody>
                                @foreach($categories as $cat)
                                    <tr>
                                        <td><a href="{{route('admin.categories.show', $cat->id)}}">{{ $cat->name }}</a></td>
                                        <td>{{ $cat->description }}</td>

                                        <td>
                                            {{--@if(isset($cat->cover))<img src="{{asset("storage/$cat->cover")}}" alt="category image" class="img-thumbnail">--}}
                                            @if(isset($cat->cover))
                                                {{ $cat->cover }}
                                            @endif
                                        </td>
                                        <td><a class="btn btn-primary" href="{{route('admin.categories.edit', $cat->id)}}"><i class="fa fa-edit"></i> Edit</a></td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
                @if(!$products->isEmpty())
                    <div class="box-body">
                        <h2>Products</h2>
                        @include('admin.shared.products', ['products' => $products])
                    </div>
                @endif
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.categories.index') }}" class="btn btn-default btn-sm">Back</a>
                    </div>
                </div>
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection
