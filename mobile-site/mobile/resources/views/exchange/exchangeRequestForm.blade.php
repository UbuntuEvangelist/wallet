<!DOCTYPE html>
<html>
<head>
  <title>Exchange Money</title>
  <meta name="theme-color" content="blue">
  <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no,  minimal-ui' />
  <link href="https://unpkg.com/@ionic/core@latest/css/ionic.bundle.css" rel="stylesheet">
  <script src="https://unpkg.com/@ionic/core@latest/dist/ionic.js"></script>
  <style>
    .header-md:after{
       background: none; 
    }
    body {
          background-color: #2196f3 !important;
      }
  </style>
</head>
<body >
<ion-app >

  <ion-content>
    <ion-tabs>
      <ion-tab tab="Exchange">
        <ion-content >
        
          <ion-fab vertical="bottom" horizontal="end" slot="fixed">
              <ion-fab-button>
                <ion-icon name="add"></ion-icon>
              </ion-fab-button>
              <ion-fab-list side="top">
                <ion-fab-button href="#"><ion-icon name="arrow-up"></ion-icon></ion-fab-button>
              </ion-fab-list>
           </ion-fab>
          <ion-card   style="margin-top: -40px">
              <ion-card-header>
                <ion-card-subtitle>Wallet Balance</ion-card-subtitle>
              </ion-card-header>
              <ion-item  lines="none" margin-bottom>
                  <ion-label float-left >
                    <ion-card-subtitle >

                    <ion-select id="customActionSheetSelect" onclick="" interface="action-sheet" value="{{$firstCurrency->name}}" style="padding-left: 0; padding-right: 0" placeholder="Select One">

                      <ion-select-option value="{{$firstCurrency->name}}">{{$firstCurrency->name}}</ion-select-option>
                      @foreach($firstCurrenciesExchages as $currency )
                        @if($currency->firstCurrency->name != $firstCurrency->name)
                          <ion-select-option  value="{{ $currency->firstCurrency->id }}">{{$currency->firstCurrency->name}}</ion-select-option>
                        @endif
                      @endforeach
                    </ion-select>
                           
                         
                </ion-card-subtitle>
                    <ion-card-title>{{ \App\Helpers\Money::instance()->value(Auth::user()->balance(), Auth::user()->currentCurrency()->symbol) }}</ion-card-title>
                  </ion-label>
                  
              </ion-item>
              <ion-card-body>
                <ion-item >
                  <ion-label position="floating">{{ Auth::user()->currentCurrency()->name }} Amount</ion-label>
                  <ion-input type="number" name="amount"></ion-input>
                  @if ($errors->has('amount'))
                      <span class="help-block">
                          <strong>{{ $errors->first('amount') }}</strong>
                      </span>
                  @endif
                </ion-item>
                @if( $wallet != false )
                <ion-card  margin-top color="primary">
                  <ion-card-header>
                    <ion-card-subtitle>
                      <ion-label float-left>{{$firstCurrency->name}} <ion-icon name="arrow-round-forward"></ion-icon> {{$secondCurrency->name}}</ion-label>
                    </ion-card-subtitle>
                  </ion-card-header>
                  <ion-item  color="primary" lines="none" margin-bottom>
                  <ion-label float-left>
                    <ion-card-subtitle  >
                      <ion-select id="customActionSheetSelect2" onclick="" interface="action-sheet" value="{{$secondCurrency->name}}" style="padding-left: 0; padding-right: 0">

                      <ion-select-option value="{{$secondCurrency->name}}">{{$secondCurrency->name}}</ion-select-option>
                      @foreach($secondCurrenciesExchanges as $currency )
                        @if($currency->secondCurrency->name != $secondCurrency->name)
                        <ion-select-option  value="{{$currency->secondCurrency->id}}">{{ $currency->secondCurrency->name}} </ion-select-option>
                        @endif
                        @endforeach
                    </ion-select>
                    </ion-card-subtitle>
                    <ion-card-title>{{ \App\Helpers\Money::instance()->value($wallet->amount, $wallet->Currency->symbol) }}</ion-card-title>
                    <ion-card-title color="success"><ion-text color="secondary"></ion-text></ion-card-title>
                  </ion-label>
                  <form action="{{route('post.exchange')}}" method="post" id="exchange_form" enctype="multipart/form-data">
                  {{csrf_field()}}
                  <input type="hidden" name="exchange_id" value="{{$exchange->id}}">
                  <input type="hidden" value="{{$firstCurrency->id}}" name="first_currency_id"> 
                  <input type="hidden" value="{{$secondCurrency->id}}" name="second_currency_id"> 
                  <ion-button expand="block" size="large" color="secondary" type="submit" float-right mode="ios" style="margin-bottom:0">
                    <ion-icon name="swap"></ion-icon>
                  </ion-button>
                  </form>
                  </ion-item>
                </ion-card>
                @endif
              </ion-card-body> 
          </ion-card>
          @include('partials.flash')          
        </ion-content>
      </ion-tab>

      <ion-tab-bar slot="bottom">

        <ion-tab-button href="{{route('profile.info')}}">
          <ion-icon name="at" mode="ios"></ion-icon>
        </ion-tab-button>

        <ion-tab-button href="{{route('home')}}">
          <ion-icon name="paper"></ion-icon>
          <ion-badge>6</ion-badge>
        </ion-tab-button>

        <ion-tab-button  href="{{route('sendMoneyForm')}}" >
          <ion-icon name="paper-plane" mode="ios"></ion-icon>
        </ion-tab-button>

        <ion-tab-button tab="Exchange">
          <ion-icon name="repeat"></ion-icon>
        </ion-tab-button>

      </ion-tab-bar>
    </ion-tabs>
    
  </ion-content>
