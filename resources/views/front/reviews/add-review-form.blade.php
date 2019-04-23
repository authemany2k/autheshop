<form action="{{ route('review.store') }}" method="post">
    {{ csrf_field() }}


    <div class="form-group {{ $errors->has('star') ? ' has-error' : '' }}">
        <p>Please Select Rating</p>

        <div class="col-12">
            <div id="rating"></div>
        </div>
        <input type="hidden" id="rating" name="star" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1" value="">
        {{--<input id="rating" type="text" class="rating" data-size="lg" >--}}
        @if ($errors->has('star'))
            <p>
            <span class="help-block">
                <strong>{{ $errors->first('star') }}</strong>
            </span>
            </p>
        @endif
    </div>

    @if(!Auth::check())

        <div class="form-group">
            <label for="first_name">Name</label>
            <input type="text" name="name" class="form-control" id="name"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" class="form-control" id="email"/>
        </div>

    @endif

    <div class="form-group">
        <textarea name="comment" style="align-content: left" class="form-control"></textarea>
    </div>

    <input type="hidden" name="product_id" value="{{ $product->id }}"/>

    <div class="form-group">
        <button type="submit">Create Review</button>
    </div>

</form>


@push('scripts')
<script>
    $(document).ready(function () {
        $("#rating").rating({
            filledStar: '<i class="oi oi-star"></i>',
            emptyStar: '<i class="oi oi-star"></i>'
        });
        // $("#rating").rating({'size':'lg'});
    })
</script>
@endpush
