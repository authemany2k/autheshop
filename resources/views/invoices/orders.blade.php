<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order Invoice</title>
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <style type="text/css">
        table { border-collapse: collapse;}
    </style>
</head>
<body>
    <section class="row">
        <div class="pull-left">
            Invoice to: {{$customer->name}} <br />
            Deliver to: <strong>{{ $address->alias }} <br /></strong>
            {{ $address->address_1 }} {{ $address->address_2 }} <br />
            {{ $address->city }} {{ $address->province }} <br />
            {{ $address->country }}
        </div>
        <div class="pull-right">
            From: {{config('app.name')}}
        </div>
    </section>
    <section class="row">
        <div class="col-md-12">
            <h2>Details</h2>
            <table class="table table-striped" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>SKU</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Seller</th>
                        <th>Quantity</th>
                        <th>Price(NGN)</th>
                        <th>Price Breakdown</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($products as $product)
                    <tr>
                        <td>{{$product->sku}}</td>
                        <td>{{$product->name}}</td>
                        <td>{{$product->description}}</td>
                        <td>{{$product->seller->name}}</td>
                        {{--<td> @if(isset($cartItem->options))@endif</td>--}}
                        <td>{{$product->pivot->quantity}}</td>
                        <td>NGN {{$product->price}}</td>
                        <td> NGN {{number_format($product->price * $product->pivot->quantity, 2)}}</td>
                    </tr>
                @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Subtotal:</td>
                        <td>NGN {{$order->total_products}}</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Delivery:</td>
                        <td style="color: red">NGN {{$order->courier->cost}}</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Discounts:</td>
                        <td>NGN {{$order->discounts}}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Tax:</td>
                        <td>NGN {{$order->tax}}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><strong>Total:</strong></td>
                        <td><strong>NGN {{$order->total}}</strong></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </section>
</body>
</html>