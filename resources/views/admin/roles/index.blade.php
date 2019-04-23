@extends('layouts.admin.app')

@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h1>
                        Admin
                        <small>Roles</small>
                    </h1>
                </div>
                <ol class="breadcrumb">
                    <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                    {{--<li><a href="{{url('admin/roles') }}"><i class="fa fa-dashboard"></i> Role</a></li>--}}
                    <li class="active">Roles</li>
                    <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                </ol>

                @include('layouts.partials.alerts')

                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Roles</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>

                    <div class="col-md-12">
                    <a class="btn bg-blue" href="{{ url('admin/roles/create') }}"> Create New Role</a>
                </div>

                    <div class="box-body table-responsive">
                        <div class="col-md-12">

                            <table class="table table-hover" id="rolestable">
                                <thead>
                                <tr style="background-color: #a0bdf2">
                                    <th>No</th>
                                    <th>Name</th>
                                    <th>Display Name</th>
                                    <th>Description</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach ($roles as $key => $role)
                                    <tr>
                                        <td>{{ ++$i }}</td>
                                        <td><a href="{{ url('admin/roles',$role->id) }}">{{ $role->name }}</a></td>
                                        <td>{{ $role->display_name }}</td>
                                        <td>{{ $role->description }}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                            {{ $roles->links() }}
                        </div>

                    </div>
                </div>
            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    var table = $('#permissiontable').removeAttr('width').DataTable( {
                        // the Width control starts here
                        scrollY:        "400px",
                        scrollX:       true,
                        scrollCollapse: true,
                        paging:         true,
                        ordering:       true,
                        searching:    true
                    } );
                } );
            </script>

            @push('scripts')
                <script>
                    $(function () {
                        $("#rolestable").DataTable();
                    });
                </script>

    @endpush
        </div>
    </div>
@endsection