 <div class="col-md-3">
    <div class="card overflowhidden bitcoin hidden-sm hidden-xs">
        <div class="header">
            <h2><strong><?php echo e(Auth::user()->currentCurrency()->name); ?></strong> <?php echo e(__('Wallet')); ?> <?php echo e(__('Balance')); ?></h2>
            <ul class="header-dropdown">
                <?php if(count(\App\Models\Currency::where('id', '!=', Auth::user()->currentCurrency()->id)->get())): ?>
                    <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                        <ul class="dropdown-menu dropdown-menu-right slideUp float-right">
                            <?php $__currentLoopData = \App\Models\Currency::where('id', '!=', Auth::user()->currentCurrency()->id)->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $currency): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                               <li>
                                <a href="<?php echo e(url('/')); ?>/wallet/<?php echo e($currency->id); ?>"><span> <?php echo e($currency->name); ?></span></a>
                                </li> 
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    </li>
                <?php endif; ?>
                <li class="remove">
                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                </li>
            </ul>
        </div>
        <div class="body">
            <small></small> 
           
            <h2><?php echo e(\App\Helpers\Money::instance()->value(Auth::user()->balance(), Auth::user()->currentCurrency()->symbol)); ?></h2>
            <h6><?php echo e(Auth::user()->currentCurrency()->name); ?> <?php echo e(__('Earnings')); ?></h6>
            <p>This is the available <br><?php echo e(Auth::user()->currentCurrency()->name); ?> wallet earnings<br>  use the button bellow<br> to request a payout.</p>
            <a href="<?php echo e(route('withdrawal.form')); ?>" class="btn btn-primary btn-round"><?php echo e(__('Withdraw funds')); ?></a>
        </div>
        <div id="sparkline16" class="text-center"><canvas width="403" height="390" style="display: inline-block; width: 403.328px; height: 390px; vertical-align: top;"></canvas></div>
    </div>
    <div class="card overflowhidden d-block d-md-none bg-green " >
        <div class="header">
          <h2 class="text-white"><strong></strong><?php echo e(__('Available')); ?> <?php echo e(__('Balance')); ?> </h2>
           
        </div>
        <div class="body block-header">
            <div class="row">
                <div class="col">
                    <h1 class="text-white"><?php echo e(\App\Helpers\Money::instance()->value(Auth::user()->balance(), Auth::user()->currentCurrency()->symbol)); ?> </h1>

                   <a href="<?php echo e(route('withdrawal.form')); ?>" class="btn float-right btn-primary btn-round"><?php echo e(__('Withdraw funds')); ?></a>
                </div>   
            </div>
        </div>
    </div>
 
    <?php if(Auth::user()->role_id == 1 or Auth::user()->is_ticket_admin ): ?>
    <div class="card hidden-sm">
    <div class="header">
        <h2><strong>Admin</strong> area</h2>
        <ul class="header-dropdown">
            <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                <ul class="dropdown-menu dropdown-menu-right slideUp float-right">
                    <li><a href="javascript:void(0);">Edit</a></li>
                    <li><a href="javascript:void(0);">Delete</a></li>
                    <li><a href="javascript:void(0);">Report</a></li>
                </ul>
            </li>
            <li class="remove">
                <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
            </li>
        </ul>
    </div>
    <div class="body">
               <h5 class="card-title">Howdy Mr. admin <?php echo e(Auth::user()->name); ?></h5>
            <p class="card-text">In this section you have links that are only visible to admins.</p>
             <div class="list-group mb-2">
                <a href="<?php echo e(route('makeVouchers')); ?>" class="list-group-item list-group-item-action <?php echo e((Route::is('makeVouchers') ? 'active' : '')); ?>"><?php echo e(__('Generate Vouchers')); ?></a>
                <?php if(Auth::user()->is_ticket_admin): ?>
                    <a href="<?php echo e(url('ticketadmin/tickets')); ?>" class="list-group-item list-group-item-action <?php echo e((Route::is('support') ? 'active' : '')); ?>"><?php echo e(__('Manage Tickets')); ?></a>
                <?php endif; ?>
            </div>
            <a href="<?php echo e(url('/')); ?>/admin" class="btn btn-primary btn-round">Go to admin dashboard</a>                  
        
    </div>
</div> 
    <?php endif; ?>
    <?php if(!Route::is('exchange.form')): ?>
     
    <div class="list-group">
        
    </div>
    <?php endif; ?>
</div>