</ion-app>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
    var customActionSheetSelect = document.getElementById('customActionSheetSelect');
    var customActionSheetOptions = {
      header: 'Wallets',
      subHeader: 'Select your wallet by its currency',
    };
    customActionSheetSelect.interfaceOptions = customActionSheetOptions;
    customActionSheetSelect.addEventListener('ionChange', function(evt) {
    
    //window.location.href = "{{ url('/') }}/wallet/"+evt.target.value;
    window.location.replace("{{ url('/') }}/wallet/"+evt.target.value);
    });

    var customActionSheetSelect2 = document.getElementById('customActionSheetSelect2');
    var customActionSheetOptions2 = {
      header: 'Wallets',
      subHeader: 'Select your wallet by its currency',
    };
    customActionSheetSelect2.interfaceOptions = customActionSheetOptions2;
    customActionSheetSelect2.addEventListener('ionChange', function(evt) {
    
    //window.location.href = "{{ url('/') }}/wallet/"+evt.target.value;
    window.location.replace("{{url('/')}}/exchange/first/{{$firstCurrency->id}}/second/"+evt.target.value);
    });


});
function SendMoney(){
  document.getElementById('sendMoneyForm').submit();
  //document.forms["sendMoneyForm"].submit();
}
</script>    
</body>
</html>
{{--
@extends('layouts.app')

@section('content')

  <form action="{{route('post.exchange')}}" method="post" id="exchange_form" enctype="multipart/form-data">
    <div class="row">
        
        <div class="col-md-6 " >
          <div class="card">
              <div class="header">
                  <h2><strong>{{__('Exchange')}}</strong> {{__('money between wallets')}}</h2>
                 
              </div>
              <div class="body">
                   {{csrf_field()}}
                    <input type="hidden" name="exchange_id" value="{{$exchange->id}}">
                    <div class="row">
                      <div class="col">
                        <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                          <div class="form-group">
                            <label for="first_currency_id"><h6>{{__('One')}} ( <span class="text-primary">1 {{$firstCurrency->symbol}}</span>) {{$firstCurrency->name}} </h6> </label>  <label for="second_currency_id"><h6>{{__('Exchanges')}} {{__('to')}} ( <span class="text-primary"> {{$exchange->exchanges_to_second_currency_value}} {{$secondCurrency->symbol}}</span>) {{$secondCurrency->name}} </h6></label>
                            <select class="form-control d-none" id="first_currency_id" name="first_currency_id">
                                  <option value="{{$firstCurrency->id}}" data-value="{{$firstCurrency->id}}" selected >{{$firstCurrency->name}}</option>
                            </select>
                            @if ($errors->has('first_currency_id'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('first_currency_id') }}</strong>
                              </span>
                          @endif
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        
                            <div class="nav-item dropdown">
                                <a id="CurrencyNavbarDropdown" class="nav-link dropdown-toggle btn btn-xs btn-outline btn-dark text-white" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre=""> {{$firstCurrency->name}} <span class="badge badge-light">{{$firstCurrency->code}}</span></a>
                                <div class="dropdown-menu" aria-labelledby="CurrencyNavbarDropdown">
                                   @forelse($firstCurrenciesExchages as $currency)
                                   @if($currency->firstCurrency->id != $firstCurrency->id)
                                  <a class="dropdown-item" href="{{url('/')}}/exchange/first/{{$currency->firstCurrency->id}}/second/"> 
                                  {{$currency->firstCurrency->name}}
                                  </a>
                                  @endif
                                   @empty
                                  @endforelse
                                </div>
                            </div>
                      </div>
                      <div class="col">
                        <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                          <div class="form-group">
                           
                            <select class="form-control d-none" id="second_currency_id" name="second_currency_id">
                                  <option value="{{$secondCurrency->id}}" data-value="{{$secondCurrency->id}}" selected>{{$secondCurrency->name}}</option>
                            </select>
                            <div class="nav-item dropdown">
                                <a id="CurrencyNavbarDropdown" class="nav-link dropdown-toggle btn btn-xs btn-outline btn-primary text-white" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre=""> {{$secondCurrency->name}} <span class="badge badge-light">{{$secondCurrency->code}}</span></a>
                                <div class="dropdown-menu" aria-labelledby="CurrencyNavbarDropdown">
                                   @forelse($secondCurrenciesExchanges as $currency)
                                   @if($currency->secondCurrency->id != $secondCurrency->id)
                                  <a class="dropdown-item" href="{{url('/')}}/exchange/first/{{$firstCurrency->id}}/second/{{$currency->secondCurrency->id}}"> 
                                  {{$currency->secondCurrency->name}}
                                  </a>
                                  @endif
                                   @empty
                                  @endforelse
                                </div>
                            </div>
                            @if ($errors->has('second_currency_id'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('second_currency_id') }}</strong>
                              </span>
                          @endif
                          </div>
                        </div>
                      </div>
                      
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                      
                      <div class="col">
                        <div class="form-group {{ $errors->has('amount') ? ' has-error' : '' }}">
                           <label for="amount"><h6>{{__('Amount to be exchanged')}}</h6></label>
                           <input type="text" name="amount" class="form-control" value="0"  v-on:keyup="exchange" v-on:change="exchange">
                            @if ($errors->has('amount'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('amount') }}</strong>
                                </span>
                            @endif
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group {{ $errors->has('amount') ? ' has-error' : '' }}">
                           <label for="amount"><h2 class=" mb-0 mt-0"><span class="text-primary">@{{total}}</span><small>{{$secondCurrency->symbol}}</small></h2></label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-12">
                        <input type="submit" class="btn btn-outline-secondary btn-block btn-lg pull-right" value="{{__('Exchange')}}">
                      </div>
                    </div>
                    <div class="clearfix"></div>                       
                  
              </div>
          </div>
        </div>
        @include('partials.sidebar')
        <div class="col-md-3">
          @if( $wallet != false )
          <div class="card mb-3 bg-primary text-white">
              <div class="card-header"><h6>{{__('Balance')}}</h6></div>

              <div class="card-body">
                  <h6>{{__('Available')}}<span class="text-dark"> {{ $wallet->Currency->name }} </span></h6>
                  <h2>{{ \App\Helpers\Money::instance()->value($wallet->amount, $wallet->Currency->symbol) }} </h2>
              </div>
              <div class="card-footer">
                  <div class="nav-item dropdown">
                      <a id="CurrencyNavbarDropdown" class="nav-link dropdown-toggle btn btn-xs btn-outline btn-primary text-white" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre=""> {{$secondCurrency->name}} <span class="badge badge-light">{{$secondCurrency->code}}</span></a>
                      <div class="dropdown-menu" aria-labelledby="CurrencyNavbarDropdown">
                         @forelse($secondCurrenciesExchanges as $currency)
                         @if($currency->secondCurrency->id != $secondCurrency->id)
                        <a class="dropdown-item" href="{{url('/')}}/exchange/first/{{$firstCurrency->id}}/second/{{$currency->secondCurrency->id}}"> 
                        {{$currency->secondCurrency->name}}
                        </a>
                        @endif
                         @empty
                        @endforelse
                      </div>
                  </div>
              </div>
          </div>
          @endif
        </div>
    </div>
     </form>
@endsection

@section('js')
@include('exchange.vue')
<script>
$( "#first_currency_id" )
  .change(function () {
    $( "#first_currency_id option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/exchange/first/" +$(this).val()+"/second");
  });
});

$( "#second_currency_id" )
  .change(function () {
    $( "#second_currency_id option:selected" ).each(function() {
      window.location.replace(window.location.href+'/'+$(this).val());
  });
})
  //   ;

</script>

@endsection
@section('footer')
  @include('partials.footer')
@endsection

--}}