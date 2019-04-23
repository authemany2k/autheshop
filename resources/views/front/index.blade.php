@extends('layouts.front.app')
<link rel="stylesheet" type="text/css" href="{{ asset('web/css/jquery-ui1.css') }}">
@section('content')
    @include('layouts.front.home-slider')


    <!-- top Products -->
    <div class="ads-grid">
        <div class="container">
            <!-- tittle heading -->

            <!-- //tittle heading -->
            <!-- product left -->
            <div class="side-bar col-md-3">

                <div class="search-hotel">

                    <h3 class="agileits-sear-head">Search Here..</h3>

                    <form action="{{route('search.product')}}" method="GET"  >
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..." value="{!! request()->input('q') !!}" required>
                            <span class="input-group-btn">
                        <button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> Search</button>
                    </span>
                        </div>
                    </form>

                </div>

                <!-- min-max -->
                <div class="left-side mobile-hide">
<!-- from here bello -->

             <input type="hidden" name="hidden_filter" id="hidden_filter_url" value="{{url('/filter_products')}} ">
                    
                    <h3 class="agileits-sear-head">Show filtered Items Only</h3>
                   
                    <button onclick="filter()" class="btn btn-flat"> <i class="fa fa-search"></i> Filter By &dArr;</button>
                    <hr>
                    {{--<h3 class="agileits-sear-head">Show only</h3>--}}
                    <ul>
                        <li>
                            <h4 style="color: #ff5722">Price Range</h4>
                            <input type="number"  id = "min" value="0">
                            <span class="span">Min</span>
                        </li>
                        <li>
                            <input type="number"  id = "max" value="1000000">
                            <span class="span">Max</span>
                        </li>
                    </ul>
                </div>

                <!-- //min max -->

                {{--<!-- price range -->--}}
                {{--<div class="range">--}}
                    {{--<h3 class="agileits-sear-head">Price range</h3>--}}
                    {{--<ul class="dropdown-menu6">--}}
                        {{--<li>--}}

                            {{--<div id="slider-range"></div>--}}
                            {{--<input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />--}}
                        {{--</li>--}}
                    {{--</ul>--}}
                {{--</div>--}}
                {{--<!-- //price range -->--}}


                {{--<!-- price range -->--}}
                {{--<div class="slidecontainer">--}}
                    {{--<h3 class="agileits-sear-head">Price range</h3>--}}
                    {{--<ul class="dropdown-menu6">--}}
                        {{--<li>--}}
                            {{--<div id="slider-range"></div>--}}
                            {{--<input type="range" min="0" max="1000000" value="500000" class="slider" id="myRange">--}}
                            {{--<p>Value: <span id="price"></span></p>--}}
                        {{--</li>--}}
                    {{--</ul>--}}
                {{--</div>--}}
                {{--<!-- //price range -->--}}

                <!-- food preference -->
                {{--<div class="left-side">--}}
                    {{--<h3 class="agileits-sear-head">Show only</h3>--}}
                    {{--<ul>--}}
                        {{--<li>--}}
                            {{--<input type="checkbox" class="checked" id = "premium">--}}
                            {{--<span class="span">Premium Items</span>--}}
                        {{--</li>--}}
                        {{--<li>--}}
                            {{--<input type="checkbox" class="checked" id = "nonpremium">--}}
                            {{--<span class="span">Non-Premium Items</span>--}}
                        {{--</li>--}}
                    {{--</ul>--}}
                {{--</div>--}}

                <div class="left-side mobile-hide">


                    <h3 class="agileits-sear-head">Category</h3>
                    <ul>
                        {{--<li>--}}
                        {{--<input type="checkbox" class="checked" name="categories" id = "electronics" value="electronics">--}}
                        {{--<span class="span">Electronics</span>--}}
                        {{--</li>--}}

                        <li>
                            <input type="checkbox" class="checked" name="ladies-wear" id = "ladies-wear" value="ladies-wear">
                            <span class="span">Ladies Wear</span>
                        </li>


                        <li>
                            <input type="checkbox" class="checked" name="categories" id = "mens-wear" value="mens-wear">
                            <span class="span">Mens' Wear</span>
                        </li>

                        <li>
                            <input type="checkbox" class="checked" name="categories" id = "children" value="children">
                            <span class="span">Children</span>
                        </li>

                        <li>
                            <input type="checkbox" class="checked" name="categories" id = "phones" value="phones">
                            <span class="span">Phones</span>
                        </li>

                        <li>
                            <input type="checkbox" class="checked" name="categories" id = "new-arrivals" value="new-arrivals">
                            <span class="span">New Arrivals</span>
                        </li>

                        {{--<li>--}}
                            {{--<input type="checkbox" class="checked" name="categories" id = "featured" value="featured">--}}
                            {{--<span class="span">Featured</span>--}}
                        {{--</li>--}}

                        <li>
                            <input type="checkbox" class="checked" name="categories" id = "shoes" value="shoes">
                            <span class="span">Shoes</span>
                        </li>

                    </ul>
                </div>

                <!-- //food preference -->
                <!-- discounts -->
                <div class="left-side mobile-hide">
                    <h3 class="agileits-sear-head">Discount</h3>
                    <ul>
                        <li>
                            <input type="checkbox" class="checked">
                            <span class="span">5% or More</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked">
                            <span class="span">10% or More</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked">
                            <span class="span">20% or More</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked">
                            <span class="span">30% or More</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked">
                            <span class="span">50% or More</span>
                        </li>
                    </ul>
                </div>
                <!-- //discounts -->
                <!-- reviews -->
                <div class="customer-rev left-side mobile-hide">
                    <h3 class="agileits-sear-head">Customer Review</h3>
                    <ul>
                        <li>
                            {{--<a href="#">--}}
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <span>5.0</span>
                            {{--</a>--}}
                        </li>
                        <li>
                            {{--<a href="#">--}}
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                <span>4.0</span>
                            {{--</a>--}}
                        </li>
                        <li>
                            {{--<a href="#">--}}
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                <span>3.5</span>
                            {{--</a>--}}
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                <span>3.0</span>
                            </a>
                        </li>
                        <li>
                            {{--<a href="#">--}}
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                <span>2.5</span>
                            {{--</a>--}}
                        </li>
                    </ul>
                </div>
                <!-- //reviews -->
                <!-- cuisine -->

  <div class="left-side mobile-hide">
                <input type="hidden" name="hidden_filter" id="hidden_filter_url" value="{{url('/filter_products')}} ">
                {{--<button onclick="filter()">Filter</button>--}}
                <button onclick="filter()" class="btn btn-flat"> <i class="fa fa-search"></i> Filter</button>
                <!-- //cuisine -->
                <!-- deals -->
                <!-- </div> -->
                <div class="deal-leftmk left-side">

                </div>
                <!-- //deals -->
            </div></div>
            <!-- //product left -->

            <!-- product right -->
            <div class="agileinfo-ads-display col-md-9">
                <div id="products_res" class="wrapper">
                    <!-- first section (nuts) -->
                    <div class="product-sec1">
                        <h3 class="tittle-w3l">New Arrivals<span class="heading-style"><i></i><i></i><i></i></span></h3>
                        @if(!is_null($newests))
                            @include('front.products.product-list', ['products' => $newests])

                            {{--@if($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator)--}}
                                {{--<div class="row">--}}
                                    {{--<div class="col-md-12">--}}
                                        {{--{{ $products->links() }}--}}
                                        {{--<div class="pull-left" id = "pagination">{{ $products->links() }}</div>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--@endif--}}

                            <div id="browse-all-btn"> <a class="btn btn-warning browse-all-btn" href="{{ route('front.category.slug', $category4->slug) }}" role="button">browse all items</a></div>
                            {{--{{ $products->links() }}--}}


                        @endif

                        <div class="clearfix"></div>
                    </div>

                    <!-- //third section (oils) -->
                    <!-- fourth section (noodles) -->
                    <div class="product-sec1 product-sec2">
                        <div class="col-xs-7 effect-bg">
                            <h3 class="">Adverts!!!!</h3>
                            <h6>FOR ADVERT SPACE</h6>
                            <p>Please call +2349053910671</p>
                        </div>
                        {{--<h3 class="w3l-nut-middle">Selected Items</h3>--}}
                        <h3 class="w3l-nut-middle">Advert Space!</h3>
                        <div class="col-xs-5 bg-right-nut">
                            {{--<img src="images/paradise4.fw.png" alt="">--}}
                            <img src="{{asset('images/paradise5.fw.png')}}" alt=" " class="img-responsive">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- //second section (nuts special) -->
                    <!-- third section (oils) -->
                    <div class="product-sec1">
                        <h3 class="tittle-w3l">Featured Products
                            <span class="heading-style"><i></i><i></i><i></i></span>
                        </h3>
                        @if(!is_null($features))
                            @include('front.products.product-list', ['products' => $features])
                            {{--{{ $features->links() }}--}}
                            <div id="browse-all-btn"> <a class="btn btn-warning browse-all-btn" href="{{ route('front.category.slug', $category11->slug) }}" role="button">browse all items</a></div>
                        @endif
                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <hr/>

    {{--<hr>--}}
    {{--@if(!is_null($features))--}}
    {{--<div class="container">--}}
    {{--<div class="section-title b100">--}}
    {{--<h2>Featured Products</h2>--}}
    {{--</div>--}}
    {{--@include('front.products.product-list', ['products' => $features])--}}
    {{--<div id="browse-all-btn"> <a class="btn btn-default browse-all-btn" href="{{ route('front.category.slug', $category11->slug) }}" role="button">browse all items</a></div>--}}
    {{--<div id="browse-all-btn"> <a class="btn btn-default browse-all-btn" href="{{url('category/newest')}}" role="button">browse all items</a></div>--}}
    {{--</div>--}}
    {{--@endif--}}
    {{--<hr />--}}

    @include('mailchimp::mailchimp')


    <script>
        var slider = document.getElementById("myRange");
        var output = document.getElementById("price");
        output.innerHTML = slider.value;

        slider.oninput = function() {
            output.innerHTML = this.value;
        }

        function filter(){
            var min_price = $("#min").val();
            var max_price = $("#max").val();
             var categories = [];
           // use name or class name
           $('input[name=categories]').each(function(){
             if($(this).prop('checked')){
               categories.push($(this).val())
             }
           });
           
          
            var filter_url = '/filter_products';
            $.get(filter_url,
               {min_price: min_price, max_price: max_price, categories: categories},
            function(htmlcode){
                    $("#products_res").html(htmlcode);
                });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("select").select2();
        });
    </script>


    <!-- price range (top products) -->
    {{--<script src="js/jquery-ui.js"></script>--}}
    {{--<script>--}}
        {{--//<![CDATA[--}}
        {{--$(window).load(function () {--}}
            {{--$("#slider-range").slider({--}}
                {{--range: true,--}}
                {{--min: 0,--}}
                {{--max: 9000,--}}
                {{--values: [50, 6000],--}}
                {{--slide: function (event, ui) {--}}
                    {{--$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);--}}
                {{--}--}}
            {{--});--}}
            {{--$("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));--}}

        {{--}); //]]>--}}
    {{--</script>--}}
    <!-- //price range (top products) -->


@endsection



