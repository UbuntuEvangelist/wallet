@extends('layouts.app')

@section('content')
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">
                <div class="row">
                    <div class="preview col-lg-4 col-md-12">
                        <div class="preview-pic tab-content">
                            <div class="tab-pane active show" id="product_1"><img src="{{$product->thumbnailurl}}" class="img-fluid"></div>
                            @if( !is_null($product->preview1_url) )
                            <div class="tab-pane" id="product_2"><img src="{{$product->preview1_url}}" class="img-fluid"></div>
                            @endif
                            @if( !is_null($product->preview2_url) )
                            <div class="tab-pane" id="product_3"><img src="{{$product->preview2_url}}" class="img-fluid"></div>
                            @endif
                            @if( !is_null($product->preview3_url) )
                            <div class="tab-pane" id="product_4"><img src="{{$product->preview3_url}}" class="img-fluid"></div>
                            @endif
                            @if( !is_null($product->preview4_url) )
                            <div class="tab-pane " id="product_5"><img src="{{$product->preview4_url}}" class="img-fluid"></div>
                            @endif
                        </div>
                        <ul class="preview-thumbnail nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active show" data-toggle="tab" href="#product_1"><img src="{{$product->thumbnailurl}}"></a></li>
                            @if( !is_null($product->preview1_url) )
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_2"><img src="{{$product->preview1_url}}"></a></li>
                            @endif
                            @if( !is_null($product->preview2_url) )
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_3"><img src="{{$product->preview2_url}}"></a></li>
                            @endif
                            @if( !is_null($product->preview3_url) )
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_4"><img src="{{$product->preview3_url}}"></a></li>
                            @endif
                            @if( !is_null($product->preview4_url) )
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_5"><img src="{{$product->preview4_url}}"></a></li>
                            @endif                                    
                        </ul>                
                    </div>
                    <div class="details col-lg-8 col-md-12">
                        <h3 class="product-title m-b-0">{{$product->title}}</h3>
                        <h4 class="price m-t-0">Current Price: <span class="col-amber">{{setting('phpwallet.merchant_currency_symbol')}}{{$product->price}}</span></h4>
                        {{-- 
                        <div class="rating">
                            <div class="stars">
                                <span class="zmdi zmdi-star col-amber"></span>
                                <span class="zmdi zmdi-star col-amber"></span>
                                <span class="zmdi zmdi-star col-amber"></span>
                                <span class="zmdi zmdi-star col-amber"></span>
                                <span class="zmdi zmdi-star-outline"></span>
                            </div>
                            <span class="m-l-10">41 reviews</span>
                        </div>
                        --}}
                        <hr>
                        <p class="product-description">{!! $product->description !!}</p>
                        {{-- 
                        <p class="vote"><strong>78%</strong> of buyers enjoyed this product! <strong>(23 votes)</strong></p>
                        <h5 class="sizes">sizes:
                            <span class="size" title="small">s</span>
                            <span class="size" title="medium">m</span>
                            <span class="size" title="large">l</span>
                            <span class="size" title="xtra large">xl</span>
                        </h5>
                        <h5 class="colors">colors:
                            <span class="color bg-amber not-available" title="Not In store"></span>
                            <span class="color bg-green"></span>
                            <span class="color bg-blue"></span>
                        </h5>
                        --}}
                        <hr>
                        <div class="action">
                          <form class="d-flex justify-content-left" method="post" action="{{url('/')}}/addtocart">
                            <input type="number" value="1" name="quantity" aria-label="Search" class="form-control" style="width: 100px">
                            {{csrf_field()}}
                            <input type="hidden" name="product_id" value="{{$product->id}}">
                              <input class="btn btn-primary btn-round waves-effect" value="add to cart" type="submit">
                              {{-- <button class="btn btn-primary btn-icon btn-icon-mini btn-round waves-effect" type="button"><span class="zmdi zmdi-favorite"></span></button> --}}
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{--
    <div class="col-lg-12">
        <div class="card">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active show" data-toggle="tab" href="#description">Description</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#review">Review</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#about">About</a></li>
            </ul>
        </div>
        <div class="card">
            <div class="body">                        
                <div class="tab-content">
                    <div class="tab-pane active show" id="description">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                    </div>
                    <div class="tab-pane" id="review">
                        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied</p>
                        <ul class="row list-unstyled c_review">
                            <li class="col-12">
                                <div class="avatar">
                                    <a href="javascript:void(0);"><img class="rounded" src="../assets/images/xs/avatar2.jpg" alt="user" width="60"></a>
                                </div>                                
                                <div class="comment-action">
                                    <h5 class="c_name">Hossein Shams</h5>
                                    <p class="c_msg m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. </p>
                                    <div class="badge badge-primary">iPhone 8</div>
                                    <span class="m-l-10">
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star-outline text-muted"></i></a>
                                    </span>
                                    <small class="comment-date float-sm-right">Dec 21, 2017</small>
                                </div>                                
                            </li>
                            <li class="col-12">
                                <div class="avatar">
                                    <a href="javascript:void(0);"><img class="rounded" src="../assets/images/xs/avatar3.jpg" alt="user" width="60"></a>
                                </div>                                
                                <div class="comment-action">
                                    <h5 class="c_name">Tim Hank</h5>
                                    <p class="c_msg m-b-0">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout</p>
                                    <div class="badge badge-primary">Nokia 8</div>
                                    <span class="m-l-10">
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star col-amber"></i></a>
                                        <a href="javascript:void(0);"><i class="zmdi zmdi-star-outline text-muted"></i></a>
                                    </span>
                                    <small class="comment-date float-sm-right">Dec 18, 2017</small>
                                </div>                                
                            </li>                                   
                        </ul>
                    </div>
                    <div class="tab-pane" id="about">
                        <h6>Where does it come from?</h6>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    --}}
</div>

  {{--
      <!--Grid row-->
      <div class="row d-flex justify-content-center wow fadeIn">

        <!--Grid column-->
        <div class="col-md-6 text-center">

          <h4 class="my-4 h4">Additional information</h4>

          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus suscipit modi sapiente illo soluta odit voluptates,
            quibusdam officia. Neque quibusdam quas a quis porro? Molestias illo neque eum in laborum.</p>

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->
  --}}

   <!--Grid row-->
      <div class="row d-flex justify-content-center wow fadeIn">

        <!--Grid column-->
        <div class="col-md-6 text-center">

          <h4 class="my-4 h4">Related Products</h4>

          
        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->
      <!--Grid row-->
      <div class="row wow fadeIn">
        @foreach($related as $product)
          
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
                                <li class="old_price" style="text-decoration: line-through;">{{setting('phpwallet.merchant_currency_symbol')}} {{ \App\Helpers\Money::instance()->value($product->old_price, '') }}</li>
                                @endif
                                <li class="new_price text-success">{{setting('phpwallet.merchant_currency_symbol')}} {{ \App\Helpers\Money::instance()->value($product->price, '') }}</li>
                            </ul>
                        </div>
                    </div>
                </div>                
            </div>
          
          @endforeach

      </div>
      <!--Grid row-->

    </div>
@endsection