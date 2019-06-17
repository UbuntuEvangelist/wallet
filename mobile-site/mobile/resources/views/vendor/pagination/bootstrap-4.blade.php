@if ($paginator->hasPages())

<ion-grid>
    <ion-row>
       {{-- Previous Page Link --}}
        @if ($paginator->onFirstPage())
        <ion-col> 
            <ion-button color="light" expand="full" disabled href="" mode="ios">@lang('pagination.previous')</ion-button>
        </ion-col>
        @else
        <ion-col> 
             <ion-button color="light" expand="full" href="{{ $paginator->previousPageUrl() }}" mode="ios">@lang('pagination.previous')</ion-button>
        </ion-col>
        @endif

        {{-- Next Page Link --}}
        @if ($paginator->hasMorePages())
        <ion-col> 
            <ion-button color="light" expand="full" href="{{ $paginator->nextPageUrl() }}" mode="ios">@lang('pagination.next')</ion-button>
        </ion-col>
        @else
        <ion-col> 
             <ion-button color="light" expand="full" disabled href="" mode="ios">@lang('pagination.next')</ion-button>
        </ion-col>
        @endif
    </ion-row>
</ion-grid>

@endif
