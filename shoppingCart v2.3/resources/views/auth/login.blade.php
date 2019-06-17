@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4 col-md-12">
                <div class="card-plain">
                    <div class="header">
                        <h5>{{__('Log in')}}</h5>
                    </div>
                    <form class="form" method="POST" action="{{ route('login') }}">
                         @csrf
                        <div class="input-group">
                            <input  id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="{{ __('Email') }}" required autofocus>
                            <span class="input-group-addon"><i class="zmdi zmdi-account-circle"></i></span>
                            @if ($errors->has('email'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                        </div>
                        <div class="input-group">
                            <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" placeholder="{{ __('Password') }}" required>
                            <span class="input-group-addon"><i class="zmdi zmdi-lock"></i></span>
                             @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                        </div> 
                        <div class="checkbox float-left">
                            <input id="terms" type="checkbox">
                            <label for="terms">{{__('Remember me')}}</label>
                        </div>                         
                        <div class="clearfix"></div>
                        <div class="footer">
                            <input type="submit" class="btn btn-primary btn-round btn-block" value="{{__('SIGN IN')}}">
                            <a href="{{url('/')}}/register" class="btn btn-primary btn-simple btn-round btn-block">{{__('SIGN UP')}}</a>
                        </div>
                     </form>
                    <a href="{{ route('password.request') }}" class="link">{{ __('Forgot Your Password?') }}</a>
                </div>
            </div>
    </div>
</div>
@endsection
