@extends('layouts.storefront')

@section('content')
<div class="container">

    @if($merchant)
    <div class="row  justify-content-md-center mb-5 mt-5">
        <div class="col-10" style="margin-top: 20px">
    	   <h2 >{{$merchant->name}}</h2>
        </div>
        @auth
            @include('merchant.partials.pay')
        @endauth
        @guest
            @include('merchant.partials.logandpay')
        @endguest
    </div>
    @endif
</div>
@endsection
@section('footer')
    @include('partials.footer')
@endsection