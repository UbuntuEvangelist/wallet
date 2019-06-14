<p>Hello <strong>{{$user->name}}</strong>, please follow the link bellow to activate your <strong>{{setting('site.title')}}'s</strong>  account.</p>
<a href="{{url('/')}}/register/{{Auth::user()->email}}/{{Auth::user()->verification_token}}">Activation Link</a>
<br>
Or copy and past this url in your browser
<br>
<p style="background-color: #eeeeee; padding: 20px">{{url('/')}}/register/{{Auth::user()->email}}/{{Auth::user()->verification_token}}</p>
<p>
	Do not click the link if it's not you!
</p>
