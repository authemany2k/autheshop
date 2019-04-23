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
        <li><a href="{{url('admin/roles') }}"><i class="fa fa-dashboard"></i> Role</a></li>
        <li class="active">Create New Role</li>
          <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
      </ol>
    {{--</section>--}}


    {{--<section class="content">--}}
        
        @include('layouts.partials.alerts')

          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Create New Role</h3>

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
	{{--{!! Form::open(array('url' => 'admin/roles/store','method'=>'POST')) !!}--}}
        {!! Form::open(array('route' => 'admin.roles.store','method'=>'POST')) !!}

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

            <div class="form-group">
                <strong>Permission:</strong>
                <br/>
                @foreach($permission as $value)
                	<label>{{ Form::checkbox('permission[]', $value->id, false, array('class' => 'name')) }}
                	{{ $value->display_name }}</label>
                	<br/>
                @endforeach
            </div>


				<button type="submit" class="btn bg-blue">Submit</button>

	</div>
	{!! Form::close() !!}
            </div>
    </section>
  </div>
</div>
    </div>
@endsection