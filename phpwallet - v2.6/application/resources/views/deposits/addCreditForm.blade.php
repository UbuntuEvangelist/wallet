@extends('layouts.app')


@section('content')
{{--  @include('partials.nav')  --}}
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