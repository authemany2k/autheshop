@extends('layouts.front.app-web')
<!-- top-header -->
<div class="header-most-top">
    {{--<p>Authemanshop Your Shopping Delight!</p>--}}
</div>
<!-- //top-header -->
<!-- header-bot-->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">


        <div class="col-md-4 logo_agile">
            <h1>
                <a href="{{ url('category/new-arrivals') }}">
                    <span>S</span>HOP
                    <span>N</span>OW
                    <img src="{{ asset('web/images/logo.png')}}" alt=" ">
                </a>
            </h1>
        </div>


    {{--<div class="col-md-4 logo_agile">--}}
    {{--<h6>--}}
    {{--<a class="button2" href="{{ url('category/new-arrivals') }}">Shop Now </a>--}}
    {{--</h6>--}}
    {{--<div class="clearfix"></div>--}}
    {{--</div>--}}
    <!-- header-bot-->
        <div class="col-md-4 logo_agile">

        </div>
        <!-- header-bot -->
    {{--<div class="col-md-8 header">--}}
    <!-- header lists -->
    {{--<ul>--}}

    {{--</ul>--}}
    <!-- //header lists -->
        <!-- search -->


        <div class="clearfix"></div>
    {{--<div class="agileits_search">--}}
    {{--<!-- search form -->--}}
    {{--<form action="{{route('search.product')}}" method="GET"  >--}}
    {{--<div class="input-group">--}}
    {{--<input type="text" name="q" class="form-control" placeholder="Search..." value="{!! request()->input('q') !!}" required>--}}
    {{--<span class="input-group-btn">--}}
    {{--<button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> Search</button>--}}
    {{--</span>--}}
    {{--</div>--}}
    {{--</form>--}}
    {{--<!-- /.search form -->--}}
    {{--</div>--}}
    <!-- //search -->
        <!-- cart details -->

        <!-- //cart details -->
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
    {{--</div>--}}
</div>
<!-- shop locator (popup) -->
<!-- Button trigger modal(shop-locator) -->

<!-- //shop locator (popup) -->
<!-- signin Model -->
<!-- Modal1 -->

<!-- //navigation -->
<!-- banner -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
    </ol>

    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                    <h3>Big
                        <span>Save</span>
                    </h3>
                    <p>Get flat
                        <span>10%</span> Cashback</p>
                    <a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>
                </div>
            </div>
        </div>
        <div class="item item2">
            <div class="container">
                <div class="carousel-caption">
                    <h3>Healthy
                        <span>Saving</span>
                    </h3>
                    <p>Get Upto
                        <span>30%</span> Off</p>
                    <a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>
                </div>
            </div>
        </div>
        <div class="item item3">
            <div class="container">
                <div class="carousel-caption">
                    <h3>Big
                        <span>Deal</span>
                    </h3>
                    <p>Get Best Offer Upto
                        <span>20%</span>
                    </p>
                    <a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>
                </div>
            </div>
        </div>
        <div class="item item4">
            <div class="container">
                <div class="carousel-caption">
                    <h3>Today
                        <span>Discount</span>
                    </h3>
                    <p>Get Now
                        <span>40%</span> Discount</p>
                    <a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- //banner -->

































