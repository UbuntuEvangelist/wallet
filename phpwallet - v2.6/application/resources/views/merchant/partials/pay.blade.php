<form action="{{route('login')}}" method="post">
    {{csrf_field()}}
    <input class="btn btn-primary" type="submit" value="Make Payment">
</form>