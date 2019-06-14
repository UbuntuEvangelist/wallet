<nav class="top_navbar">
    <div class="container">
        <div class="row clearfix">
            <div class="col-12">
                <?php echo $__env->make('cookieConsent::index', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-12">
                <div class="navbar-logo">
                    <a href="javascript:void(0);" class="bars"></a>
                    <a class="navbar-brand" href="<?php echo e(url('/')); ?>">
                        <img src="<?php echo e(asset('assets/images/logo.svg')); ?>" width="30" alt="InfiniO"> 
                        <span class="m-l-10"><?php echo e(setting('site.site_name')); ?></span>
                    </a>
                </div>
                <?php if(auth()->guard()->check()): ?>
                <ul class="nav navbar-nav">
                    <li><a href="<?php echo e(url('/')); ?>/buyvoucher"><i class="icon-diamond"></i></a></li>
                    <li class="dropdown task ">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="icon-wallet"></i>
                            <span class="label-count"><?php echo e(Auth::user()->currentCurrency()->code); ?></span>
                        </a>
                    </li> 
                    <li class="dropdown profile">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <img src="<?php echo e(Auth::user()->avatar()); ?>" alt="" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu pullDown">
                            <li>
                                <div class="user-info">
                                    <h6 class="user-name m-b-0"><?php echo e(Auth::user()->name); ?></h6>
                                    <?php if(Auth::user()->verified == 1 ): ?>
                                    <p class="user-position"><span class="badge badge-success ml-0 mt-3">Verified</span></p>
                                    <?php else: ?>
                                    <p class="user-position"><a class="" href="<?php echo e(url('/')); ?>/resend/activationlink"><span class="badge badge-danger ml-0 mt-3">Verify your email</span></a></p>
                                    <?php endif; ?>
                                    
                                    <hr>
                                </div>
                            </li>                            
                            <li><a href="<?php echo e(route('profile.info')); ?>"><i class="icon-user m-r-10"></i> <span><?php echo e(__('Profile')); ?></span> </a></li>                            
                            <li><a href="<?php echo e(url('/')); ?>/my_tickets"><i class="icon-lock m-r-10"></i><span><?php echo e(__('Support')); ?></span></a></li>
                            <li><a  href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i class="icon-power m-r-10"></i><span>    <?php echo e(__('Logout')); ?></span></a><form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                                        <?php echo csrf_field(); ?>
                                    </form></li>
                        </ul>
                    </li>
                    <li class="hidden-xs hidden-sm"><a href="javascript:void(0);" class="js-right-sidebar"><i class="icon-equalizer"></i></a></li>
                </ul>
                <?php endif; ?>
            </div>
        </div>        
    </div>
</nav>