{{--@extends('layouts.front.app-web')--}}
{{--<!-- top-header -->--}}
{{--<div class="header-most-top">--}}
    {{--<p>Authemanshop Your Shopping Delight!</p>--}}
{{--</div>--}}
{{--<!-- //top-header -->--}}
{{--<!-- header-bot-->--}}
{{--<div class="header-bot">--}}
    {{--<div class="header-bot_inner_wthreeinfo_header_mid">--}}

        {{--<div class="col-md-4 logo_agile">--}}
            {{--<h6>--}}
                    {{--<a class="button2" href="{{ url('category/new-arrivals') }}">Shop Now </a>--}}
            {{--</h6>--}}
            {{--<div class="clearfix"></div>--}}
        {{--</div>--}}
        {{--<!-- header-bot-->--}}
        {{--<div class="col-md-4 logo_agile">--}}

        {{--</div>--}}
        {{--<!-- header-bot -->--}}
        {{--<div class="col-md-8 header">--}}
            {{--<!-- header lists -->--}}
            {{--<ul>--}}

            {{--</ul>--}}
            {{--<!-- //header lists -->--}}
            {{--<!-- search -->--}}


            {{--<div class="clearfix"></div>--}}
            {{--<div class="agileits_search">--}}
                {{--<!-- search form -->--}}
                {{--<form action="{{route('search.product')}}" method="GET"  >--}}
                    {{--<div class="input-group">--}}
                        {{--<input type="text" name="q" class="form-control" placeholder="Search..." value="{!! request()->input('q') !!}" required>--}}
                        {{--<span class="input-group-btn">--}}
                        {{--<button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> Search</button>--}}
                    {{--</span>--}}
                    {{--</div>--}}
                {{--</form>--}}
                {{--<!-- /.search form -->--}}
            {{--</div>--}}
            {{--<!-- //search -->--}}
            {{--<!-- cart details -->--}}

            {{--<!-- //cart details -->--}}
            {{--<div class="clearfix"></div>--}}
        {{--</div>--}}
        {{--<div class="clearfix"></div>--}}
    {{--</div>--}}
{{--</div>--}}
{{--<!-- shop locator (popup) -->--}}
{{--<!-- Button trigger modal(shop-locator) -->--}}

{{--<!-- //shop locator (popup) -->--}}
{{--<!-- signin Model -->--}}
{{--<!-- Modal1 -->--}}

{{--<!-- //navigation -->--}}
{{--<!-- banner -->--}}
{{--<div id="myCarousel" class="carousel slide" data-ride="carousel">--}}
    {{--<!-- Indicators-->--}}
    {{--<ol class="carousel-indicators">--}}
        {{--<li data-target="#myCarousel" data-slide-to="0" class="active"></li>--}}
        {{--<li data-target="#myCarousel" data-slide-to="1" class=""></li>--}}
        {{--<li data-target="#myCarousel" data-slide-to="2" class=""></li>--}}
        {{--<li data-target="#myCarousel" data-slide-to="3" class=""></li>--}}
    {{--</ol>--}}

    {{--<div class="carousel-inner" role="listbox">--}}
        {{--<div class="item active">--}}
            {{--<div class="container">--}}
                {{--<div class="carousel-caption">--}}
                    {{--<h3>Big--}}
                        {{--<span>Save</span>--}}
                    {{--</h3>--}}
                    {{--<p>Get flat--}}
                        {{--<span>10%</span> Cashback</p>--}}
                    {{--<a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
        {{--<div class="item item2">--}}
            {{--<div class="container">--}}
                {{--<div class="carousel-caption">--}}
                    {{--<h3>Healthy--}}
                        {{--<span>Saving</span>--}}
                    {{--</h3>--}}
                    {{--<p>Get Upto--}}
                        {{--<span>30%</span> Off</p>--}}
                    {{--<a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
        {{--<div class="item item3">--}}
            {{--<div class="container">--}}
                {{--<div class="carousel-caption">--}}
                    {{--<h3>Big--}}
                        {{--<span>Deal</span>--}}
                    {{--</h3>--}}
                    {{--<p>Get Best Offer Upto--}}
                        {{--<span>20%</span>--}}
                    {{--</p>--}}
                    {{--<a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
        {{--<div class="item item4">--}}
            {{--<div class="container">--}}
                {{--<div class="carousel-caption">--}}
                    {{--<h3>Today--}}
                        {{--<span>Discount</span>--}}
                    {{--</h3>--}}
                    {{--<p>Get Now--}}
                        {{--<span>40%</span> Discount</p>--}}
                    {{--<a class="button2" href="{{ url('category/new-arrivals') }}">Get it now </a>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
    {{--<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">--}}
        {{--<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>--}}
        {{--<span class="sr-only">Previous</span>--}}
    {{--</a>--}}
    {{--<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">--}}
        {{--<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>--}}
        {{--<span class="sr-only">Next</span>--}}
    {{--</a>--}}
{{--</div>--}}
{{--<!-- //banner -->--}}
