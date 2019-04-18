@if(count($reviews = $product->getReviews()) >0)
    @if(count($product->review >0))
    <table class="table table-responsive">
        <tr>
            <th>Name</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Date</th>
        </tr>

        @foreach($reviews as $review)

            <tr>
                <td>{{$review->customer->name }} </td>
                <td>{{ $review->star }}</td>
                <td>{{ $review->comment }}</td>
                <td>{{ $review->created_at }}</td>
            </tr>
        @endforeach
    </table>
@endif
@endif

