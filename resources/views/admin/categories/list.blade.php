@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')

    <!-- Default box -->
        @if($categories)
            <div class="box">
                <div class="box-body">
                    <h2>Categories</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/category') }}"><i class="fa fa-dashboard"></i> Category</a></li>--}}
                        <li class="active">Category</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <p class="pull-left"><a href="{{ route('admin.categories.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-category"
                                    data-toggle="tooltip" data-original-title="Create New Category"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Category </b>
                            </button>
                        </a>
                    </p>

                    @include('layouts.search', ['route' => route('admin.categories.index')])
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-2">Name</td>
                            <td class="col-md-2">Description</td>
                            <td class="col-md-3">Cover</td>
                            <td class="col-md-2">Status</td>
                            <td class="col-md-3">Actions</td>
                        </tr>
                        </tbody>
                        <tbody>
                        @foreach ($categories as $category)
                            <tr>
                                <td>
                                    <a href="{{ route('admin.categories.show', $category->id) }}">{{ $category->name }}</a></td>
                                <td>{{ str_limit($category->description, 100, ' ...') }}</td>
                                <td>
                                    @if(isset($category->cover))
                                        <img src="{{ asset("uploads/$category->cover") }}" alt="" class="img-responsive">
                                    @endif
                                </td>
                                <td>@include('layouts.status', ['status' => $category->status])</td>
                                <td>
                                    <form action="{{ route('admin.categories.destroy', $category->id) }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ route('admin.categories.edit', $category->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $categories->links() }}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection
