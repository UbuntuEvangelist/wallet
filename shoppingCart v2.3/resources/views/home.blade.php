@extends('layouts.app')

@section('content')

    <div class="row clearfix">
      @foreach($products as $product)
          
          <?php

            $thumbnail = 'thumbnails/'.$product->thumbnail ;
          
          ?>
            <div class="col-lg-3 col-md-4 col-sm-12">
                <div class="card product_item">
                    <div class="body">
                        <div class="cp_img">
                            <img src="{{$product->thumbnailurl}}" alt="Product" class="img-fluid">
                            <div class="hover">

                                <a href="{{url('/')}}/item/{{$product->title}}/{{$product->id}}" class="btn btn-primary btn-sm waves-effect"><i class="zmdi zmdi-plus"></i></a>
                            </div>
                        </div>
                        <div class="product_details">
                            <h5><a href="{{url('/')}}/item/{{$product->title}}/{{$product->id}}">{{ str_limit($product->title, 20,  '...') }}</a></h5>
                            <ul class="product_price list-unstyled">
                                @if(( $product->old_price > 0 ) and ($product->old_price != $product->price))
                                <li class="old_price text-primary" style="text-decoration: line-through;">{{setting('phpwallet.merchant_currency_symbol')}} {{ \App\Helpers\Money::instance()->value($product->old_price, '') }}</li>
                                @endif
                                <li class="new_price text-success">{{setting('phpwallet.merchant_currency_symbol')}} {{ \App\Helpers\Money::instance()->value($product->price, '') }}</li>
                            </ul>
                        </div>
                    </div>
                </div>                
            </div>
           
          
          @endforeach
    </div>
    <!--Pagination-->
    @if($products->lastPage() > 1)
    <div class="row clearfix">
            <div class="col-lg-12">
                <div class="card">
                    <div class="body block-header">
                        <div class="row">
                            <div class="col">
                                {{$products->links()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

       

       
      

@endsection
