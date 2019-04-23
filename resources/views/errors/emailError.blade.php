@extends('layouts.front.app')

@section('content')
    <div class="error-page">
        <h2 class="headline text-yellow"> Please Register Unique Email</h2>
        <div class="error-content">
            <h3><i class="fa fa-warning text-yellow"></i> Oops! the same Email or Phone Number have been registered Error</h3>
            <p>Please check that you have not registered this email or the phone number before..</p>
        </div><!-- /.error-content -->
    </div><!-- /.error-page -->
@endsection
