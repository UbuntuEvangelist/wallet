<div class="col-10" style="margin-top: 20px">
    <div class="card card-primary">
        
        <div class="card-body">
            <div class="row">

                <div class="col">
                    <h4 class="mb-5 mt-5">{{__('Your Invoice')}}</h4> 
                    <div class="card mb-5">
                        <div class="card-body bg-primary text-white" style="background-color: #dff0d8;">
                            <table class="table border-secondary">
                                <thead>
                                  <tr>
                                    <th class="border-top-0">{{__('name')}}</th>
                                    <th class="border-top-0">{{__('price')}}</th>
                                    <th class="border-top-0">{{__('quantity')}}</th>
                                  </tr>
                                </thead>
                                <tbody>
                                
                                @foreach(session()->get('PurchaseRequest')->data->items as $item)
                                    <tr>
                                        <td>{{$item->name}}</td>
                                        <td>{{\App\Helpers\Money::instance()->value($item->price)}}{{session()->get('PurchaseRequest')->currency->symbol}} </td>
                                        <td>{{$item->qty}}</td>
                                    </tr>
                                  
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer bg-light text-dark">
                             <h3 style="font-weight: bold;"><span class="float-left">Total</span><span class="float-right">{{\App\Helpers\Money::instance()->value(session()->get('PurchaseRequestTotal'))}} {{session()->get('PurchaseRequest')->currency->symbol}}</span> <div class="clearfix"></div></h3>
                        </div>
                    </div>
                </div>
                <div class="col">
                    
                    <h4 class="mb-5 mt-5">{{__('Pay With')}} {{setting('site.site_name')}}</h4>

                    @if(session()->get('PurchaseRequest')->attempts > 1 and  session()->get('PurchaseRequest')->attempts <= 5 )
                        <div class="clearfix"></div>
                        <div class="alert alert-info" role="alert" style="margin-top: 20px;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>
                                <a class="btn btn-link " href="{{ route('password.request') }}">
                                    {{__('Forgot Your Password?')}}
                                </a>
                            </strong>
                            {{ 5 - session()->get('PurchaseRequest')->attempts }} Attempts left
                        </div>
                    @endif
                    @include('flash')
                    <form class="form-horizontal" method="POST" action="{{ route('logandpay') }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="ref" value="{{$ref}}">
                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            

                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus placeholder="E-Mail Address">

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            

                                <input id="password" type="password" class="form-control" name="password" placeholder="Password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                        </div>

                        {{-- 
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                        </label>
                                    </div>
                                </div>
                            </div>
                        --}}

                        <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block btn-lg" style="font-weight: bold"> {{__('Make Payment')}}</button>
                        </div>
                    </form>
                    <div class="clearfix"></div>
                    <hr style="margin-top: 20px; margin-bottom: 20px">
                    <div class="clearfix"></div>
                        <a href="" class="btn btn-dark btn-block btn-lg" style="font-weight: bold; margin-bottom: 20px">{{__('Create An Account')}}</a>
                </div>
            </div>
            <div class="row">
                <div class="col">
                     <div class="mb-5 mt-2">
                        <h4 style="text-align: center;">{{setting('site.site_name')}} {{__('is the faster, safer way to pay in the internet')}}</h4>
                            <p style="text-align: center;"> {{__('No matter where you shop, we keep your financial information secure')}}</p>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</div>