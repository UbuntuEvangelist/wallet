@extends('layouts.transaction')

@section('content')

    @if($transaction->transactionable_type == "App\Models\Sale")
		@include('Transactions.type.sale')
    @elseif($transaction->transactionable_type == "App\Models\Purchase")
		@include('Transactions.type.purchase')
    @endif
            
    <div class="row">
    	<div class="col">
    	</div>
    </div>
@endsection

@section('footer')
	@include('partials.footer')
@endsection
