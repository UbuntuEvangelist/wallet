@extends('layouts.app')

@section('content')
        <div class="row-cleardix">
            <div class="col-lg-12 pl-0 pr-0">
                <div class="card">
                    <div class="header">
                        <h2><strong>Single</strong> Invoice</h2>
                        <ul class="header-dropdown">
                     
                        </ul>
                    </div>
                    <div class="body">
                        <h3 class="m-b-0">Invoice Details : <strong class="text-primary">#{{$invoice->id}}</strong></h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane in active" id="details" aria-expanded="true">
                <div class="card" id="details">
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-md-6 col-sm-6">
                                <address>
                                    <strong>ThemeMakker Inc.</strong><br>
                                    795 Folsom Ave, Suite 546<br>
                                    San Francisco, CA 54656<br>
                                    <abbr title="Phone">P:</abbr> (123) 456-34636
                                </address>
                            </div>
                            <div class="col-md-6 col-sm-6 text-right">
                                <p class="m-b-0"><strong>Order Date: </strong> {{$invoice->created_at}}</p>
                                <p class="m-b-0"><strong>Order Status: </strong> <span class="badge badge-warning m-b-0">{{ ($invoice->is_paid)? 'paid' : 'waiting payment' }}</span></p>
                                <p><strong>Order ID: </strong> #{{$invoice->id}}</p>
                            </div>
                        </div>
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
                                            @foreach($invoice->json_data->items as $item)

                                            <tr>
                                                <td> {{ $loop->index }} </td>
                                                <td>{{ $item->name }}</td>
                                                <td class=""> {{ $item->description }} </td>
                                                <td class=""> {{ $item->qty }} </td>
                                                 <td class=""> {{setting('phpwallet.merchant_currency_symbol')}}{{ $item->price }} </td>
                                                <td class=""> {{setting('phpwallet.merchant_currency_symbol')}}{{ ($item->price * $item->qty) }} </td>
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
                                <p>Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.</p>
                            </div>
                            <div class="col-md-6 text-right">
                                <p class="m-b-0"><b>Sub-total:</b> ${{$invoice->json_data->total}}</p>
                                <p class="m-b-0">Shipping: 0</p>                                        
                                <h3 class="m-b-0 m-t-10">{{setting('phpwallet.merchant_currency')}} {{$invoice->json_data->total}}</h3>
                            </div>                                    
                            <div class="hidden-print col-md-12 text-right">
                                <hr>
                                <button class="btn btn-warning btn-icon  btn-icon-mini btn-round"><i class="zmdi zmdi-print"></i></button>
                                <button class="btn btn-primary btn-round">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
       
@endsection