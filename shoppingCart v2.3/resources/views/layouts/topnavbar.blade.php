<nav class="top_navbar">
    <div class="container">
        
        <div class="row clearfix">
            <div class="col-12">
                <div class="navbar-logo">
                    <a href="javascript:void(0);" class="bars"></a>
                    <a class="navbar-brand" href="{{ url('/') }}">
                        <img src="{{asset('assets/images/logo.svg')}}" width="30" alt="InfiniO"> 
                        <span class="m-l-10">{{setting('site.title')}}</span>
                    </a>
                </div>
                @auth
                <ul class="nav navbar-nav">
                    <li class="dropdown profile "><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        @if(!Cart::session(Auth::user()->id)->isEmpty())
                            <i class="icon-basket-loaded"></i>
                            <span class="label-count"> {{Cart::getContent()->count()}} </span>
                        @else
                            <i class="icon-basket"></i>
                            <span class="label-count">0</span>
                        @endif
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Your Cart</li>
                            <li class="body">
                                <ul class="menu tasks list-unstyled">
                                @if(!Cart::session(Auth::user()->id)->isEmpty())    
                                    @foreach( Cart::session(Auth::user()->id)->getContent()  as $cartItem)
                                        <li>
                                            <a href="{{url('/')}}/remove/{{$cartItem->id}}">
                                                <span class="text-muted"><span class="text-primary">{{ str_limit($cartItem->name, 20,  '...') }}</span><span class="float-right">Qty:  {{$cartItem->quantity}}</span></span>
                                                <span class="clearfix"></span>
                                                 <span class="text-muted"> <span class="float-right">Price: {{setting('phpwallet.merchant_currency_symbol')}}{{$cartItem->price}}</span></span>
                                                 <span class="clearfix"></span>
                                            </a>
                                        </li>
                                    @endforeach
                                @endif                         
                                </ul>
                            </li>
                            <li class="footer"><a href="{{url('/')}}/checkout"><span class="text-muted">Checkout<span class="float-right"><strong> {{Cart::session(Auth::user()->id)->getTotal()}} {{setting('phpwallet.merchant_currency_symbol')}}</strong></span></span><span class="clearfix"></span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown profile">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <img class="rounded-circle" src="{{url('/')}}/storage/users/default.png" alt="User">
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="user-info">
                                    <h6 class="user-name m-b-0">{{Auth::user()->name}}</h6>
                                    
                                    <hr>
                                </div>
                            </li>                            
                            <li><a href="profile.html"><i class="icon-user m-r-10"></i> <span>My Profile</span> </a></li>
                            <li><a href="{{url('/')}}/orders"><i class="icon-notebook m-r-10"></i><span>My Orders</span> </a></li>                            
                            <li><a href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i class="icon-power m-r-10"></i><span>Sign Out</span></a><form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form></li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);" class="js-right-sidebar"><i class="icon-equalizer"></i></a></li>
                </ul>
                @endauth
                @guest
                    <ul class="nav navbar-nav">
                        <li class="dropdown profile "><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="icon-basket"></i>
                       
                            <span class="label-count">0</span>
                     
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Your Cart</li>
                            <li class="body">
                                <ul class="menu tasks list-unstyled">
                                                     
                                </ul>
                            </li>
                            <li class="footer"><a href="#"><span class="text-muted">Checkout<span class="float-right"><strong> 0 {{setting('phpwallet.merchant_currency_symbol')}}</strong></span></span><span class="clearfix"></span></a></li>
                        </ul>
                    </li>
                        <li class="dropdown profile">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                                <img class="rounded-circle" src="{{url('/')}}/storage/users/default.png" alt="User">
                            </a>
                             <ul class="dropdown-menu">
                                <li>
                                    <div class="user-info">
                                        <h6 class="user-name m-b-0">Guest</h6>
                                        
                                        <hr>
                                    </div>
                                </li>                            
                                <li><a href="{{url('/')}}/login"><i class="icon-user m-r-10"></i> <span>{{__('Login')}}</span> </a></li>
                                 <li><a href="{{url('/')}}/register"><i class="icon-user m-r-10"></i> <span>{{__('Register')}}</span> </a></li>
                            </ul>

                        </li>
                         <li><a href="javascript:void(0);" class="js-right-sidebar"><i class="icon-equalizer"></i></a></li>
                    </ul>
                @endguest
            </div>
        </div>        
    </div>
</nav>