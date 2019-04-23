@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if(!$brands->isEmpty())
            <div class="box">
                <div class="box-body">
                    <h2>Brands</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/products') }}"><i class="fa fa-dashboard"></i> Products</a></li>--}}
                        <li class="active"> Brands</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>

                    <p class="pull-left"><a href="{{ route('admin.brands.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-brand"
                                    data-toggle="tooltip" data-original-title="Create New Brand"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Brand</b>
                            </button>
                        </a>
                    </p>

                    <table class="table">
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Actions</td>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach ($brands as $brand)
                            <tr>
                                <td>
                                    {{--<a href="{{ route('admin.brands.show', $brand->id) }}">{{ $brand->name }}</a>--}}
                                   {{ $brand->name }}
                                </td>
                                <td>
                                    <form action="{{ route('admin.brands.destroy', $brand->id) }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ route('admin.brands.edit', $brand->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $brands->links() }}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
            @else
            <p class="alert alert-warning">No brand created yet. <a href="{{ route('admin.brands.create') }}">Create one!</a></p>
        @endif
    </section>
    <!-- /.content -->
@endsection
