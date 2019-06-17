<!DOCTYPE html>
<html>
<head>
	<title>My Transactions</title>
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
    			<ion-list lines="none">
	        		@include('home.partials.transactions_to_confirm')
    			</ion-list>
				<ion-item-divider>
					<ion-label>
						{{__('Completed Transactions')}}
					</ion-label>
				</ion-item-divider>

				<ion-list  lines="none">
					@include('home.partials.transactions')
				</ion-list>

				
							{{$transactions->links()}}
							
						
				</ion-content>
			</ion-tab>
			<ion-tab tab="settings">Settings Content</ion-tab>

			<ion-tab-bar slot="bottom">


				<ion-tab-button href="{{route('profile.info')}}">
					<ion-icon name="at" mode="ios"></ion-icon>
				</ion-tab-button>

				<ion-tab-button tab="Transactions">
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

    <div class="row clearfix">
        @include('partials.sidebar')
		
		<div class="col-md-9 " >
        	@include('partials.flash')
	        @include('home.partials.transactions_to_confirm')
	        
	        @include('home.partials.transactions')

    	</div>

    </div>
@endsection

@section('footer')
	@include('partials.footer')
@endsection
--}}