@extends('layouts.app')

@section('main-content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      @role(('super-admin')||('admin')||('statff'))
        Request Closed
      @endrole
       @role(('super-admin')||('admin')||('statff'))
       Approval Closed
      @endrole
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">
        @role(('super-admin')||('admin')||('statff'))
        Request Closed
        @endrole
       @role(('super-admin')||('admin')||('statff'))
         Approval Closed
        @endrole
        </li>
          <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
 <!--      <div class="error-page"> -->
    <!--     <h2 class="headline text-yellow"> 403</h2> -->

        <div class="error-content">
            @role(('super-admin')||('admin')||('statff'))
          <h3><i class="fa fa-warning text-yellow"></i> Oops! <br> Requests are only Accepted from {{$startTime}} to {{$endTime}} daily.</h3>

         The Request portal will be opened in the next:
         @endrole

            @role(('super-admin')||('admin')||('statff'))
          <h3><i class="fa fa-warning text-yellow"></i> Oops! <br> Approvals are only Accepted from {{$startTime}} to {{$endTime}} daily.</h3>

           The Approval portal will be opened in the next:
           @endrole

           <h2 style="color: orange"> <i class="fa fa-clock-o" > </i> <i id="demo"> </i></h2>
            <p>
            <a href="{{ url('/machine_requests') }}">return to transactions</a>
          </p>

        </div>
        <!-- /.error-content -->


      <!-- /.error-page -->

    </section>
    <!-- /.content -->
  </div>



<script>
// Set the date we're counting down to
var countDownDate = new Date("{{$tomorrow}} {{$startTime}}").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    // var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = hours + "h "
    + minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
    }
}, 1000);
</script>
  @stop