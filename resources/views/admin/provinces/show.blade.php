@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

    @include('layouts.errors-and-messages')
    <!-- Default box -->
        @if($province)
            <div class="box">
                <div class="box-body">
                    <h2>Province</h2>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                        <li><a href="{{url('/admin/provinces') }}"><i class="fa fa-dashboard"></i> Provinces</a></li>
                        <li class="active"> Show Province</li>
                        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                    </ol>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td class="col-md-4">Name</td>
                            <td class="col-md-4">Status</td>
                            <td class="col-md-4">Actions</td>
                        </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td>{{ $province->name }}</td>
                                <td>@include('layouts.status', ['status' => $province->status])</td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.countries.provinces.edit', [$countryId, $province->id]) }}" class="btn btn-primary"><i class="fa fa-edit"></i> Edit</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="box-body">
                    <h2>Cities / Municipalities</h2>
                    @include('admin.shared.cities')
                </div>
            <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.countries.show', $countryId) }}" class="btn btn-default btn-sm">Back</a>
                    </div>
                </div>
            </div>
            <!-- /.box -->
        @endif

    </section>
    <!-- /.content -->
@endsection
