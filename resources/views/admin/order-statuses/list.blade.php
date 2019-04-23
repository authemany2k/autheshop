@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

        @include('layouts.errors-and-messages')
        <!-- Default box -->
        @if($orderStatuses)
        <div class="box">
            <div class="box-body">
                <h2>Order Status</h2>
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    {{--<li><a href="{{url('/admin/order-statuses') }}"><i class="fa fa-dashboard"></i> Order-statuses</a></li>--}}
                    <li class="active">Order-statuses</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>

                <p class="pull-left"><a href="{{ route('admin.order-statuses.create') }}">
                        <button type="button" class="btn btn-primary" name="create-new-order-status"
                                data-toggle="tooltip" data-original-title="Create New order-status"><span
                                    class='fa fa-plus' aria-hidden='true'></span> <b>Create New Order Status </b>
                        </button>
                    </a>
                </p>

                <table class="table">
                    <tbody>
                        <tr>
                            <td class="col-md-4">Name</td>
                            <td class="col-md-4">Color</td>
                            <td class="col-md-4">Actions</td>
                        </tr>
                    </tbody>
                    <tbody>
                    @foreach ($orderStatuses as $status)
                        <tr>
                            <td>{{ $status->name }}</td>
                            <td><button class="btn" style="background-color: {{ $status->color }}"><i class="fa fa-check" style="color: #ffffff"></i></button></td>
                            <td>
                                <form action="{{ route('admin.order-statuses.destroy', $status->id) }}" method="post" class="form-horizontal">
                                    {{ csrf_field() }}
                                    <input type="hidden" name="_method" value="delete">
                                    <div class="btn-group">
                                        <a href="{{ route('admin.order-statuses.edit', $status->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
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
