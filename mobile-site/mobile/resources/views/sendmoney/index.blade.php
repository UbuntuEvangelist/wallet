<!DOCTYPE html>
<html>
<head>
  <title>Send Money</title>
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
      <ion-tab tab="Send">
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
        <ion-grid>
          <ion-row padding>
            <ion-col>
              <form action="{{route('sendMoney')}}" method="post" id="sendMoneyForm" enctype="multipart/form-data">
                    {{csrf_field()}}
              <ion-item >

                <ion-label position="floating">Amount of {{Auth::user()->currentCurrency()->code}}</ion-label>
                <ion-input type="number" name="amount" value="{{old('amount')}}"></ion-input>
                @if ($errors->has('amount'))
                      <div class="form-control-feedback">
                          <strong>{{ $errors->first('amount') }}</strong>
                      </div>
                @endif
              </ion-item>
              <ion-item >

                <ion-label position="floating">User Name or Email</ion-label>
                <ion-input type="text" name="email" value="{{old('email')}}"></ion-input>
                @if ($errors->has('email'))
                    <div class="form-control-feedback">
                        <strong>{{ $errors->first('email') }}</strong>
                    </div>
                @endif

              </ion-item>
              
              <ion-item >
                <ion-label position="floating">Description</ion-label>
                <ion-textarea name="description" value="{{old('description')}}"></ion-textarea>
                @if ($errors->has('description'))
                    <div class="form-control-feedback">
                        <strong>{{ $errors->first('description') }}</strong>
                    </div>
                @endif
              </ion-item>
              </form>
            </ion-col>
          </ion-row>
        </ion-grid>
        <ion-button expand="full" mode="ios" margin onclick="SendMoney()">
          <ion-icon slot="start"  name="paper-plane"></ion-icon>
          Send Money
        </ion-button>
        
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

        <ion-tab-button tab="Send"  >
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
        <div class="col-md-9 " style="padding-right: 0" id="#sendMoney">
          @include('partials.flash')
          <div class="card">
            <div class="header">
                <h2><strong>{{__('Money')}}</strong> {{__("Transfer")}}</h2>
                
            </div>
            <div class="body">
              <form action="{{route('sendMoney')}}" method="post" enctype="multipart/form-data">
                    {{csrf_field()}}
                    <div class="row">
                      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                      <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                        <div class="form-group">
                          <label for="deposit_method">{{__('Currency')}} [ <span class="text-primary">{{Auth::user()->currentCurrency()->code}}</span> ]</label>
                          <select class="form-control" id="currency" name="currency">
                            <option value="{{ Auth::user()->currentCurrency()->id }}" data-value="{{ Auth::user()->currentCurrency()->id}}" selected>{{ Auth::user()->currentCurrency()->name }} </option>
                            @forelse($currencies as $currency)
                                <option value="{{$currency->id}}" data-value="{{$currency->id}}">{{$currency->name}}</option>
                            @empty


                            @endforelse
                          </select>
                          @if ($errors->has('currency'))
                            <span class="help-block">
                                <strong>{{ $errors->first('withdrawal_currency') }}</strong>
                            </span>
                        @endif
                        </div>
                      </div>
                </div>
                      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group {{ $errors->has('amount') ? ' has-danger' : '' }}">
                          <label for="amount">{{__('Amount')}}</label>
                          <input type="number" class="form-control" id="amount" name="amount" value="{{old('amount')}}" required placeholder="5.00" pattern="[0-9]+([\.,][0-9]+)?" 
                          step="0.01" >
                          @if ($errors->has('amount'))
                                <div class="form-control-feedback">
                                    <strong>{{ $errors->first('amount') }}</strong>
                                </div>
                          @endif
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <label for="email">{{__('Username or Email')}}</label>
                        <div class="input-group {{ $errors->has('email') ? ' has-danger' : '' }}">
                            <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
                            <input type="text" class="form-control email" id="email" name="email" placeholder="Ex: example@example.com" required >
                             @if ($errors->has('email'))
                                <div class="form-control-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </div>
                            @endif
                        </div>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group {{ $errors->has('description') ? ' has-danger' : '' }}">
                          <label for="description">{{__('Note for Recepient')}}</label>
                          <textarea class="form-control" rows="5" id="description" name="description" placeholder="{{__('Write a note...')}}" required></textarea>
                           @if ($errors->has('description'))
                                <div class="form-control-feedback">
                                    <strong>{{ $errors->first('description') }}</strong>
                                </div>
                            @endif
                        </div>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                      <div class="col">
                        <input type="submit" class="btn btn-primary float-right" value="{{__('Send Money')}}">
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
<script>
$( "#currency" )
  .change(function () {
    $( "#currency option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/wallet/"+$(this).val());
  });
})
</script>

@endsection
@section('footer')
  @include('partials.footer')
@endsection
--}}