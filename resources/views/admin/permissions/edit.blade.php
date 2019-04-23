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
        <li class="active">Edit Permissions</li>
        <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
      </ol>

        
        @include('layouts.partials.alerts')

          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Permissions</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            
            <div class="box-body">
                
	@if (count($errors) > 0)
		<div class="alert alert-danger">
			<strong>Whoops!</strong> There were some problems with your input.<br><br>
			<ul>
				@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
				@endforeach
			</ul>
		</div>
	@endif
        {!! Form::model($permission, ['method' => 'PATCH','route' => ['admin.permissions.update', $permission->id]]) !!}
	{{--{!! Form::model($permission, ['method' => 'PATCH','url' => ['admin/permissions/'.$permission->id.'/update']]) !!}--}}
            <div class="form-group">
                <strong>Name:</strong>
                {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
            </div>

            <div class="form-group">
                <strong>Display Name:</strong>
                {!! Form::text('display_name', null, array('placeholder' => 'Display Name','class' => 'form-control')) !!}
            </div>

            <div class="form-group">
                <strong>Description:</strong>
                {!! Form::textarea('description', null, array('placeholder' => 'Description','class' => 'form-control','style'=>'height:100px')) !!}
            </div>

				<button type="submit" class="btn bg-blue">Submit</button>
				        </div>
	</div>
	{!! Form::close() !!}
            </div>
    </section>
  </div>
	</div>
@endsection