<div class="row">
    <div class="col-md-6">
        <ul id="thumbnails" class="col-md-4 list-unstyled">
            <li>
                <a href="javascript: void(0)">
                    @if(isset($product->cover))
                        <img class="img-responsive img-thumbnail"
                             src="{{ asset("uploads/$product->cover") }}"
                             alt="{{ $product->name }}" />
                    @else
                        <img class="img-responsive img-thumbnail"
                             src="{{ asset("https://placehold.it/180x180") }}"
                             alt="{{ $product->name }}" />
                    @endif
                </a>
            </li>
            @if(isset($images) && !$images->isEmpty())
                @foreach($images as $image)
                    <li>
                        <a href="javascript: void(0)">
                            <img class="img-responsive img-thumbnail"
                                 src="{{ asset("uploads/$image->src") }}"
                                 alt="{{ $product->name }}" />
                        </a>
                    </li>
                @endforeach
            @endif
        </ul>
        <figure class="text-center product-cover-wrap col-md-8">
            @if(isset($product->cover))
                <img id="main-image" class="product-cover img-responsive"
                     src="{{ asset("uploads/$product->cover") }}?w=400"
                     data-zoom="{{ asset("uploads/$product->cover") }}?w=1200">
            @else
                <img id="main-image" class="product-cover" src="https://placehold.it/300x300"
                     data-zoom="{{ asset("uploads/$product->cover") }}?w=1200" alt="{{ $product->name }}">
            @endif
        </figure>
    </div>
    <div class="col-md-6">
        <div class="product-description">
            <h1>{{ $product->name }}
                <small>&#8358; {{ $product->price }}</small>
            </h1>
            {{--<div class="description">{!! $product->description !!}</div>--}}
            <div class="excerpt">
                <hr>{!!  str_limit($product->description, 100, ' ...') !!}</div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    @include('layouts.errors-and-messages')
                    <form action="{{ route('cart.store') }}" class="form-inline" method="post">
                        {{ csrf_field() }}
                        @if(isset($productAttributes) && !$productAttributes->isEmpty())
                            <div class="form-group">
                                <label for="productAttribute">Choose Combination</label> <br />
                                <select name="productAttribute" id="productAttribute" class="form-control select2">
                                    @foreach($productAttributes as $productAttribute)
                                        <option value="{{ $productAttribute->id }}">
                                            @foreach($productAttribute->attributesValues as $value)
                                                {{ $value->attribute->name }} : {{ ucwords($value->value) }}
                                            @endforeach
                                            @if(!is_null($productAttribute->price))
                                                ( {{ config('cart.currency') }} {{ $productAttribute->price }})
                                            @endif
                                        </option>
                                    @endforeach
                                </select>
                            </div><hr>
                        @endif
                        <div class="form-group">
                            <input type="number"
                                   class="form-control"
                                   name="quantity"
                                   min="1"
                                   id="quantity"
                                   placeholder="Quantity"
                                   value="{{ old('quantity') }}" />
                            <input type="hidden" name="product" value="{{ $product->id }}" />
                        </div>
                        <button type="submit" class="btn btn-warning pull-left"><i class="fa fa-cart-plus" ></i> Add to cart</button>

                            @if(isset(Auth::user()->id) && Auth::user()->isInWishlist($product->id))
                                <a class="btn btn-danger" href="{{ route('wishlist.remove', $product->slug) }}">
                                    <i class="fa fa-cart-plus"> <strong style="color: #ffffff" >–</strong>Wishlist</i>
                                </a>
                            @else
                                <a class="btn btn-warning" href="{{ route('wishlist.add', $product->slug) }}">
                                    <i class="fa fa-cart-plus"> <strong style="color: #ffffff">+</strong>Wishlist</i>
                                </a>
                            @endif

                    </form>
                    <hr/>

                    <hr/>

                    <div class="row">

                        <div class="col-12">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item active">
                                    <a data-toggle="tab" class="nav-link" href="#description">
                                        DESCRIPTION
                                    </a>
                                </li>


                                <li class="nav-item">
                                    <a data-toggle="tab" class="nav-link" href="#specification">
                                        SPECIFICATION
                                    </a>
                                </li>


                                <li class="nav-item">
                                    <a data-toggle="tab" class="nav-link" href="#review">
                                        REVIEW
                                    </a>
                                </li>

                            </ul>

                            <div class="tab-content">
                                <div id="description" class="tab-pane active">
                                    <p>{!! $product->description !!}</p>
                                </div>

                                <div id="specification" class="tab-pane active">
                                    <p>{!! $product->specification !!}</p>
                                </div>

                                <div id="review" class="tab-pane">
                                    <div class="review-wrapper col-12">
                                        @include('front.reviews.list',['product' => $product])
                                        <div class="review-form-wrapper">
                                            <h1>Add Review</h1>
                                            @include('front.reviews.add-review-form',['product' => $product])
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@section('css')
    <link rel="stylesheet" href="{{ asset('front/css/drift-basic.min.css') }}">
    <style type="text/css">
        .product-cover-wrap {
            border: 1px solid #eee;
        }

        .product-description {
            position: relative;
        }

        .excerpt {
            display: none;
        }

        .modal-dialog .modal-content {
            min-width: 800px;
        }

        .modal-dialog h1 {
            font-size: 18px;
            text-align: left;
            line-height: 24px;
        }

        .modal-dialog h1 small {
            display: block;
            padding-top: 10px;
        }

        .modal-dialog .description,
        .modal-dialog .excerpt {
            font-size: 14px;
            line-height: 16px;
            text-align: left;
        }

        .modal-dialog .description {
            display: none;
        }

        .modal-dialog #quantity {
            width: 85px;
        }

        .modal-dialog .modal-content {
            padding: 15px;
        }

        .modal-content .excerpt {
            display: block;
            text-align: left;
        }

        #thumbnails li {
            margin-bottom: 10px;
        }

        #thumbnails li img {
            width: 100px;
        }

        #thumbnails li a:hover img {
            border: 1px solid #d89522;
        }
    </style>
@endsection
@section('js')
    <script type="text/javascript" src="{{ asset('front/js/Drift.min.js') }}"></script>
    <script type="text/javascript">
        var productPane = document.querySelector('.product-cover');
        var paneContainer = document.querySelector('.product-cover-wrap');

        new Drift(productPane, {
            paneContainer: paneContainer,
            inlinePane: false
        });

        $('#thumbnails li img').on('click', function () {
            $('#main-image')
                .attr('src', $(this).attr('src') +'?w=400')
                .attr('data-zoom', $(this).attr('src') +'?w=1200');
        });

    </script>

        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>


    <script type="text/javascript">
        $(document).ready(function() {
            $("select").select2();
        });
    </script>
@endsection