
                      @forelse($transactions as $transaction)
                      <ion-item style="border-bottom: 1px solid #ddd;">
                        @if($transaction->money_flow != "-") <ion-icon name="trending-up" color="primary" style="no-margin" slot="start"></ion-icon> @else <ion-icon name="trending-down"  style="no-margin" slot="start"></ion-icon> @endif 
                          
                          <ion-label>
                              <div><h4><strong>@include('home.partials.name')</strong></h4><ion-text float-right @if($transaction->money_flow != "-") color="primary" @endif> {{$transaction->gross()}}</ion-text></div>
                              <div></div>
                              <div><h6><span>{{$transaction->created_at->format('d M Y')}}</span></h6></div>
                         </ion-label>
                      </ion-item>
                        
                    @empty
                    @endforelse
        
        {{--<tr>
                          <td>{{$transaction->id}}<br>
                            @if($transaction->transactionable_type == "App\Models\Sale" or $transaction->transactionable_type == "App\Models\Purchase")
                            <a href="{{url('/')}}/transaction/{{$transaction->id}}" class="button"><span class=" ml-0 mr-0">{{__('invoice')}}</span></a>
                            @endif
                          </td>
                          <td>{{$transaction->created_at->format('d M Y')}} <br> @include('home.partials.status')</td>
                          <td class="hidden-xs"> @include('home.partials.name')</td>
                          <td class="hidden-xs">{{$transaction->gross()}}</td>
                          <td class="hidden-xs">{{$transaction->fee()}}</td>
                          <td>{{$transaction->net()}}</td>
                          <td>{{$transaction->balance()}}</td>
                        </tr>
                        --}}