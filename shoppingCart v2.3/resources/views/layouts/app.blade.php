<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ setting('site.title') }}</title>

   <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/jquery-jvectormap-2.0.3.min.css')}}"/>
    <link rel="stylesheet" href="{{ asset('assets/css/morris.min.css')}}" />
    <!-- Custom Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/main.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/color_skins.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/ecommerce.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap-select.min.css')}}">
    

    <style type="text/css">
    .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}
    .jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    .bitcoin .body {position: absolute;word-break: break-all;}
    .remove{cursor: pointer;}
    </style>
  <style type="text/css">
    html,
    body,
    header,
    .carousel {
      height: 60vh;
    }

    @media (max-width: 740px) {
      html,
      body,
      header,
      .carousel {
        height: 100vh;
      }
    }

    @media (min-width: 800px) and (max-width: 850px) {
      html,
      body,
      header,
      .carousel {
        height: 100vh;
      }
    }
  </style>
</head>
<body class="theme-green menu_dark" id="app">
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="{{asset('assets/images/logo.svg')}}" width="48" height="48" alt="sQuare"></div>
        <p>Please wait...</p>        
    </div>
</div>
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
@include('layouts.topnavbar')
@include('layouts.aside')
<section class="content">
    <div class="container">
        <div class="row clearfix">
            <div class="col-lg-12">
                <div class="card">
                    <div class="body block-header">
                        <div class="row">
                            <div class="col-lg-6 col-md-8 col-sm-12">
                                <h2>{{__('Welcome')}} @auth {{Auth::user()->name}} @else Mr(s) Guest @endauth</h2>
                                <ul class="breadcrumb p-l-0 p-b-0 ">
                                    <li class="breadcrumb-item"><a href="{{url('/')}}"><i class="icon-home"></i></a></li>
                                    @if($page)
                                    <li class="breadcrumb-item active">{{$page}}</li>
                                    @endif
                                    @if($subpage)
                                    <li class="breadcrumb-item active">{{$subpage}}</li>
                                    @endif
                                </ul>
                            </div>            
                            <div class="col-lg-6 col-md-4 col-sm-12 text-right">
                                @auth
                                <a href="{{url('/')}}/checkout" class="btn btn-primary btn-round  float-right hidden-xs m-l-10">{{__('Go to Checkout')}}</a>
                                @endauth
                                @guest
                                <a href="{{url('/')}}/login" class="btn btn-primary btn-round  float-right hidden-xs m-l-10">{{__('Login')}}</a>
                                @endguest
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @yield('content')
    </div>

      <!-- Scripts -->
    @yield('footer')
</section>
      <!-- Jquery Core Js --> 
    <script src="{{ asset('assets/js/libscripts.bundle.js') }}"></script> <!-- Lib Scripts Plugin Js ( jquery.v3.2.1, Bootstrap4 js) --> 
    <script src="{{ asset('assets/js/vendorscripts.bundle.js')}}"></script> <!-- slimscroll, waves Scripts Plugin Js -->

    <script src="{{ asset('assets/js/morrisscripts.bundle.js')}}"></script><!-- Morris Plugin Js -->
    <script src="{{ asset('assets/js/jvectormap.bundle.js')}}"></script> <!-- JVectorMap Plugin Js -->
    <script src="{{ asset('assets/js/knob.bundle.js')}}"></script> <!-- Jquery Knob-->

    <script src="{{ asset('assets/js/mainscripts.bundle.js')}}"></script>
    <script src="{{ asset('assets/js/infobox-1.js')}}"></script>
    <script src="{{ asset('assets/js/index.js')}}"></script>
</body>
</html>
