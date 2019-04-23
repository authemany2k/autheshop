<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-9325492-23"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', '{{ env('GOOGLE_ANALYTICS') }}');
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }}</title>
    <title>Authemanshop</title>
    <meta name="description" content="Autheman Online Shop">
    <meta name="tags" content="modern, laravel, php, php7, symfony, shop, shopping, responsive, fast, software, blade, cart, test driven, adminlte, storefront">
    <meta name="author" content="Authemany2k">
    <link href="{{ asset('css/style.min.css') }}" rel="stylesheet">

    <link rel="icon" type="image/png" href="{{asset('web/images/favicon.png')}}">
    <link href="{{ asset('front/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('front/style.css') }}" rel="stylesheet">
    <link href="{{ asset('front/css/star-rating.min.css') }}" rel="stylesheet">
    <link href="{{ asset('front/css/open-iconic-bootstrap.min.css') }}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="apple-touch-icon" sizes="57x57" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="60x60" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="72x72" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="114x114" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="120x120" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="144x144" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="152x152" href="{{ asset('favicons/favicon.png')}}">
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('favicons/favicon.png')}}">
    <link rel="icon" type="image/png" sizes="192x192" href="{{ asset('favicons/favicon.png')}}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicons/favicon.png')}}">
    <link rel="icon" type="image/png" sizes="96x96" href="{{ asset('favicons/favicon.png')}}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicons/favicon.png')}}">
    <link rel="manifest" href="{{ asset('favicons/manifest.json')}}">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="{{ asset('favicons/favicon.png')}}">
    <meta name="theme-color" content="#ffffff">
    @yield('css')
    <meta property="og:url" content="{{ request()->url() }}"/>
@yield('og')
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="{{ asset('https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js') }}"></script>

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <link href="{{ asset('bower/css/star-rating.css') }}" media="all" rel="stylesheet" type="text/css"/>

    <!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
    <link href="{{ asset('bower/themes/krajee-svg/theme.css') }}" media="all" rel="stylesheet" type="text/css"/>

    <!-- important mandatory libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
    <script src="{{ asset('bower/js/star-rating.js') }}" type="text/javascript"></script>

    <!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
    <script src="{{ asset('bower/themes/krajee-svg/theme.js') }}"></script>

    <!-- optionally if you need translation for your language then include locale file as mentioned below -->
    <script src="{{ asset('bower/js/locales/<lang>.js') }}"></script>

{{--bower ends here--}}


@section('css')
@show
<!-- from bello -->
    <style>
        @media only screen and (max-width: 600px) {
            .mobile-hide {
                display: none !important;
            }
        }

        @media only screen and (min-width: 600px) {
            .desktop-hide {
                display: none !important;
            }
        }
    </style>
    <!-- end -->

</head>
<body>
<noscript>
    <p class="alert alert-danger">
        You need to turn on your javascript. Some functionality will not work if this is disabled.
        <a href="https://www.enable-javascript.com/" target="_blank">Read more</a>
    </p>
</noscript>
<section>
    <div class="row hidden-xs">
        <div class="container">
            <div class="clearfix"></div>
            <div class="pull-right">
                <ul class="nav navbar-nav navbar-right">
                    @if(auth()->check())
                        <li><a href="{{ route('accounts') }}"><i class="fa fa-home"></i> My Account</a></li>
                        <li><a href="{{ route('logout') }}"><i class="fa fa-sign-out"></i> Logout</a></li>
                    @else
                        <li><a href="{{ route('login') }}"> <i class="fa fa-lock"></i> Login</a></li>
                        <li><a href="{{ route('register') }}"> <i class="fa fa-sign-in"></i> Register</a></li>
                    @endif
                    <li id="cart" class="menubar-cart">
                        <a href="{{ route('cart.index') }}" title="View Cart" class="awemenu-icon menu-shopping-cart">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <span class="cart-number">{{ $cartCount }}</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <header id="header-section">
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header col-md-3">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand fa fa-home " href="{{ route('home') }}">{{ config('app.name') }}</a>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-9">
                    @include('layouts.front.header-cart')
                </div>
            </div>
        </nav>
    </header>
    <div class="row">
        <div class="col-12">

            @if(session()->has('notificationText'))
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong> {{ session()->get('notificationText') }}
                </div>
            @endif

        </div>
    </div>
</section>
@yield('content')

@include('layouts.front.footer')


<script>
    $(document).ready(function () {
        $(".alert").fadeTo(3500, 600).slideUp(400, function () {
            $(".alert").slideUp(600);
        });
    });
</script>

{{--<script src="{{ asset('js/front.min.js') }}"></script>--}}
{{--<script src="{{ asset('js/custom.js') }}"></script>--}}
@yield('js')
</body>
</html>

{{--@section('js')--}}
{{--@show--}}
{{--</body>--}}
{{--</html>--}}