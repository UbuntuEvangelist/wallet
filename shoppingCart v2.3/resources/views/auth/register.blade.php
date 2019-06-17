@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-5 col-md-12 ">
                <div class="card-plain">
                    <div class="header">
                        <h5>{{__('Sign Up')}}</h5>
                    </div>
                    <form class="form" method="POST" action="{{ route('register') }}">
                        @csrf                        
                        <div class="input-group">
                            <input type="text" class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" placeholder="{{__('Enter User Name')}}" required autofocus>
                            <span class="input-group-addon"><i class="zmdi zmdi-account-circle"></i></span>
                            @if ($errors->has('name'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="input-group">
                            <input type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="{{__('Enter Email')}}" required >
                            <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
                            @if ($errors->has('email'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="input-group">
                            <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" placeholder="{{__('Password')}}"  required>
                            <span class="input-group-addon"><i class="zmdi zmdi-lock"></i></span>
                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="input-group">
                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{__('Repeat Password')}}" required>
                            <span class="input-group-addon"><i class="zmdi zmdi-lock"></i></span>
                            @if ($errors->has('password_confirmation'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div>
                        {{--
                        <div class="checkbox">
                            <input id="terms" type="checkbox" name="terms">
                            <label for="terms">{{__('I read and Agree to the')}} <a href="{{url('/')}}/page/3">{{__('Terms of Usage')}}</a></label>
                            @if ($errors->has('terms'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('terms') }}</strong>
                                </span>
                            @endif
                        </div>                            
                        --}}
                    <div class="footer">
                        <input type="submit" value="{{__('SIGN UP')}}" class="btn btn-primary btn-round btn-block">
                    </div>
                    </form>
                    <a class="link" href="{{url('/')}}/login">{{__('You already have a membership?')}}</a>
                </div>
            </div>>
    </div>
</div>
@endsection
