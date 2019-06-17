@if($withdrawal->Status->id == 1)
<ion-text float-right color="success"><span class="badge badge-success">{{$withdrawal->Status->name}}</span></ion-text>
@elseif($withdrawal->Status->id == 2)
<ion-text float-right color="danger"><button class="btn btn-sm btn-outline-danger">{{$withdrawal->Status->name}}</button></ion-text>
@elseif($withdrawal->Status->id == 3)
<ion-text float-right color="secondary"><span class="badge badge-info">{{$withdrawal->Status->name}}</span></ion-text>
@elseif($withdrawal->Status->id == 4)
<button class="btn btn-sm btn-outline-primary">{{$withdrawal->Status->name}}</button>
@endif