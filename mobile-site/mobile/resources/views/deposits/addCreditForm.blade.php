<!DOCTYPE html>
<html>
<head>
  <title>Add Credit</title>
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
              {{__('How to proceed with')}} {{$current_method->name}} {{Auth::user()->currentCurrency()->code}} {{__('deposits')}}
            </ion-card-title>
          </ioncard-header>
          <ion-card-content>
            {!! $current_method->how_to !!}
          </ion-card-content>
        </ion-card>
        <ion-grid>
          <ion-row padding>
            <ion-col>
              <form action="{{route('post.credit')}}" method="post" enctype="multipart/form-data">
                    {{csrf_field()}}
              <input type="hidden" value="{{ Auth::user()->currentCurrency()->id }}" name="deposit_currency"/>
              <input type="hidden" name="deposit_method" value="{{$current_method->id}}" >
              <ion-item>
                <ion-label position="floating">{{__('Deposit Method')}}</ion-label>
                 
                <ion-select id="deposit_method" onclick="" interface="action-sheet" value="{{$current_method->name}}" style="padding-left: 0; padding-right: 0" placeholder="Select One">
                    <ion-select-option value="{{$current_method->name}}">{{$current_method->name }}</ion-select-option>
                    @foreach($methods as $method )
                      @if($method->name != $current_method->name)
                      <ion-select-option  value="{{ $method->id}}">{{ $method->name }}</ion-select-option>
                      @endif
                    @endforeach
                </ion-select>
              </ion-item>

               <ion-item >
                 <ion-label position="floating">{{$current_method->name}} {{__('Transaction Receipt Screenshot')}}</ion-label>
                <ion-input type="file" id="deposit_screenshot" name="deposit_screenshot"></ion-input>
                @if ($errors->has('deposit_screenshot'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('deposit_screenshot') }}</strong>
                    </div>
                @endif
               
                
              </ion-item>

              <ion-item>
                <ion-label position="floating">{{__('Message to the reviewer')}}</ion-label>
                <ion-input type="text" name="message" value="{{old('message')}}"></ion-input>
                @if ($errors->has('message'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('message') }}</strong>
                    </div>
                @endif
              </ion-item>        
             
            </ion-col>
          </ion-row>
        </ion-grid>
        <ion-button expand="full" mode="ios" margin type="submit">
          Save 
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


  var deposit_method = document.getElementById('deposit_method');
  var deposit_methodOptions = {
    header: 'Wallets',
    subHeader: 'Select your wallet by its currency',
  };
  deposit_method.interfaceOptions = deposit_methodOptions;
  deposit_method.addEventListener('ionChange', function(evt) {
    
    //window.location.href = "{{ url('/') }}/wallet/"+evt.target.value;
    window.location.replace("{{url('/')}}/addcredit/"+evt.target.value);
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
        <div class="col-md-9 " >

          <div class="card" >
            <div class="header">
                <h2><strong>{{  __('Deposit Money') }}</strong></h2>
                
            </div>
            <div class="body">
              <form action="{{route('post.credit')}}" method="post" enctype="multipart/form-data" >
                    {{csrf_field()}}
                    <div class="row mb-5">
                      <div class="col-lg-6">
                        <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                            <label for="deposit_method">{{  __('Deposit Currency')  }}</label>
                            <select class="form-control" id="deposit_currency" name="deposit_currency">
                              <option value="{{ Auth::user()->currentCurrency()->id }}" data-value="{{ Auth::user()->currentCurrency()->id}}" selected>{{ Auth::user()->currentCurrency()->name }} </option>
                              @forelse($currencies as $currency)
                                  <option value="{{$currency->id}}" data-value="{{$currency->id}}">{{$currency->name}}</option>
                              @empty


                              @endforelse
                            </select>
                            @if ($errors->has('deposit_currency'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('deposit_currency') }}</strong>
                              </span>
                            @endif
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                          <div class="form-group">
                            <label for="deposit_method">{{__('Deposit Method')}}</label>
                            <select class="form-control" id="deposit_method" name="deposit_method">
                              @forelse($methods as $method)
                                  <option value="{{$method->id}}" @if($method->name == $current_method->name) selected @endif>{{$method->name}}</option>
                              @empty


                              @endforelse
                            </select>
                            @if ($errors->has('deposit_method'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('deposit_method') }}</strong>
                              </span>
                          @endif
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row mb-5">
                      <div class="col-lg-12 ">
                          <label for="">{{__('How to proceed with')}} {{$current_method->name}} {{__('deposits')}} </label>
                          <div  class="alert alert-secondary bg-teal" role="alert">
                              {!! $current_method->how_to !!}
                          </div>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row mb-5">
                      <div class="col">
                        <div class="form-group {{ $errors->has('message') ? ' has-error' : '' }}">
                          <label for="message">{{__('Message to the reviewer')}} </label>
                          <textarea name="message" id="message" cols="30" rows="10" class="form-control" placeholder="{{__('Message to the reviewer')}}"></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row bm-5">
                      <div class="col">
                        <div class="form-group {{ $errors->has('deposit_screenshot') ? ' has-error' : '' }}">
                          <label for="deposit_screenshot">{{$current_method->name}} {{__('Transaction Receipt Screenshot')}}</label>
                          <input type="file" class="form-control" id="deposit_screenshot" name="deposit_screenshot" value="{{ old('merchant_logo') }}" required>
                          @if ($errors->has('deposit_screenshot'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('deposit_screenshot') }}</strong>
                              </span>
                          @endif
                        </div>
                      </div>
                    </div>
                    <div class="row mb-5">
                      <div class="col mt-5 ">
                        <input type="submit" class="btn btn-primary float-right" value="{{__('Save Deposit')}}">
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
$( "#deposit_method" )
  .change(function () {
    $( "#deposit_method option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/addcredit/"+$(this).val());
    });
  });
  $( "#deposit_currency" )
  .change(function () {
    $( "#deposit_currency option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/wallet/"+$(this).val());
    });
  })
</script>

@endsection
--}}