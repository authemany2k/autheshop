<tr>
    <td>
        @if(isset($payment['name']))
            {{ ucwords($payment['name']) }}
        @else
            <p class="alert alert-danger">You need to have <strong>name</strong> key in your config</p>
        @endif
    </td>
    <td>
        @if(isset($payment['description']))
            {{ $payment['description'] }}
        @endif
    </td>
    <td>
        @if(isset($payment['name']))

            <form action="{{ route('checkout.store') }}" method="post" class="pull-right" id="paystackForm">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <p>
                    <input type="hidden" name="subtotal" value=" {{$subtotal}}" >
                    {{--For other necessary things you want to add to your payload. it is optional though--}}
                    <input type="hidden" name="email" value="{{$customer->email}}" required>
                    <input type="hidden" name="phone_no" value="{{$address->phone_no }}" required>
                    <input type="hidden" name="name" value="{{$customer->name }}" required>
                    {{--<input type="hidden" name="first_name" value="{{$customer->name }}" required>--}}
                    <input type="hidden" name="tax" value=" {{$tax }}" required>
                    <input type="hidden" id="total" name="total" value=" {{$total}}"  required>
                    <input type="hidden" name="payment" value="{{ config('paystack.name') }}">
                    <input type="hidden" name="description" value="{{ config('paystack.description') }}">
                    <input type="hidden" class="address_id" name="address" value="">
                    <input type="hidden" class="delivery_address_id" name="delivery_address" value="">
                    <input type="hidden" class="courier_id" name="courier" value="">
                    <input type="hidden" name="amount" value=" {{$total*100}}"  required>
                    {{--<input type="hidden" name="orderID" value="{{ $order->id }}">--}}
                    {{--//required in kobo--}}
                    {{--<input type="hidden" name="quantity" value="{{ $cartCount }}">--}}
                    <input type="hidden" name="metadata" value="{{ json_encode($array = ['key_name' => 'value',]) }}" >
                    {{--For other necessary things you want to add to your payload. it is optional though--}}
                    <input type="hidden" name="reference" value="{{Paystack::genTranxRef() }}" required>
                    <input type="hidden" name="key" value="{{ config('paystack.secretKey') }}" required>

                    <button id="paywithpaystack" class="btn btn-primary">Pay with {{ ucwords($payment['name']) }} <i class="fa fa-cc-paystack"></i></button>
                    {{--<button type="submit" class="btn btn-success pull-right">Pay via Paystack <i class="fa fa-paypal"></i></button>--}}
                </p>
            </form>

            {{--<form action="{{ route('checkout.execute') }}" method="post" class="pull-right" id="paystackForm">--}}
                {{--<input type="hidden" name="payment" value="{{ config('paystack.name') }}">--}}
                {{--<input type="hidden" name="paystackToken" value="">--}}
                {{--<input type="hidden" class="billing_address" name="billing_address" value="">--}}
                {{--<input type="hidden" class="delivery_address_id" name="delivery_address" value="">--}}
                {{--<input type="hidden" class="courier" name="courier" value="">--}}
                {{--{{ csrf_field() }}--}}
                {{--<button id="paywithpaystack" class="btn btn-primary">Pay with {{ ucwords($payment['name']) }} <i class="fa fa-cc-paystack"></i></button>--}}
            {{--</form>--}}
        @endif
    </td>
</tr>

{{--@section('js')--}}
    {{--<script type="text/javascript">--}}

        {{--function setTotal(total, shippingCost) {--}}
            {{--var computed = +shippingCost + parseFloat(total);--}}
            {{--$('#total').html(computed.toFixed(2));--}}
            {{--$('#hiden_ps_total').val(computed.toFixed(2));--}}
        {{--}--}}

        {{--function setShippingFee(cost) {--}}
            {{--$('#shippingFee').html(cost);--}}
        {{--}--}}

        {{--function setCourierDetails(courierId) {--}}
            {{--$('.courier_id').val(courierId);--}}
        {{--}--}}

        {{--$(document).ready(function () {--}}

            {{--var clicked = false;--}}

            {{--$('#sameDeliveryAddress').on('change', function () {--}}
                {{--clicked = !clicked;--}}
                {{--if (clicked) {--}}
                    {{--$('#sameDeliveryAddressRow').show();--}}
                {{--} else {--}}
                    {{--$('#sameDeliveryAddressRow').hide();--}}
                {{--}--}}
            {{--});--}}

            {{--var billingAddress = 'input[name="address"]';--}}
            {{--$(billingAddress).on('change', function () {--}}
                {{--var chosenAddressId = $(this).val();--}}
                {{--$('.address_id').val(chosenAddressId);--}}
                {{--$('.delivery_address_id').val(chosenAddressId);--}}
            {{--});--}}

            {{--var deliveryAddress = 'input[name="delivery_address"]';--}}
            {{--$(deliveryAddress).on('change', function () {--}}
                {{--var chosenDeliveryAddressId = $(this).val();--}}
                {{--$('.delivery_address_id').val(chosenDeliveryAddressId);--}}
            {{--});--}}

            {{--var courier = 'input[name="courier"]';--}}
            {{--$(courier).on('change', function () {--}}
                {{--var shippingCost = $(this).data('cost');--}}
                {{--var total = $('#total').data('total');--}}

                {{--setCourierDetails($(this).val());--}}
                {{--setShippingFee(shippingCost);--}}
                {{--setTotal(total, shippingCost);--}}
            {{--});--}}

            {{--if ($(courier).is(':checked')) {--}}
                {{--var shippingCost = $(courier + ':checked').data('cost');--}}
                {{--var courierId = $(courier + ':checked').val();--}}
                {{--var total = $('#total').data('total');--}}

                {{--setShippingFee(shippingCost);--}}
                {{--setCourierDetails(courierId);--}}
                {{--setTotal(total, shippingCost);--}}
            {{--}--}}
        {{--});--}}
    {{--</script>--}}
{{--@endsection--}}


@section('js')
    {{--<script src="{{ url('https://checkout.paystack.com/checkout.js') }}"></script>--}}
    <script type="text/javascript">

        function setTotal(total, shippingCost) {
            let computed = +shippingCost + parseFloat(total);
            $('#total').html(computed.toFixed(2));
        }

        function setShippingFee(cost) {
            el = '#shippingFee';
            $(el).html(cost);
            $('#shippingFeeC').val(cost);
        }

        function setCourierDetails(courierId) {
            $('.courier_id').val(courierId);
        }

        $(document).ready(function () {

            let clicked = false;

            $('#sameDeliveryAddress').on('change', function () {
                clicked = !clicked;
                if (clicked) {
                    $('#sameDeliveryAddressRow').show();
                } else {
                    $('#sameDeliveryAddressRow').hide();
                }
            });

            let billingAddress = 'input[name="address"]';
            $(billingAddress).on('change', function () {
                let chosenAddressId = $(this).val();
                $('.address_id').val(chosenAddressId);
                $('.delivery_address_id').val(chosenAddressId);
            });

            let deliveryAddress = 'input[name="delivery_address"]';
            $(deliveryAddress).on('change', function () {
                let chosenDeliveryAddressId = $(this).val();
                $('.delivery_address_id').val(chosenDeliveryAddressId);
            });

            let courier = 'input[name="courier"]';
            $(courier).on('change', function () {
                let shippingCost = $(this).data('cost');
                let total = $('#total').data('total');

                setCourierDetails($(this).val());
                setShippingFee(shippingCost);
                setTotal(total, shippingCost);
            });

            if ($(courier).is(':checked')) {
                let shippingCost = $(courier + ':checked').data('cost');
                let courierId = $(courier + ':checked').val();
                let total = $('#total').data('total');

                setShippingFee(shippingCost);
                setCourierDetails(courierId);
                setTotal(total, shippingCost);
            }

            let handler = PaystackCheckout.configure({
                key: "{{ config('paystack.secretKey') }}",
                locale: 'auto',
                token: function(token) {
                    // You can access the token ID with `token.id`.
                    // Get the token ID to your server-side code for use.
                    console.log(token.id);
                    $('input[name="paystackToken"]').val(token.id);
                    $('#paystackForm').submit();
                }
            });

            document.getElementById('paywithpayastack').addEventListener('click', function(e) {
                let total = parseFloat("{{ $total }}");
                let shipping = parseFloat($('#shippingFeeC').val());
                let amount = total + shipping;
                // Open Checkout with further options:
                handler.open({
                    name: "{{ config('paystack.name') }}",
                    description: "{{ config('paystack.description') }}",
                    currency: "{{ config('cart.currency') }}",
                    amount: amount * 100,
                    email: "{{ $customer->email }}"
                });
                e.preventDefault();
            });

            // Close Checkout on page navigation:
            window.addEventListener('popstate', function() {
                handler.close();
            });
        });
    </script>
@endsection