<!-- REQUIRED JS SCRIPTS -->


<!-- Custom JS script -->
<script src="{{ asset('/js/all.js') }}" type="text/javascript"></script>
<script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('plugins/datatables/dataTables.bootstrap.min.js') }}"></script>
<script src="{{ asset('plugins/slimScroll/jquery.slimscroll.min.js') }}"></script>
<script src="{{asset('plugins/datatables/dataTables.fixedColumns.min.js')}}"></script>


<script src="{{asset('sweetalert/dist/sweetalert-dev.js')}}"></script>
<script src="{{asset('sweetalert/dist/sweetalert.min.js')}}"></script>

<!-- Include this after the sweet alert js file -->
@include('sweet::alert')


<script src="{{asset('bootstrap/js/bootstrap-datepicker.js')}}"></script>
<script src="{{asset('bootstrap/css/bootstrap-datepicker.css')}}"></script>
<script type="text/javascript" src="{{asset('bootstrap-datetime-picker/moment.min.js')}}"></script>
<script src="{{asset('bootstrap-datetime-picker/bootstrap-datetimepicker.min.js')}}"></script>

<script src="{{asset('plugins/daterangepicker/daterangepicker.js')}}"></script>
<script src="{{asset('plugins/datepicker/bootstrap-datepicker.js')}}"></script>
<script src="{{asset('plugins/slimScroll/jquery.slimscroll.min.js')}}"></script>

{{--<script src="{{asset('bootstrap-datetime-picker/jquery.js')}}"></script>--}}

{{--<script src="{{ asset('plugins/jQuery/jquery-2.2.3.min.js') }}"></script>--}}
{{--<script src="{{ asset('bootstrap/js/bootstrap.min.js') }}"></script>--}}
{{--<script src="{{ asset('dist/js/app.min.js') }}"></script>--}}
{{--<script src="{{ asset('summernote/summernote.min.js') }}"></script>--}}
<script src="{{ asset('js/script.js') }}"></script>



<!-- Optionally, you can add Slimscroll and FastClick plugins.
      Both of these plugins are recommended to enhance the
      user experience. Slimscroll is required when using the
      fixed layout. -->
