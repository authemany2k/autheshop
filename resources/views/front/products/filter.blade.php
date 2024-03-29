<ul class="row text-center list-unstyled">
    <hr>
    <div class="row">
        <div class="category-top col-md-12">
            <h2>Search Result for filtered items only </h2>
        </div>
    </div>
    <hr>
        @foreach($products as $product)
            <li class="col-md-3 col-sm-6 col-xs-12 product-list">
                <div class="single-product">
                    <div class="product">
                        {{--<span class="product-new-top">New</span>--}}
                        <span class="cart-number">New</span>
                        <div class="product-overlay">
                            <div class="vcenter">
                                <div class="centrize">
                                    <ul class="list-unstyled list-group">
                                        <li>
                                            <form action="{{ route('cart.store') }}" class="form-inline" method="post">
                                                {{ csrf_field() }}
                                                <input type="hidden" name="quantity" value="1" />
                                                <input type="hidden" name="product" value="{{ $product->id }}">
                                                <button id="add-to-cart-btn" type="submit" class="btn btn-warning" data-toggle="modal" data-target="#cart-modal"> <i class="fa fa-cart-plus"></i> Add to cart</button>
                                            </form>
                                        </li>
<!--                                         <li>  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal_{{ $product->id }}"> <i class="fa fa-eye"></i> Quick View</button>
 -->                                        <li>  <a class="btn btn-default product-btn" href="{{ route('front.get.product', str_slug($product->slug)) }}"> <i class="fa fa-link"></i> Go to product</a> </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        @if(isset($product->cover))
                            <img src="{{ asset("uploads/$product->cover") }}" alt="{{ $product->name }}" class="img-bordered img-responsive">
                        @else
                            <img src="https://placehold.it/263x330" alt="{{ $product->name }}" class="img-bordered img-responsive" />
                        @endif
                    </div>

                    <div class="product-text">
                        <h4>{{ $product->name }}</h4>
                        <p>&#8358; {{ number_format($product->price, 2) }}</p>
                    </div>
                    <!-- Modal
                    <div class="modal fade" id="myModal_{{ $product->id }}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="clearfix"><a class="btn btn-sm btn-flat btn-warning" href="{{ URL::previous() }}">Go Back</a></div>
                            <div class="modal-content">
                            </div>
                        </div>
                    </div>-->
                </div>
            </li>
        @endforeach
  
    </ul> 