@if($deposit->Status->id == 1)
<ion-text float-right color="success"><span class="badge badge-success">{{$deposit->Status->name}}</span></ion-text>
@elseif($deposit->Status->id == 2)
<ion-text float-right color="danger"><button class="btn btn-sm btn-outline-danger">{{$deposit->Status->name}}</button></ion-text>
@elseif($deposit->Status->id == 3)
<ion-text float-right color="secondary"><span class="badge badge-info">{{$deposit->Status->name}}</span></ion-text>
@elseif($deposit->Status->id == 4)
<button class="btn btn-sm btn-outline-primary">{{$deposit->Status->name}}</button>
@endif