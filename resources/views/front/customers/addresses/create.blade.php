@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="container content">
        @include('layouts.errors-and-messages')
        <ol class="breadcrumb">
            <li><a href="{{url('accounts') }}"><i class="fa fa-dashboard"></i> Account</a></li>

            <li><a href="{{ route('customer.address.index', $customer->id) }}"><i class="fa fa-dashboard"></i> Address</a></li>
            <li class="active">Show Address</li>
            <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
        </ol>
        <div class="box">
            <form action="{{ route('customer.address.store', $customer->id) }}" method="post" class="form" enctype="multipart/form-data">
                <input type="hidden" name="status" value="1">
                <div class="box-body">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="alias">Address Alias <span class="text-danger">*</span></label>
                        <input type="text" name="alias" id="alias" placeholder="Home or Office" class="form-control" value="{{ old('alias') }}">
                    </div>
                    <div class="form-group">
                        <label for="address_1">Address 1 <span class="text-danger">*</span></label>
                        <input type="text" name="address_1" id="address_1" placeholder="Address 1" class="form-control" value="{{ old('address_1') }}">
                    </div>

                    <div class="form-group">
                        <label for="address_2">Address 2 </label>
                        <input type="text" name="address_2" id="address_2" placeholder="Address 2" class="form-control" value="{{ old('address_2') }}">
                    </div>

                    <div class="form-group">
                        <label for="phone_no">Phone Number</label>
                        <input type="text" name="phone_no" id="phone_no" placeholder="phone_no" class="form-control" value="{{ old('phone_no') }}">
                    </div>

                    <div class="form-group">
                        <label for="country_id">Country </label>
                        <select name="country_id" id="country_id" class="form-control">
                            @foreach($countries as $country)
                                <option value="{{ $country->id }}">{{ $country->name }}</option>
                            @endforeach
                        </select>
                    </div>


                    <div id="province" class="form-group">
                        <label for="province_id">Province </label>
                        <select name="province_id" id="province_id" class="form-control">
                            @foreach($provinces as $province)
                                <option value="{{ $province->id }}">{{ $province->name }}</option>
                            @endforeach
                        </select>
                    </div>



                    <div id="cities" class="form-group">
                        <label for="city_id">City </label>
                        <select name="city_id" id="city_id" class="form-control">
                            @foreach($cities as $city)
                                <option value="{{ $city->id }}">{{ $city->name }}</option>
                            @endforeach
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="zip">Zip Code </label>
                        <input type="text" name="zip" id="zip" placeholder="Zip code" class="form-control" value="{{ old('zip') }}">
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        {{--<a href="{{ route('customer.address.index', $customer->id) }}" class="btn btn-default">Back</a>--}}
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
@endsection
@section('js')
    <script type="text/javascript">

        var countryIdSelector = '#country_id',
            citySelector = '#city_id';

        localStorage.setItem('countryId', $(countryIdSelector).val());

        function getCities(provinceId) {

            var countryId = localStorage.getItem('countryId');

            $.ajax({
                url: '/api/v1/country/'+countryId+'/province/' + provinceId + '/city',
                success: function (data) {
                    var options = '';
                        $(data.data).each(function (idx, v) {
                            options += "<option value='"+v.id+"'>"+ v.name +"</option>";
                        });
                    $(citySelector).html(options);
                }
            });
        }

        $(countryIdSelector).on('change', function () {
            localStorage.setItem('countryId', $(this).val());
            if($(this).val() != 156) {
                $('#province, #cities').hide();
            } else
                {
                $('#province, #cities').show();
            }
        });

        $('#province_id').on('change', function () {
            getCities($(this).val());
        });
    </script>
@endsection
