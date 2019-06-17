  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand  waves-effect" href="{{ url('/') }}">
                    {{ setting('site.title')}}
                </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
          </li>
      	</ul>
       
        <!-- Right -->

        <ul class="navbar-nav nav-flex-icons">
        @guest
            <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a></li>
            <li class="nav-item"><a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a></li>
        @else
            <li class="nav-item">
				<a class="nav-link waves-effect" href="{{url('/')}}/checkout">
          @if(!Cart::session(Auth::user()->id)->isEmpty())
					<span class="badge red z-depth-1 mr-1"> {{Cart::getContent()->count()}} </span>
          @endif
					<i class="fa fa-shopping-cart"></i>
					<span class="clearfix d-none d-sm-inline-block">My Cart </span>
				</a>
			</li>
			
			<li   class="nav-item ">
          <a href="{{url('/')}}"   class="nav-link waves-effect" >
              Shop 
          </a>
      </li>
      <li class="nav-item ">
          <a href="{{url('/')}}/orders"  class="nav-link waves-effect" >
              My Orders 
          </a>
      </li>
      <li class="nav-item">
       <a class="btn btn-primary nav-btn btn-xs" href="{{ route('logout') }}"
             onclick="event.preventDefault();
                           document.getElementById('logout-form').submit();">
              {{ __('Logout') }}
          </a>

          <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
              @csrf
          </form>
        </li>
        @endguest
        </ul>

      </div>

    </div>
  </nav>
  <!-- Navbar -->