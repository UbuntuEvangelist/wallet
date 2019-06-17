<!DOCTYPE html>
<html>
<head>
  <title>My Deposit Requests</title>
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
    <ion-tabs mode="ios" >
      <ion-tab tab="Transactions">
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
          
        <ion-item-divider>
          <ion-label>
            {{__('All Deposits')}}
          </ion-label>
        </ion-item-divider>

        <ion-list  lines="none">
          @forelse($deposits as $deposit)
          <ion-item style="border-bottom: 1px solid #ddd;">
            <ion-icon name="trending-up" color="primary" style="no-margin" slot="start"></ion-icon>               
              <ion-label>
                  <div><h4><strong>{{$deposit->Method->name}}</strong> @include('deposits.partials.status')</h4><ion-text float-right >{{$deposit->net()}}</ion-text></div>
                  <div></div>
                  <div><h6><span>{{$deposit->created_at->format('d M Y')}}</span></h6></div>
             </ion-label>
          </ion-item>
          @empty
          @endforelse
        </ion-list>
              {{$deposits->links()}}            
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

</script> 
</body>
</html>
{{--
@extends('layouts.app')

@section('content')
    <div class="row">
        @include('partials.sidebar')
		
		<div class="col-md-9 ">
        
	        @if($deposits->total()>0)
          <div class="card">
            <div class="header">
                <h2><strong>{{__('My Deposits')}}</strong></h2>
                
            </div>
            <div class="body">
              <div class="table-responsive">
                <table class="table table-striped"  style="margin-bottom: 0;">
                  <thead>
                    <tr>
                      <th>{{__('Date')}}</th>
                      <th>{{__('Method')}}</th>
                      <th>{{__('Gross')}}</th>
                      <th>{{__('Fee')}}</th>
                      <th>{{__('Net')}}</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                    @forelse($deposits as $deposit)
                      <tr>
                        <td>{{$deposit->created_at->format('d M Y')}} <br> @include ('deposits.partials.status')</td>
                        <td>{{$deposit->Method->name}}</td>
                        <td>{{$deposit->gross()}}</td>
                        <td>{{$deposit->fee()}}</td>
                        <td>{{$deposit->net()}}</td>
                      </tr>
                    @empty
                    
                    @endforelse
                  </tbody>
                </table>                          
              </div> 
            </div>
            @if($deposits->LastPage() != 1)
              <div class="footer">
                  {{$deposits->links()}}
              </div>
            @else
            @endif
        </div>
          @endif

    	</div>

    </div>

@endsection

@section('footer')
  @include('partials.footer')
@endsection
--}}