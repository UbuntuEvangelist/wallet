<div class="row clearfix">
    <div class="col">
        <div class="card" >

            <div class="header">
                <h2><strong>{{__('Transaction')}}</strong> {{__('details')}}</h2>
            </div> 
            <div class="body">
                <div class="row clearfix">
                    <div class="col-md-6 col-sm-6">
                        <address>
                            <strong>Purchase from {{$merchant->name}}.</strong><br>
                            Store: {{$merchant->name}}<br>
                            Store link: <a href="{{$merchant->site_url}}" target="_blank">{{$merchant->site_url}}</a>
                        </address>
                    </div>
                    <div class="col-md-6 col-sm-6 text-right">
                        <p class="m-b-0"><strong>Transaction Date: </strong> {{$transaction->created_at->toFormattedDateString()}}</p>
                        <p class="m-b-0"><strong>Transaction Status: </strong> @include('home.partials.status')</p>
                        <p><strong>Transaction ID: </strong> #{{$transaction->id}}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 bg-light p-3 m-1">
                        <span>
                            <strong>Your Payment</strong>
                        </span>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 c0l-xs-12 pl-3   mb-0">
                        <span class="float-left">
                            <strong>Gross Amount</strong>
                        </span>
                        <span class="float-right">
                           {{$transaction->gross()}}
                        </span>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 c0l-xs-12 pl-3  mb-0">
                        <span class="float-left">
                            <strong>{{setting('site.title')}} Transaction Fee</strong>
                        </span>
                        <span class="float-right">
                           {{$transaction->fee()}}
                        </span>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 c0l-xs-12 pl-3  mb-0">
                        <hr style="border-top: 1px dotted rgba(0,0,0,.3);margin: 5px 0;">
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 c0l-xs-12 pl-3  mb-0">
                        <span class="float-left">
                            <strong>Net Amount</strong>
                        </span>
                        <span class="float-right">
                           {{$transaction->net()}}
                        </span>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-12 pl-3  mt-3 mb-3">
                        <hr style="border-top: 1px dotted rgba(0,0,0,.3);">
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 c0l-xs-12 pl-3  mb-0">
                        <span class="float-left">
                            <strong>Contact information</strong>
                        </span>
                        <span class="float-right">
                           {{setting('site.title')}} account
                        </span>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-12 pl-3  mt-3 mb-3">
                        <hr style="border-top: 1px dotted rgba(0,0,0,.3);">
                    </div>
                </div>
                 <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 c0l-xs-12 pl-3  mb-0">
                        <span class="float-left">
                            <strong>Funding Details</strong>
                        </span>
                        <span class="float-right">
                           {{setting('site.title')}} account
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row clearfix">
    <div class="col">
        <div class="card">
            <div class="header">
                <h2><strong>{{__('Purchase')}}</strong> {{__('Invoice')}}</h2>
                
            </div>
            <div class="body">
                <h3 class="m-b-4">Invoice ID : <strong class="text-primary">#{{$invoice->invoice_id}}</strong></h3>

                <div class="row clearfix">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>                                                        
                                        <th>Item</th>
                                        <th class="hidden-sm-down">Description</th>
                                        <th>Quantity</th>
                                        <th class="hidden-sm-down">Unit Cost</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($invoice->items as $item)
                                    <tr>
                                        <td> {{ $loop->index }} </td>
                                        <td>{{ $item->name }}</td>
                                        <td class=""> {{ $item->description }} </td>
                                        <td class=""> {{ $item->qty }} </td>
                                         <td class=""> {{ $item->price }} {{$transaction->currency_symbol}}</td>
                                        <td class=""> {{ ($item->price * $item->qty) }} {{$transaction->currency_symbol}} </td>
                                    </tr>
                                    @endforeach
                                            
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row clearfix">
                    <div class="col-md-6">
                        <h5>Note</h5>
                        <p>{{$invoice->invoice_description}}</p>
                    </div>
                    <div class="col-md-6 text-right">
                        <p class="m-b-0"><b>Sub-total:</b> {{$invoice->total}} {{$transaction->currency_symbol}}</p>
                        <p class="m-b-0">Discout: 0%</p>
                        <p class="m-b-0">VAT: 0%</p>                                        
                        <h3 class="m-b-0 m-t-10">{{$transaction->currency}} {{$invoice->total}}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row clearfix">
    <div class="col">
        
    </div>
</div>