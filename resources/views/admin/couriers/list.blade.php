@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($couriers)
            <div class="box">
                <div class="box-body">
                    <h2> <i class="fa fa-truck"></i> Couriers</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/couriers') }}"><i class="fa fa-dashboard"></i> Courier</a></li>--}}
                        <li class="active">Couriers</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>

                    <p class="pull-left"><a href="{{ route('admin.couriers.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-courier"
                                    data-toggle="tooltip" data-original-title="Create New Courier"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Courier </b>
                            </button>
                        </a>
                    </p>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-2">Name</td>
                            <td class="col-md-2">Description</td>
                            <td class="col-md-2">URL</td>
                            <td class="col-md-1">Is Free?</td>
                            <td class="col-md-1">Status</td>
                            <td class="col-md-4">Actions</td>
                        </tr>
                        </tbody>
                        <tbody>
                        @foreach ($couriers as $courier)
                            <tr>
                                <td>{{ $courier->name }}</td>
                                <td>{{ str_limit($courier->description, 100, ' ...') }}</td>
                                <td>{{ $courier->url }}</td>
                                <td>
                                    @include('layouts.status', ['status' => $courier->is_free])
                                </td>
                                <td>@include('layouts.status', ['status' => $courier->status])</td>
                                <td>
                                    <form action="{{ route('admin.couriers.destroy', $courier->id) }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ route('admin.couriers.edit', $courier->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection