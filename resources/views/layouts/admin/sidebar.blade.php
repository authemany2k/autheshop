<!-- =============================================== -->

<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{ asset('img/user2-160x160.jpg') }}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>{{ $user->name }}</p>
                <a href="#"><i class="fa fa-circle text-success"></i></a>
                <a href="{{url('logout') }}"
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <span>SIGNOUT</span></a>
                <form id="logout-form" action="{{ route('logout') }}" method="post" style="display: none;">
                    {{ csrf_field() }}
                </form>

            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">

            <li class="treeview">
                <a href="{{ url('admin') }}"><i class='fa fa-dashboard'></i> <span>DASHBOARDS</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
            </li>
            {{--<li class="header">SELL</li>--}}
            <li class="treeview @if(request()->segment(2) == 'products' || request()->segment(2) == 'categories' || request()->segment(2) == 'attributes' || request()->segment(2) == 'brands') active @endif">
                <a href="#">
                    <i class="fa fa-gift"></i> <span>Products</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                        <li><a href="{{ route('admin.products.index') }}"><i class="fa fa-circle-o"></i> List products</a></li>
                        <li><a href="{{ route('admin.products.create') }}"><i class="fa fa-plus"></i> Create product</a></li>

                    {{--reviews--}}
                    <li class="treeview @if(request()->segment(2) == 'reviews') active @endif">
                        <a href="#">
                            <i class="fa fa-gift"></i> <span>Product Reviews</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                        </a>

                        <ul class="treeview-menu">
                            <li><a href="{{ url('admin/reviews') }}"><i class="fa fa-circle-o"></i> List</a></li>
                            {{--<li><a href="{{ url('admin/reviews/'.$review->id.'/edit/') }}"><i class="fa fa-plus"></i> Edit</a></li>--}}
                        </ul>

                    </li>


                    <li class="@if(request()->segment(2) == 'categories') active @endif">
                        <a href="#">
                            <i class="fa fa-folder"></i> <span>Categories</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="{{ route('admin.categories.index') }}"><i class="fa fa-circle-o"></i> List
                                    categories</a></li>
                            <li><a href="{{ route('admin.categories.create') }}"><i class="fa fa-plus"></i> Create
                                    category</a></li>
                        </ul>
                    </li>

                    <li class="@if(request()->segment(2) == 'attributes') active @endif">
                        <a href="#">
                            <i class="fa fa-gear"></i> <span>Attributes</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="{{ route('admin.attributes.index') }}"><i class="fa fa-circle-o"></i> List
                                    attributes</a></li>
                            <li><a href="{{ route('admin.attributes.create') }}"><i class="fa fa-plus"></i> Create
                                    attribute</a></li>
                        </ul>
                    </li>
                    <li class="@if(request()->segment(2) == 'brands') active @endif">
                        <a href="#">
                            <i class="fa fa-tag"></i> <span>Brands</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="{{ route('admin.brands.index') }}"><i class="fa fa-circle-o"></i> List
                                    brands</a></li>
                            <li><a href="{{ route('admin.brands.create') }}"><i class="fa fa-plus"></i> Create brand</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>

            @role(('superadmin'))
            <li class="treeview @if(request()->segment(2) == 'customers' || request()->segment(2) == 'addresses') active @endif">
                <a href="#">
                    <i class="fa fa-users"></i> <span>Customers</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{ route('admin.customers.index') }}"><i class="fa fa-circle-o"></i> List</a></li>
                    <li><a href="{{ route('admin.customers.create') }}"><i class="fa fa-plus"></i> Create</a></li>
                    <li class="@if(request()->segment(2) == 'addresses') active @endif">
                        <a href="#"><i class="fa fa-map-marker"></i> Addresses
                            <span class="pull-right-container">
                              <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="{{ route('admin.addresses.index') }}"><i class="fa fa-circle-o"></i> List
                                    addresses</a></li>
                            <li><a href="{{ route('admin.addresses.create') }}"><i class="fa fa-plus"></i> Create</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>

            {{--<li class="header">ORDERS</li>--}}
            <li class="treeview @if(request()->segment(2) == 'orders') active @endif">
                <a href="#">
                    <i class="fa fa-money"></i> <span>Orders</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{ route('admin.orders.index') }}"><i class="fa fa-circle-o"></i> List</a></li>
                </ul>
            </li>
            <li class="treeview @if(request()->segment(2) == 'order-statuses') active @endif">
                <a href="#">
                    <i class="fa fa-anchor"></i> <span>Order Statuses</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{ route('admin.order-statuses.index') }}"><i class="fa fa-circle-o"></i> List</a></li>
                    <li><a href="{{ route('admin.order-statuses.create') }}"><i class="fa fa-plus"></i> Create</a></li>
                </ul>
            </li>

            <li class="treeview @if(request()->segment(2) == 'sellers') active @endif">
                <a href="#">
                    <i class="fa fa-users"></i> <span>Sellers</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>

                <ul class="treeview-menu">
                    <li><a href="{{ route('admin.sellers.index') }}"><i class="fa fa-circle-o"></i> List</a></li>
                    <li><a href="{{ route('admin.sellers.create') }}"><i class="fa fa-plus"></i> Create</a></li>
                </ul>

            </li>

            {{--<li class="treeview @if(request()->segment(2) == 'payment-methods') active @endif">--}}
            {{--<a href="#">--}}
            {{--<i class="fa fa-flask"></i> <span>Payment Methods</span>--}}
            {{--<span class="pull-right-container">--}}
            {{--<i class="fa fa-angle-left pull-right"></i>--}}
            {{--</span>--}}
            {{--</a>--}}
            {{--<ul class="treeview-menu">--}}
            {{--<li><a href="{{ route('admin.payment-methods.index') }}"><i class="fa fa-circle-o"></i> List</a></li>--}}
            {{--<li><a href="{{ route('admin.payment-methods.create') }}"><i class="fa fa-plus"></i> Create</a></li>--}}
            {{--</ul>--}}
            {{--</li>--}}

            {{--<li class="header">DELIVERY</li>--}}
            <li class="treeview @if(request()->segment(2) == 'couriers') active @endif">
                <a href="#">
                    <i class="fa fa-truck"></i> <span>Couriers</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{ route('admin.couriers.index') }}"><i class="fa fa-circle-o"></i> List</a></li>
                    <li><a href="{{ route('admin.couriers.create') }}"><i class="fa fa-plus"></i> Create</a></li>
                </ul>
            </li>
            {{--<li class="header">OTHERS</li>--}}
            <li class="treeview @if(request()->segment(2) == 'countries' || request()->segment(2) == 'provinces') active @endif">
                <a href="#">
                    <i class="fa fa-flag"></i> <span>Countries</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{ route('admin.countries.index') }}"><i class="fa fa-circle-o"></i> List</a></li>
                </ul>
            </li>


            <li class="treeview">
                <a href="#"><i class='fa fa-gear'></i> <span>Administrator</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    {{--<li><a href="{{ url('/admin')}}"><i class='fa fa-gear'></i> <span>SETTINGS</span></a></li>--}}
                    <li><a href="{{ url('admin/employees') }}"><i class="fa fa-users"></i> <span>Employees</span></a>
                    </li>
                    {{--<li><a href="{{ route('admin.employees.create') }}"><i class="fa fa-plus"></i>CREATE-EMPLOYEE</a></li>--}}
                    <li><a href="{{ url('admin/roles') }}"><i class="fa fa-archive"></i> <span>Roles</span></a></li>
                    <li><a href="{{ url('admin/permissions') }}"><i class="fa fa-key"></i> <span>Permissions</span></a>
                    </li>
                    {{--<li><a href="{{ url('admin/settings') }}"><i class="fa fa-cog"></i> <span>Settings</span></a></li>--}}
                </ul>
            </li>

            @endrole

            <li class="hidden treeview">
                <a href="{{url('logout') }}"
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                   class="fa fa-user"><span> &nbsp;&nbsp; SIGN OUT</span></a>
                <form id="logout-form" action="{{ url('/logout') }}" method="post" style="display: none;">
                    {{ csrf_field() }}
                </form>
            </li>

            {{--<li class="treeview">--}}
            <li class="hidden treeview">
                <a href="#">
                    <i class="fa fa-files-o"></i>
                    <span>Layout Options</span>
                    <span class="pull-right-container">
              <span class="label label-primary pull-right">4</span>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                    <li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                    <li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                    <li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a>
                    </li>
                </ul>
            </li>


            {{--<li class="treeview">--}}
            <li class="hidden">
                <a href="../widgets.html">
                    <i class="fa fa-th"></i> <span>Widgets</span>
                    <span class="pull-right-container">
              <small class="label pull-right bg-green">Hot</small>
            </span>
                </a>
            </li>


            {{--<li class="treeview">--}}
            <li class="hidden treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>Charts</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                    <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                    <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                    <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
                </ul>
            </li>


            {{--<li class="treeview">--}}
            <li class="hidden treeview">
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span>UI Elements</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                    <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
                    <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
                    <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
                    <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
                    <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
                </ul>
            </li>

            {{--<li class="treeview">--}}
            <li class="hidden treeview">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>Forms</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>


                <ul class="treeview">
                    <li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
                    <li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                    <li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
                </ul>
            </li>


            {{--<li class="treeview">--}}
            <li class="hidden treeview">
                <a href="#">
                    <i class="fa fa-table"></i> <span>Tables</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                    <li><a href="../tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
                </ul>
            </li>


            {{--<li class="treeview">--}}
            <li class="hidden">
                <a href="../calendar.html">
                    <i class="fa fa-calendar"></i> <span>Calendar</span>
                    <span class="pull-right-container">
              <small class="label pull-right bg-red">3</small>
              <small class="label pull-right bg-blue">17</small>
            </span>
                </a>
            </li>

            {{--<li class="treeview">--}}
            <li class="hidden">
                <a href="../mailbox/mailbox.html">
                    <i class="fa fa-envelope"></i> <span>Mailbox</span>
                    <span class="pull-right-container">
              <small class="label pull-right bg-yellow">12</small>
              <small class="label pull-right bg-green">16</small>
              <small class="label pull-right bg-red">5</small>
            </span>
                </a>
            </li>

            {{--<li class="treeview">--}}
            <li class="hidden treeview active">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>Examples</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
                    <li><a href="profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>
                    <li><a href="login.html"><i class="fa fa-circle-o"></i> Login</a></li>
                    <li><a href="register.html"><i class="fa fa-circle-o"></i> Register</a></li>
                    <li><a href="lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                    <li><a href="404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                    <li><a href="500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                    <li class="active"><a href="blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>
                    <li><a href="pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>
                </ul>
            </li>

            {{--<li class="treeview">--}}
            <li class="hidden treeview">
                <a href="#">
                    <i class="fa fa-share"></i> <span>Multilevel</span>
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                    <li>
                        <a href="#"><i class="fa fa-circle-o"></i> Level One
                            <span class="pull-right-container">
                              <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li>
                                <a href="#"><i class="fa fa-circle-o"></i> Level Two
                                    <span class="pull-right-container">
                                      <i class="fa fa-angle-left pull-right"></i>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                </ul>
            </li>
            <li class="hidden"><a href="../../documentation/index.html"><i class="fa fa-book"></i>
                    <span>Documentation</span></a></li>
            <li class="hidden header">LABELS</li>
            <li class="hidden"><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li class="hidden"><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li class="hidden"><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

<!-- =============================================== -->


