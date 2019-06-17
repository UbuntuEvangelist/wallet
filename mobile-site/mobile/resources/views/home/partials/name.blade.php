@if($transaction->activity_title == 'Payment Sent')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> <br><span class="">{{__('To')}} {{$transaction->entity_name}}</span>

@elseif($transaction->activity_title == 'Payment Received')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> <br><span class="">{{__('From')}} {{$transaction->entity_name}}</span>

@elseif($transaction->activity_title == 'Voucher Load')

	<ion-text color="primary">{{$transaction->entity_name}}</ion-text> <br><span class=""> {{__('Voucher Load')}}</span>

@elseif($transaction->activity_title == 'Voucher Generation')

	<ion-text color="primary">{{$transaction->entity_name}}</ion-text> <br><span class=""> {{__('Voucher Generation')}}</span>

@elseif($transaction->activity_title == 'Added Voucher to system')

	<ion-text color="primary">{{$transaction->entity_name}}</ion-text> <br><span class=""> {{__('Added Voucher to system')}}</span>

@elseif($transaction->activity_title == 'Purchase')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> <br><span class="">{{__('From')}} {{$transaction->entity_name}}</span>

@elseif($transaction->activity_title == 'Sale')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> <br><span class="">{{__('In')}} {{$transaction->entity_name}} </span>

@elseif($transaction->activity_title == 'Withdrawal')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> {{__('From')}} {{setting('site.title')}} {{__('to')}}<br><span class="">{{Auth::user()->name}} {{$transaction->entity_name}} {{__('Account')}}</span>

@elseif($transaction->activity_title == 'Deposit')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> {{__('From')}} {{$transaction->entity_name}} {{__('Account')}}  {{__('to')}}<br><span class="">{{Auth::user()->name}} {{setting('site.title')}}</span>

@elseif($transaction->activity_title == 'Currency Exchange')

	<ion-text color="primary">{{$transaction->activity_title}}</ion-text> <br><span class=""> @if($transaction->money_flow == '+') {{__('Exchanged To')}} 	
@else {{__('Exchanged From')}} @endif {{$transaction->entity_name}}</span>

@endif
