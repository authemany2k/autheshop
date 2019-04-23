@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')
    <!-- Default box -->
        {{--@if($seller)--}}
            <div class="box">
                <div class="box-body">
                    <h2>Sellers</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        {{--<li><a href="{{url('/admin/sellers') }}"><i class="fa fa-dashboard"></i> Seller</a></li>--}}
                        <li class="active">Sellers</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <p class="pull-left"><a href="{{ route('admin.sellers.create') }}">
                            <button type="button" class="btn btn-primary" name="create-new-seller"
                                    data-toggle="tooltip" data-original-title="Create New Seller"><span
                                        class='fa fa-plus' aria-hidden='true'></span> <b>Create New Seller </b>
                            </button>
                        </a>
                    </p>
                    @include('layouts.search', ['route' => route('admin.sellers.index')])
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-2">Name</td>
                            <td class="col-md-2">Phone Number</td>
                            <td class="col-md-2">Sex</td>
                            <td class="col-md-2">Product Category</td>
                            {{--<td class="col-md-1">Status</td>--}}
                            <td class="col-md-4">Actions</td>
                        </tr>
                        </tbody>
                        <tbody>
                        @foreach ($sellers as $seller)
                            <tr>
                                <td>{{ $seller->name }}</td>
                                <td>{{ $seller->phone_no }}</td>
                                <td>
                                @if(isset($seller->sex))
                                    @if($seller->sex == 1)
                                            <i class="fa fa-user" style="color: orange;"> Femaale</i>

                                    @else
                                            <i class="fa fa-user" style="color: #1817ef;"> Male </i>
                                    @endif
                                @endif
                                    </td>
                                {{--<td></td>--}}
                                <td>{{ $seller->category_name }}</td>
                                {{--<td>@include('layouts.status', ['status' => $seller['status']])</td>--}}
                                <td>
                                    <form action="{{ route('admin.sellers.destroy', $seller->id) }}" method="post" class="form-horizontal">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        <div class="btn-group">
                                            <a href="{{ route('admin.sellers.show', $seller->id) }}" class="btn btn-default btn-sm"><i class="fa fa-eye"></i> Show</a>
                                            <a href="{{ route('admin.sellers.edit', $seller->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{ $pagenateResults->links() }}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        {{--@endif--}}

    </section>
    <!-- /.content -->
@endsection