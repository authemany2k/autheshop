<head>

    <meta charset="UTF-8">
    <title>{{ site_name() }} - Admin Dashboard</title>
    <title>DANGOTE BUSINESS CENTER @if(isset($pageTitle))- @yield('htmlheader_title', $pageTitle) @endif</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="{{asset('font-awesome/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{asset('font-awesome/css/font-awesome.css') }}">
    <!-- Custom CSS style -->
    <link href="{{ asset('/css/all.css') }}" rel="stylesheet" type="text/css" />
    <script src="{{ asset('/plugins/jQuery/jQuery-2.1.4.min.js') }}"></script>
    {{--<meta name="viewport" content="width=device-width">--}}
    {{--<title>{{ site_name() }} - Admin Dashboard</title>--}}

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="stylesheet" href="{{asset('bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet" href="{{asset('sweetalert/dist/sweetalert.css')}}">

    <link rel="stylesheet" href="{{asset('plugins/datepicker/datepicker3.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/daterangepicker/daterangepicker.css')}}">
    <link href="{{asset('bootstrap/css/bootstrap-datepicker.css')}}" rel="stylesheet">
    <link href="{{asset('bootstrap-datetime-picker/bootstrap-datetimepicker.min.css')}}" rel="stylesheet">



    {{--<link rel="stylesheet" href="{{asset('plugins/datatables/dataTables.bootstrap.css') }}">--}}
    {{--<link rel="stylesheet" href="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}">--}}
    {{--<link rel="stylesheet" href="{{ asset('plugins/datatables/dataTables.bootstrap.min.js') }}">--}}
    {{--<link rel="stylesheet" href="{{ asset('plugins/slimScroll/jquery.slimscroll.min.js') }}">--}}
    {{--<link rel="stylesheet" href="{{asset('plugins/datatables/dataTables.fixedColumns.min.js')}}">--}}


    {{--<link rel="stylesheet" href="{{asset('dist/css/AdminLTE.min.css') }}">--}}
    <link rel="stylesheet" href="{{asset('summernote/summernote.css') }}">
    <link rel="stylesheet" href="{{asset('dist/css/skins/skin-purple.min.css') }}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>


    <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
    <!--<link rel="stylesheet" href="/resources/demos/style.css">-->
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->


    <![endif]-->
    <style type="text/css">
        .company-name{
            text-align: center;
            padding: 2px;
            margin-bottom: -50px;
            color: #fff;
            font-size: 25px;
            font-weight: bold;
            width: 80%;
        }

        .main-footer {
            text-align: center;
            padding: 10px;
            bottom: 0;
            left: 0;
            position: fixed;
            right: 0;
            z-index: 999;
        }
    </style>

</head>
