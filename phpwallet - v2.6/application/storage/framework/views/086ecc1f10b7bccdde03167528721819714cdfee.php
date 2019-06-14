<p>Hello <strong><?php echo e($user->name); ?></strong>, please follow the link bellow to activate your <strong><?php echo e(setting('site.title')); ?>'s</strong>  account.</p>
<a href="<?php echo e(url('/')); ?>/register/<?php echo e(Auth::user()->email); ?>/<?php echo e(Auth::user()->verification_token); ?>">Activation Link</a>
<br>
Or copy and past this url in your browser
<br>
<p style="background-color: #eeeeee; padding: 20px"><?php echo e(url('/')); ?>/register/<?php echo e(Auth::user()->email); ?>/<?php echo e(Auth::user()->verification_token); ?></p>
<p>
	Do not click the link if it's not you!
</p>
