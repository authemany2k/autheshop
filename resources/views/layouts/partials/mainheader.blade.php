<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="{{ url('/home') }}" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">DRBCRS</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>DANGOTE</b> RBCRS </span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- This is the company name-->
        <div class="company-name">
            DANGOTE REFINERY BUSINESS CENTER REQUEST SYSTEM
        </div>

        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
                 <ul class="nav navbar-nav">
                    {{--@if (Auth::user())--}}
                    {{--<li><a href="{{ url('/account')}}"><i class='fa fa-user'></i> <span>My profile</span></a></li>--}}
                    {{--<li ><a href="{{ url('tickets') }}">My tickets</a></li>--}}
                    {{--<li ><a href="{{ url('tickets/create') }}">Open new ticket</a></li>--}}
                    {{--@role(('super-admin', 'admin'))--}}
                    {{--<li><a href="{{ url('home') }}"><i class='fa fa-home'></i> <span>Home</span></a></li>--}}
                    {{--<li><a href="{{ url('/assets')}}"><i class='fa fa-tags'></i> <span>Complete Machines Lists</span></a></li>--}}
                    {{--<li><a href="{{ url('/spares')}}"><i class='fa fa-life-ring'></i> <span>Spares</span></a></li>--}}
                    {{--@endrole--}}
                    {{--<li><a href="{{ url('/suppliers')}}"><i class='fa fa-shopping-cart'></i> <span>Suppliers</span></a></li>--}}
                    {{--<li><a href="{{ url('/locations')}}"><i class='fa fa-building'></i> <span>Locations</span></a></li>--}}
                    {{--<li><a href="{{ url('/divisions')}}"><i class='fa fa-group'></i> <span>Departments</span></a></li>--}}

                    {{--@endif--}}

                <!-- Messages: style can be found in dropdown.less-->
                {{-- <li class="dropdown messages-menu">
                    <!-- Menu toggle button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success">4</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 4 messages</li>
                        <li>
                            <!-- inner menu: contains the messages -->
                            <ul class="menu">
                                <li><!-- start message -->
                                    <a href="#">
                                        <div class="pull-left">
                                            <!-- User Image -->
                                            <img src="/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
                                        </div>
                                        <!-- Message title and timestamp -->
                                        <h4>
                                            Support Team
                                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                        </h4>
                                        <!-- The message -->
                                        <p>Why not buy a new awesome theme?</p>
                                    </a>
                                </li><!-- end message -->
                            </ul><!-- /.menu -->
                        </li>
                        <li class="footer"><a href="#">See All Messages</a></li>
                    </ul>
                </li><!-- /.messages-menu --> --}}

                <!-- Notifications Menu -->
                {{-- <li class="dropdown notifications-menu">
                    <!-- Menu toggle button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">10</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 10 notifications</li>
                        <li>
                            <!-- Inner Menu: contains the notifications -->
                            <ul class="menu">
                                <li><!-- start notification -->
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                    </a>
                                </li><!-- end notification -->
                            </ul>
                        </li>
                        <li class="footer"><a href="#">View all</a></li>
                    </ul>
                </li> --}}
                <!-- Tasks Menu -->
                {{-- <li class="dropdown tasks-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <span class="label label-danger">9</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 9 tasks</li>
                        <li>
                            <!-- Inner menu: contains the tasks -->
                            <ul class="menu">
                                <li><!-- Task item -->
                                    <a href="#">
                                        <!-- Task title and progress text -->
                                        <h3>
                                            Design some buttons
                                            <small class="pull-right">20%</small>
                                        </h3>
                                        <!-- The progress bar -->
                                        <div class="progress xs">
                                            <!-- Change the css width attribute to simulate progress -->
                                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li><!-- end task item -->
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>
                    </ul>
                </li> --}}
                @if (Auth::guest())
                    <li><a href="{{ url('/login') }}">Login</a></li>
                    {{-- <li><a href="{{ url('/register') }}">Register</a></li> --}}
                @else


                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            {{-- <img src="/img/user2-160x160.jpg" class="user-image" alt="User Image"/> --}}
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs"><i class="fa fa-user"></i> {{ Auth::user()->name }}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                             <li class="user-header">
                                <img src="/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                                <p>


                                    {{ Auth::user()->name }}
                                    {{--<small>Member since Nov. 2012</small>--}}
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="col-xs-4 text-center">
                                    {{--<a href="#">Followers</a>--}}
                                </div>
                                <div class="col-xs-4 text-center">
                                    {{--<a href="#">Sales</a>--}}
                                </div>
                                <div class="col-xs-4 text-center">
                                    {{--<a href="#">Friends</a>--}}
                                </div>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                 <div class="pull-left">
                                     <a href="{{url('admin/users/'.Auth::user()->id.'/') }}" class="btn btn-default btn-flat">Profile</a>
                                     {{--<a href="{{url('admin/users') }}" class="btn btn-default btn-flat">Profile</a>--}}
                                    {{--<a href="#" class="btn btn-default btn-flat">Profile</a>--}}
                                </div>


                                {{--<div class="pull-right">--}}
                                    {{--<a href="{{ url('/logout') }}" class="btn btn-default btn-flat">Sign out</a>--}}
                                {{--</div>--}}
                                {{----}}

                                <div class="pull-right">
                                    <a href="{{url('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="btn btn-default btn-flat">Sign out</a>
                                    <form id="logout-form" action="{{ url('/logout') }}" method="post" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </div>

                            </li>
                        </ul>
                    </li>
                @endif

                <!-- Control Sidebar Toggle Button -->
                <li>
                    {{-- <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> --}}
                </li>
            </ul>
        </div>
    </nav>
</header>
