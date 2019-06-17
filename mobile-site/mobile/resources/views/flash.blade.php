

@if(session()->has('flash_message'))
<ion-card color="{{session()->get('flash_message_level')}}">
    <ion-card-header >
        <ion-card-subtitle>Woops</ion-card-subtitle>
    </ion-card-header>
    <ion-card-content>
        {!! session()->get('flash_message') !!} 
    </ion-card-content>
</ion-card>

@endif