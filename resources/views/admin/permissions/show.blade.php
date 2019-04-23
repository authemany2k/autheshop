@extends('layouts.admin.app')

@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h1>
                        Admin
                        <small>Permissions</small>
                    </h1>
                </div>
      <ol class="breadcrumb">
          <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
          <li><a href="{{ url('admin/permissions') }}"><i class="fa fa-dashboard"></i> Permission</a></li>
        <li class="active">Show Permissions</li>
          <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
      </ol>
        
        @include('layouts.partials.alerts')

          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Show Permissions</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>

            <div class="box-body">
                
            <div class="form-group">
                <strong>Name:</strong>
                {{ $permission->name }}
            </div>

            <div class="form-group">
                <strong>Display Name:</strong>
                {{ $permission->display_name }}
            </div>

            <div class="form-group">
                <strong>Description:</strong>
                {{ $permission->description }}
            </div>
			<a class="btn btn-sm btn-flat btn-primary" href="{{ url('admin/permissions/'.$permission->id.'/edit') }}"><i class="fa fa-edit"> Edit</i></a>
                {!! Form::open(['method' => 'DELETE','route' => ['admin.permissions.destroy', $permission->id],'style'=>'display:inline','class'=>'delete']) !!}
                <button type="submit" class= "btn btn-sm btn-flat btn-danger" onclick="return confirm('Are you sure you want to delete this item?');"> <span class="fa fa-trash-o" aria-hidden="true"></span> <b>Delete</b></button>
                {{--{{ Form::button('<i class="fa fa-remove"> Delete</i>', array('class'=>'btn btn-danger', 'type'=>'submit')) }}--}}
        	{!! Form::close() !!}
        </div>
          </div>	

  </div>
</div>
    </div>
@endsection