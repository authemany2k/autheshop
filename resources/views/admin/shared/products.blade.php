@if(isset($products))
    <table class="table">
        <tbody>
        <tr>
            <td class="col-md-1">Name</td>
            <td class="col-md-2">Description</td>
            <td class="col-md-2">Specification</td>
            <td class="col-md-1">Cover</td>
            {{--<td class="col-md-1">3rd Cover</td>--}}
            <td class="col-md-1">Quantity</td>
            <td class="col-md-1">Price</td>
            <td class="col-md-1">Seller</td>
            <td class="col-md-1">Status</td>
            <td class="col-md-2">Actions</td>
        </tr>
        </tbody>
        <tbody>
        @foreach ($products as $product)
            <tr>
                <td><a href="{{ route('admin.products.show', $product->id) }}">{{ $product->name }}</a></td>
                <td>{!! $product->description !!}</td>
                <td>{!!$product->specification!!}</td>
                <td class="text-center">
                    @if(isset($product->cover))
                        <img style="height: 90px !important; width:72px !important" src="{{ asset("uploads/$product->cover") }}" alt="" class="img-responsive">
                    @else
                        -
                    @endif
                </td>

                <td>{{ $product->quantity }}</td>
                <td><b>‎&#8358;</b>{{ $product->price }}</td>

                <td>
                    @if($product->seller_id !="")
                    {{$product->seller->name}}
                    @endif
                </td>

                <td>@include('layouts.status', ['status' => $product->status])</td>
                <td>
                    <form action="{{ route('admin.products.destroy', $product->id) }}" method="post" class="form-horizontal">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="delete">
                        <div class="btn-group">
                            <a href="{{ route('admin.products.edit', $product->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                            <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Delete</button>
                        </div>
                    </form>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endif