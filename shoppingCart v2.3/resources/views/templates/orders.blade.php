@extends('layouts.app')

@section('content')
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="card">
            <div class="header">
                <h2> <strong>Orders</strong></h2>
               
            </div>
            <div class="body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>FIRST NAME</th>
                                <th>LAST NAME</th>
                                <th>USERNAME</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($invoices as $invoice)
                    <tr>
                        <td>{{$loop->iteration}} </td>
                        <td class=""> {{ $invoice->id }}  </td>
                        <td class=""> {{ $invoice->updated_at->diffForHumans() }}  </td>

                        <td class=""> {{ ($invoice->is_paid)? 'paid' : 'waiting payment' }}  </td>
                        <td class="text-right"><a class="btn btn-primary" href="{{url('/')}}/invoice/{{$invoice->id}}">View order invoice</a></td>
                    </tr>
                @empty
                <div>
                    <h1>You don't have orders.</h1>
                </div>
                @endforelse
                           
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="footer">
                <hr>
                {{$invoices->links()}}
            </div>
        </div>
    </div>
</div>

@endsection