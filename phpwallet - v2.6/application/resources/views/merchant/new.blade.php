@extends('layouts.app')

@section('content')
@include('partials.nav')
<div class="container">
    <div class="row">
        @include('partials.sidebar')
        <div class="col-md-9 " >
            <div class="card">
                <div class="header">
                    <h2><strong>{{__('New Merchant')}}</strong></h2>
                    
                </div>
                <div class="body">
                     <form action="{{route('merchant.add')}}" method="post" enctype="multipart/form-data">
                    {{csrf_field()}}
                    <div class="row">
                        <div class="col">
                            <div class="form-group {{ $errors->has('merchant_currency') ? ' has-error' : '' }}">
                              <div class="form-group">
                                <label for="merchant_currency_code">{{__('Merchant Currency')}}</label>
                                <select class="form-control" id="merchant_currency" name="merchant_currency">
                                  @forelse($currencies as $currency)
                                      <option value="{{$currency->id}}" data-value="{{$currency->id}}" @if(Auth::user()->currentCurrency()->id == $currency->id)  selected @endif>{{$currency->name}}</option>
                                  @empty


                                  @endforelse
                                </select>[ <span class="text-primary">{{Auth::user()->currentCurrency()->code}}</span> ]
                                @if ($errors->has('merchant_currency'))
                                  <span class="help-block text-danger">
                                      <strong>{{ $errors->first('merchant_currency') }}</strong>
                                  </span>
                              @endif
                              </div>
                            </div>
                        </div>
                        <div class="col">
                          <div class="form-group {{ $errors->has('merchant_name') ? ' has-error' : '' }}">
                            <label for="merchant_name">{{__('Name')}}</label>
                            <input type="text" class="form-control" id="merchant_name" name="merchant_name" value="{{ old('merchant_name') }}" required >
                            @if ($errors->has('merchant_name'))
                                <span class="help-block text-danger">
                                    <strong>{{ $errors->first('merchant_name') }}</strong>
                                </span>
                            @endif
                          </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col">
                          <div class="form-group {{ $errors->has('merchant_site_url') ? ' has-error' : '' }}">
                            <label for="merchant_site_url">{{__('Site URL')}}</label>
                            <input type="text" class="form-control" id="merchant_site_url" name="merchant_site_url" value="{{ old('merchant_site_url') }}" required>
                            @if ($errors->has('merchant_site_url'))
                                <span class="help-block text-danger">
                                    <strong>{{ $errors->first('merchant_site_url') }}</strong>
                                </span>
                            @endif
                          </div>
                        </div>
                        {{--
                        <div class="col">
                          <div class="form-group {{ $errors->has('merchant_logo') ? ' has-error' : '' }}">
                            <label for="merchant_logo">{{__('Logo')}}</label>
                            <input type="file" class="form-control" id="merchant_logo" name="merchant_logo" value="{{ old('merchant_logo') }}" required>
                            @if ($errors->has('merchant_logo'))
                                <span class="help-block text-danger">
                                    <strong>{{ $errors->first('merchant_logo') }}</strong>
                                </span>
                            @endif
                          </div>
                        </div>
                        --}}
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col">
                          <div class="form-group {{ $errors->has('merchant_success_link') ? ' has-error' : '' }}">
                            <label for="merchant_success_link">{{__('Success URL')}}</label>
                            <input type="text" class="form-control" id="merchant_success_link" name="merchant_success_link" value="{{ old('merchant_success_link') }}" required>
                            @if ($errors->has('merchant_success_link'))
                                <span class="help-block text-danger">
                                    <strong>{{ $errors->first('merchant_success_link') }}</strong>
                                </span>
                            @endif
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group {{ $errors->has('merchant_fail_link') ? ' has-error' : '' }}">
                            <label for="merchant_fail_link">{{__('Fail URL')}}</label>
                            <input type="text" class="form-control" id="merchant_fail_link" name="merchant_fail_link" value="{{ old('merchant_fail_link') }}" required>
                             @if ($errors->has('merchant_fail_link'))
                                <span class="help-block text-danger">
                                    <strong>{{ $errors->first('merchant_fail_link') }}</strong>
                                </span>
                            @endif
                          </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col">
                          <div class="form-group {{ $errors->has('merchant_description') ? ' has-error' : '' }}">
                            <label for="merchant_description">{{__('Merchant Description')}}</label>
                            <textarea class="form-control" rows="5" id="merchant_description" name="merchant_description" required>{{ old('merchant_description') }}</textarea>
                             @if ($errors->has('merchant_description'))
                                <span class="help-block text-danger">
                                    <strong>{{ $errors->first('merchant_description') }}</strong>
                                </span>
                            @endif
                          </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-lg-12">
                      <input type="submit" class="btn btn-outline-dark btn-lg pull-right" value="Save">
                    </div>
                    <div class="clearfix"></div>
                  </form>                       
                    
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$( "#merchant_currency" )
  .change(function () {
    $( "#merchant_currency option:selected" ).each(function() {
      window.location.replace("{{url('/')}}/wallet/"+$(this).val());
  });
})
</script>
@endsection

@section('footer')
  @include('partials.footer')
@endsection