<!DOCTYPE html>
<html>
<head>
  <title>Request a Payout</title>
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
<ion-app background="primary">
  
  <ion-content>
    <ion-tabs >
      <ion-tab tab="Profile">
        <ion-content >
        <ion-content >
        <ion-fab vertical="bottom" horizontal="end" slot="fixed">
            <ion-fab-button>
              <ion-icon name="add"></ion-icon>
            </ion-fab-button>
            <ion-fab-list side="top">
              <ion-fab-button href="#"><ion-icon name="arrow-up"></ion-icon></ion-fab-button>
            </ion-fab-list>
         </ion-fab>
        <ion-card  color="primary" style="margin-top: -40px">
            <ion-card-header>
              <ion-card-subtitle>Wallet Balance</ion-card-subtitle>
            </ion-card-header>
            <ion-item color="primary" lines="none" margin-bottom>
                <ion-label float-left >
                  <ion-card-subtitle >
                  @if(count(\App\Models\Currency::where('id', '!=', Auth::user()->currentCurrency()->id)->get()))

                  <ion-select id="customActionSheetSelect" onclick="" interface="action-sheet" value="{{ Auth::user()->currentCurrency()->name }}" style="padding-left: 0; padding-right: 0" placeholder="Select One">

                    <ion-select-option value="{{ Auth::user()->currentCurrency()->name }}">{{ Auth::user()->currentCurrency()->name }}</ion-select-option>
                    @foreach(\App\Models\Currency::where('id', '!=', Auth::user()->currentCurrency()->id)->get() as $currency )
                      <ion-select-option  value="{{ $currency->id }}">{{ $currency->name }}</ion-select-option>
                      @endforeach
                  </ion-select>
                           
                        @endif
                       
              </ion-card-subtitle>
                  <ion-card-title>{{ \App\Helpers\Money::instance()->value(Auth::user()->balance(), Auth::user()->currentCurrency()->symbol) }}</ion-card-title>
                </ion-label>
                <ion-button expand="block" size="large" color="secondary" float-right href="{{route('add.credit')}}" mode="ios" style="margin-bottom:0">
                    <ion-icon name="add-circle" ></ion-icon>
                  </ion-button>
            </ion-item> 
        </ion-card>
        @include('partials.flash')
        <ion-card color="secondary" >
          <ion-card-header>
            <ion-card-title>
              
              {{__('How to proceed with')}} {{$current_method->name}} {{Auth::user()->currentCurrency()->code}} {{__('Payouts')}}
            </ion-card-title>
          </ioncard-header>
          <ion-card-content>
            <ion-text  color="light">
            {!! $current_method->comment !!}
            </ion-text>
          </ion-card-content>
        </ion-card>
        <ion-grid>
          <ion-row padding>
            <ion-col>
              <form action="{{route('post.withdrawal')}}" method="post" enctype="multipart/form-data">
                    {{csrf_field()}}
              <input type="hidden" value="{{ Auth::user()->currentCurrency()->id }}" name="withdrawal_currency"/>
              <input type="hidden" name="withdrawal_method" value="{{$current_method->id}}" >
              <ion-item>
                <ion-label position="floating">{{__('Withdrawal Method')}}</ion-label>
                 
                <ion-select id="withdrawal_method" onclick="" interface="action-sheet" value="{{$current_method->name}}" style="padding-left: 0; padding-right: 0" placeholder="Select One">
                    <ion-select-option value="{{$current_method->name}}">{{$current_method->name }}</ion-select-option>
                    @foreach($methods as $method )
                      @if($method->name != $current_method->name)
                      <ion-select-option  value="{{ $method->id}}">{{ $method->name }}</ion-select-option>
                      @endif
                    @endforeach
                </ion-select>
                @if ($errors->has('withdrawal_method'))
                  <span class="help-block">
                      <strong>{{ $errors->first('withdrawal_method') }}</strong>
                  </span>
                 @endif
              </ion-item>

              <ion-item>
                <ion-label for="platform_id" position="floating">{{$current_method->name}} ID  </ion-label>
                <ion-input type="text" name="platform_id" id="platform_id" class="form-control" required> </ion-input>
                @if ($errors->has('fee'))
                    <span class="help-block">
                        <strong>{{ $errors->first('platform_id') }}</strong>
                    </span>
                @endif
              </ion-item>
               
              <ion-item>
                <ion-label position="floating">{{__('Amount')}}</ion-label>
                <ion-input type="number" name="amount" value="{{old('amount')}}"></ion-input>
                @if ($errors->has('amount'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('amount') }}</strong>
                    </div>
                @endif
              </ion-item>        
             
            </ion-col>
          </ion-row>
        </ion-grid>
        <ion-button expand="full" mode="ios" margin type="submit">
         {{__('Request Payout')}}
        </ion-button>
         </form>
        </ion-content>
      </ion-tab>
      <ion-tab tab="settings">Settings Content</ion-tab>

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

        <ion-tab-button href="{{url('/')}}/exchange/first/0/second/0">
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


  var withdrawal_method = document.getElementById('withdrawal_method');
  var withdrawal_methodOptions = {
    header: 'Wallets',
    subHeader: 'Select your wallet by its currency',
  };
  withdrawal_method.interfaceOptions = withdrawal_methodOptions;
  withdrawal_method.addEventListener('ionChange', function(evt) {
    
    //window.location.href = "{{ url('/') }}/wallet/"+evt.target.value;
    window.location.replace("{{url('/')}}/withdrawal/request/"+evt.target.value);
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
    <div class="row">
        @include('partials.sidebar')
        <div class="col-md-9 ">
          <div class="card">
          <div class="header">
            <h2><strong>{{__('Withdrawal Request')}}</strong></h2>
          </div>
          <div class="body">
            <form action="{{route('post.withdrawal')}}" method="post" enctype="multipart/form-data" id="withdrawal_form">
              {{csrf_field()}}
              <div class="row">
                <div class="col-lg-4 col-xs-12">
                  <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                    <div class="form-group">
                      <label for="withdrawal_method">{{__('Withdrawal Currency')}} [ <span class="text-primary">{{Auth::user()->currentCurrency()->code}}</span> ]</label>
                      <select class="form-control" id="withdrawal_currency" name="withdrawal_currency">
                        <option value="{{ Auth::user()->currentCurrency()->id }}" data-value="{{ Auth::user()->currentCurrency()->id}}" selected>{{ Auth::user()->currentCurrency()->name }} </option>
                        @forelse($currencies as $currency)
                            <option value="{{$currency->id}}" data-value="{{$currency->id}}">{{$currency->name}}</option>
                        @empty


                        @endforelse
                      </select>
                      @if ($errors->has('withdrawal_currency'))
                        <span class="help-block">
                            <strong>{{ $errors->first('withdrawal_currency') }}</strong>
                        </span>
                    @endif
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-xs-12">
                  <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                    <div class="form-group">
                      <label for="withdrawal_method">{{__('Withdrawal Method')}}</label>
                      <select class="form-control" id="withdrawal_method" name="withdrawal_method">
                        @forelse($methods as $method)
                            <option value="{{$method->id}}" @if($method->name == $current_method->name) selected @endif>{{$method->name}}</option>
                        @empty


                        @endforelse
                      </select>
                      @if ($errors->has('withdrawal_method'))
                        <span class="help-block">
                            <strong>{{ $errors->first('withdrawal_method') }}</strong>
                        </span>
                       @endif
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-xs-12">
                  <div class="row">
                    <div class="col">
                      <div class="form-group {{ $errors->has('amount') ? ' has-error' : '' }}">
                       <label for="amount">{{__('Amount')}}</label>
                       <input type="number" name="amount" class="form-control"  v-on:keyup="totalize" v-on:change="totalize">
                        @if ($errors->has('amount'))
                            <span class="help-block">
                                <strong class="text-danger">{{ $errors->first('amount') }}</strong> <span class="text-primary">{{Auth::user()->currentCurrency()->symbol}}</span> 
                            </span>
                        @endif
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group {{ $errors->has('fee') ? ' has-error' : '' }}">
                       <label for="fee">Net [ <small class="bg-dark text-white"> {{__('gross')}} -  {{__('Fees')}} &nbsp;</span></small> ]</label>
                      
                      <br>
                       <h2 style="margin-top: 0" ><span >@{{total}}</span> {{Auth::user()->currentCurrency()->symbol}}</h2> 
                        @if ($errors->has('fee'))
                            <span class="help-block">
                                <strong>{{ $errors->first('fee') }}</strong>
                            </span>
                        @endif
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="clearfix"></div>
              <div class="row">
                <div class="col">
                  <div class="form-group {{ $errors->has('platform_id') ? ' has-error' : '' }}">
                   <label for="platform_id">{{$current_method->name}} ID  </label>
                 <input type="text" name="platform_id" id="platform_id" class="form-control" required> 
                    @if ($errors->has('fee'))
                        <span class="help-block">
                            <strong>{{ $errors->first('platform_id') }}</strong>
                        </span>
                    @endif
                  </div>
                </div>
              </div>
              <div class="clearfix"></div>
              <div class="row">
                <div class="col-lg-12">
                    <label for="">{{__('About')}} {{$current_method->name}} {{__('withdrawals')}} </label>
                    <div class="alert alert-secondary bg-teal" role="alert">
                        {!! $current_method->comment !!}
                    </div>
                </div>
              </div>
              <div class="clearfix"></div>
              <div class="row">
                <div class="col-lg-12">
                  <input type="submit" class="btn btn-primary float-right" value="{{__('Request Withdrawal')}}">
                </div>
              </div>
              <div class="clearfix"></div>
            </form>
          </div>
        </div>
      </div>
    </div>
@endsection

@section('js')
@include('withdrawals.vue')
<script>
$( "#withdrawal_method" )
  .change(function () {
    $( "#withdrawal_method option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/withdrawal/request/"+$(this).val());
  });
});

$( "#withdrawal_currency" )
  .change(function () {
    $( "#withdrawal_currency option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/wallet/"+$(this).val());
  });
})
</script>

@endsection
@section('footer')
  @include('partials.footer')
@endsection
--}}