@extends('layouts.admin.app')

@section('content')

    <section class="content">
        <div class="box">
            <form action="{{ route('admin.addresses.update', $address->id) }}" method="post" class="form" enctype="multipart/form-data">
                <div class="box-body">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="put">
                    <div class="form-group">
                        <label for="customer">Customer Address</label>
                        <ol class="breadcrumb">
                            <li><a href="{{ url('/admin') }}"><i class="fa fa-dashboard" style="color: blue;"></i> Admin</a></li>
                            <li><a href="{{url('/admin/customers') }}"><i class="fa fa-dashboard"></i> Customer Address</a></li>
                            <li class="active">Edit Customer Address</li>
                            <li class="pull-right"><a class="btn btn-sm btn-flat btn-primary" href="{{ URL::previous() }}">Go Back</a></li>
                        </ol>
                    </div>
                    <div class="form-group">
                        <label for="alias">Alias <span class="text-danger">*</span></label>
                        <input type="text" name="alias" id="alias" placeholder="Home or Office" class="form-control" value="{{ $address->alias ?: old('alias') }}">
                    </div>
                    <div class="form-group">
                        <label for="address_1">Address 1 <span class="text-danger">*</span></label>
                        <input type="text" name="address_1" id="address_1" placeholder="Address 1" class="form-control" value="{{ $address->address_1 ?: old('address_1') }}">
                    </div>

                    <div class="form-group">
                        <label for="address_2">Address 2 </label>
                        <input type="text" name="address_2" id="address_2" placeholder="Address 2" class="form-control" value="{{ $address->address_2 ?: old('address_2') }}">
                    </div>

                    <div class="form-group">
                        <label for="phone_no">Phone Number </label>
                        <input type="text" name="phone_no" id="phone_no" placeholder="Phone Number" class="form-control" value="{{ $address->customer->phone_no ?: old('phone_no') }}">
                    </div>

                    <div class="form-group">
                        <label for="country_id">Country </label>

                        <select name="country_id" id="country_id" class="form-control">
                            @foreach($countries as $country)
                                @if($country->id == 156)
                                    <option selected="selected" value="{{ $country->id }}">{{ $country->name }}</option>
                                @else
                                    <option value="{{ $country->id }}">{{ $country->name }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="province">Province </label>
                        <input disabled type="text" name="phone_no" id="phone_no" placeholder="province" class="form-control" value="{{ "Lagos"}}">
                    </div>
                    {{--<div class="form-group">--}}
                        {{--<label for="province_id">Province </label>--}}
                        {{--<select name="province_id" id="province_id" class="form-control">--}}
                            {{--@foreach($provinces as $province)--}}
                                {{--@if($province->id == $provinceId)--}}
                                    {{--<option selected="selected" value="{{ $province->id }}">{{ $province->name }}</option>--}}
                                {{--@else--}}
                                    {{--<option value="{{ $province->id }}">{{ $province->name }}</option>--}}
                                {{--@endif--}}
                            {{--@endforeach--}}
                        {{--</select>--}}
                    {{--</div>--}}

                    <div id="cities" class="form-group">
                        <label for="city_id">City </label>
                        <select name="city_id" id="city_id" class="form-control">
                            @foreach($cities as $city)
                                @if($city->id == 1)
                                    {{--@if($city->id == $cityId)--}}
                                    <option selected="selected" value="{{ $city->id }}">{{ $city->name }}</option>
                                @else
                                    <option value="{{ $city->id }}">{{ $city->name }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="zip">Zip Code </label>
                        <input type="text" name="zip" id="zip" placeholder="Zip code" class="form-control" value="{{ $address->zip ?: old('zip') }}">
                    </div>

                    <div class="form-group">
                        @include('admin.shared.status-select', ['status' => $address->status])
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.addresses.index') }}" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->
        {{--@endrole--}}
{{--@endpermission--}}
    </section>
    <!-- /.content -->
@endsection
@section('js')
    <script type="text/javascript">
        $(document).ready(function () {
            $('#province_id').change(function () {

                var provinceId = $(this).val();

                $.ajax({
                    url: '/api/v1/country/156/province/' + provinceId + '/city',
                    contentType: 'json',
                    success: function (data) {

                        var html = '<label for="city_id">City </label>';
                            html += '<select name="city_id" id="city_id" class="form-control">';
                            $(data.data).each(function (idx, v) {
                                html += '<option value="'+ v.id+'">'+ v.name +'</option>';
                            });
                            html += '</select>';

                        $('#cities').html(html).show();
                    },
                    errors: function (data) {
                        console.log(data);
                    }
                });
            });
        });
    </script>
@endsection
