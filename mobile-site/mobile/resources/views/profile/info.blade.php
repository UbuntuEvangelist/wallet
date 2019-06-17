<!DOCTYPE html>
<html>
<head>
  <title>Account</title>
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
        <ion-grid>
          <ion-row padding>
            <ion-col>
              <form action="{{route('profile.info.store')}}" method="post" id="sendMoneyForm" enctype="multipart/form-data">
                    {{csrf_field()}}
              
              

              <ion-item >

                <ion-label position="floating">{{__('First Name')}}</ion-label>
                <ion-input type="text" name="firstName" value="{{Auth::user()->first_name}}"></ion-input>
                @if ($errors->has('firstName'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('firstName') }}</strong>
                    </div>
                @endif

              </ion-item>

              <ion-item >

                <ion-label position="floating">{{__('Last Name')}}</ion-label>
                <ion-input type="text" name="lastName" value="{{Auth::user()->last_name}}"></ion-input>
                @if ($errors->has('lasttName'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('lastName') }}</strong>
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
        

        <ion-tab-button tab="Profile">
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
        @include('profile.partials.sidenav')
		
		<div class="col-lg-9 ">
      <div class="card">
        <div class="header">
            <h2><strong>{{__('Personal Info')}}</strong></h2>
            
        </div>
        <div class="body">
            <form class="needs-validation" enctype="multipart/form-data" method="POST" action="{{route('profile.info.store')}}">
            {{csrf_field()}}
            <div class="row mb-3">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-header">
                    <label for="avatar">{{__('Profile picture')}}</label>
                  </div>
                  <div class="card-body">
                    <img src="{{Auth::user()->avatar()}}" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-md-12 mb-3">
                <label for="avatar">{{__('Upload a profile picture')}}</label>
                  <input type="file" class="form-control" name="avatar" id="avatar" >
                  @if ($errors->has('avatar'))
                        <div class="invalid-feedback">
                            <strong>{{ $errors->first('avatar') }}</strong>
                        </div>
                    @endif
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">{{__('First name')}}</label>
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="{{Auth::user()->first_name}}" required="">
                @if ($errors->has('first_name'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('first_name') }}</strong>
                    </div>
                @endif
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">{{__('Last name')}}</label>
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="{{Auth::user()->last_name}}" required="">
                @if ($errors->has('last_name'))
                    <div class="invalid-feedback">
                        <strong>{{ $errors->first('last_name') }}</strong>
                    </div>
                @endif
              </div>
            </div>

            <div class="mb-3">
              <label for="username">{{__('Username')}}</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="text" class="form-control" id="username" placeholder="Username" value="{{Auth::User()->name}}" disabled="">
                <div class="invalid-feedback" style="width: 100%;">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="email">{{__('Email')}}</label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com" value="{{Auth::User()->email}}" disabled="">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

         

          
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">{{__('Save')}}</button>
          </form>                        
            
        </div>
    </div>

          
        </div>

    </div>
@endsection

@section('footer')
	@include('partials.footer')
@endsection
--}}