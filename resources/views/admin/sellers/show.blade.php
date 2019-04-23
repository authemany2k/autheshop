@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-body">
                <h2>Seller</h2>
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    <li><a href="{{url('/admin/sellers') }}"><i class="fa fa-dashboard"></i> Sellers</a></li>
                    <li class="active">Show Seller</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>
                <table class="table">
                    <tbody>
                    <tr>
                        <td class="col-md-2">Name</td>
                        <td class="col-md-2">Phone Number</td>
                        <td class="col-md-1">Sex</td>
                        <td class="col-md-2">Product Category</td>
                    </tr>
                    </tbody>
                    <tbody>
                    <tr>
                        <td>{{ $seller->name}}</td>
                        <td>{{ $seller->phone_no }}</td>

                        <td>
                            @if(isset($seller['sex']))
                                @if($seller['sex'] == 1)
                                    <i class="fa fa-user" style="color: orange;"> Femaale</i>

                                @else
                                    <i class="fa fa-user" style="color: #1817ef;"> Male </i>
                                @endif
                            @endif
                        </td>


                        <td>{{ $seller->category_name }}</td>

                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- /.box-body -->
            <div class="box-footer">
                <div class="btn-group">
                    <a href="{{ route('admin.sellers.index') }}" class="btn btn-default btn-sm">Back</a>
                </div>
            </div>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection
