<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">Navigation</li>
            @permission(('view-sidebar'))
            {{--@role(('admin'))--}}

            <li class="treeview">
                <a href="{{ url('dashboard') }}"><i class='fa fa-dashboard'></i> <span>DASHBOARDS</span> <i class="fa fa-angle-left pull-right"></i></a>
                {{--<ul class="treeview-menu">--}}
                    {{--<li><a href="{{ url('dashboard') }}"><i class='fa fa-dashboard'></i> <span>HOME</span></a></li>--}}
                    {{--<li><a href="{{ url('/bizcenters')}}"><i class='fa fa-database'></i> <span>LIST</span></a></li>--}}
                {{--</ul>--}}
            </li>

            <li class="treeview">
                <a href="#"><i class='fa fa-server'></i> <span>BIZ CENTER</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('/bizcenters')}}"><i class='fa fa-database'></i> <span>REQUEST LIST</span></a></li>
                    <li class="divider"></li>
                    <li><a href="{{ url('/bizcenters/create')}}"><i class='fa fa-database'></i> <span>CREATE</span></a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#"><i class='fa fa-server'></i> <span>EMAIL ROOM</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('/emailrooms')}}"><i class='fa fa-database'></i> <span>EMAIL ROOM LIST</span></a></li>
                    <li class="divider"></li>
                    <li><a href="{{ url('/emailrooms/create')}}"><i class='fa fa-database'></i> <span>CREATE</span></a></li>

                </ul>
            </li>


            <li class="treeview">
                <a href="#"><i class='fa fa-server'></i> <span>MASTER DATA</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li ><a href="{{ url('admin/users') }}"><i class="fa fa-users"></i> <span>USERS</span></a></li>
                    <li class="divider"></li>
                    <li><a href="{{ url('/locations')}}"><i class='fa fa-map-marker'></i> <span>LOCATIONS</span></a></li>
                    <li><a href="{{ url('/divisions')}}"><i class='fa fa-group'></i> <span>DEPARTMENTS</span></a></li>
                </ul>
            </li>


            <li class="treeview">
                <a href="{{ url('/tickets')}}"><i class='fa fa-ticket'></i> <span>SYSTEM SUPPORT</span></a>
            </li>
            @endpermission


            @role(('super-admin'))
            <li class="treeview">
                <a href="#"><i class='fa fa-gear'></i> <span>ADMINISTRATOR</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('/admin')}}"><i class='fa fa-gear'></i> <span>SETTINGS</span></a></li>
                    <li ><a href="{{ url('admin/users') }}"><i class="fa fa-users"></i> <span>USERS</span></a></li>
                    <li><a href="{{ url('admin/roles') }}"><i class="fa fa-archive"></i> <span>ROLES</span></a></li>
                    <li><a href="{{ url('admin/permissions') }}"><i class="fa fa-key"></i> <span>PERMISSIONS</span></a></li>
                    {{--<li><a href="{{ url('admin/settings') }}"><i class="fa fa-cog"></i> <span>Settings</span></a></li>--}}
                </ul>
            </li>
              @endrole

            <li class="treeview">
                    <a href="{{url('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"class="fa fa-user"><span> &nbsp;&nbsp; SIGN OUT</span></a>
                    <form id="logout-form" action="{{ url('/logout') }}" method="post" style="display: none;">
                        {{ csrf_field() }}
                    </form>
            </li>


        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>





