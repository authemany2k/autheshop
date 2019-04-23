@if(count($wishlists) <= 0)
    <p>Sorry No Wishlists Found</p>
@else

    <div class="card">
        <div class="card-header">
            My Wishlist
        </div>
        <div class="card-body">
            <table class="table table-responsive">
                <thead>
                <th>Product Title</th>
                <th>Product Image</th>
                <th>Action</th>
                </thead>
                <tbody>

                @foreach($wishlists as $wishlist)
                    <?php $pic = $wishlist->product->cover; ?>
                    <tr>
                        <td> <a href=" {{ url( '/'.$wishlist->product->slug.'/') }}"> {{ $wishlist->product->name }}</a></td>
                        <td>
                            <?php
                            //dd();
                            ?>
                            @if(isset($wishlist->product->cover) && is_string($wishlist->product->cover))
                                <img alt="{{ $wishlist->product->name }}"
                                     class="img-responsive"
                                     style="max-height: 75px"
                                     src="{{ asset("uploads/$pic") }}"/>
                            @else
                                <img alt="{{ $wishlist->product->name }}"
                                     class="img-responsive"
                                     style="max-height: 75px"
                                     src="{{ asset('/img/avatar.png') }}"/>
                            @endif
                        </td>
                        <td>
                            <a class="btn btn-danger"
                               href="{{ route('wishlist.remove', $wishlist->product->slug ) }}">Remove from
                                Wishlist</a>
                        </td>
                    </tr>
                @endforeach

                </tbody>
            </table>
        </div>
    </div>
@endif

