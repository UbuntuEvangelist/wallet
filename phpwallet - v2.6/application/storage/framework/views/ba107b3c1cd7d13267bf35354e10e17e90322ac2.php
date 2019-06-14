<div class="col-10" style="margin-top: 20px">
    <div class="card card-primary">
        
        <div class="card-body">
            <div class="row">

                <div class="col">
                    <h4 class="mb-5 mt-5"><?php echo e(__('Your Invoice')); ?></h4> 
                    <div class="card mb-5">
                        <div class="card-body bg-primary text-white" style="background-color: #dff0d8;">
                            <table class="table border-secondary">
                                <thead>
                                  <tr>
                                    <th class="border-top-0"><?php echo e(__('name')); ?></th>
                                    <th class="border-top-0"><?php echo e(__('price')); ?></th>
                                    <th class="border-top-0"><?php echo e(__('quantity')); ?></th>
                                  </tr>
                                </thead>
                                <tbody>
                                
                                <?php $__currentLoopData = session()->get('PurchaseRequest')->data->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($item->name); ?></td>
                                        <td><?php echo e(\App\Helpers\Money::instance()->value($item->price)); ?><?php echo e(session()->get('PurchaseRequest')->currency->symbol); ?> </td>
                                        <td><?php echo e($item->qty); ?></td>
                                    </tr>
                                  
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer bg-light text-dark">
                             <h3 style="font-weight: bold;"><span class="float-left">Total</span><span class="float-right"><?php echo e(\App\Helpers\Money::instance()->value(session()->get('PurchaseRequestTotal'))); ?> <?php echo e(session()->get('PurchaseRequest')->currency->symbol); ?></span> <div class="clearfix"></div></h3>
                        </div>
                    </div>
                </div>
                <div class="col">
                    
                    <h4 class="mb-5 mt-5"><?php echo e(__('Pay With')); ?> <?php echo e(setting('site.site_name')); ?></h4>

                    <?php if(session()->get('PurchaseRequest')->attempts > 1 and  session()->get('PurchaseRequest')->attempts <= 5 ): ?>
                        <div class="clearfix"></div>
                        <div class="alert alert-info" role="alert" style="margin-top: 20px;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>
                                <a class="btn btn-link " href="<?php echo e(route('password.request')); ?>">
                                    <?php echo e(__('Forgot Your Password?')); ?>

                                </a>
                            </strong>
                            <?php echo e(5 - session()->get('PurchaseRequest')->attempts); ?> Attempts left
                        </div>
                    <?php endif; ?>
                    <?php echo $__env->make('flash', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                    <form class="form-horizontal" method="POST" action="<?php echo e(route('logandpay')); ?>">
                        <?php echo e(csrf_field()); ?>

                        <input type="hidden" name="ref" value="<?php echo e($ref); ?>">
                        <div class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                            

                                <input id="email" type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>" required autofocus placeholder="E-Mail Address">

                                <?php if($errors->has('email')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('email')); ?></strong>
                                    </span>
                                <?php endif; ?>
                        </div>

                        <div class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
                            

                                <input id="password" type="password" class="form-control" name="password" placeholder="Password" required>

                                <?php if($errors->has('password')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('password')); ?></strong>
                                    </span>
                                <?php endif; ?>
                        </div>

                        

                        <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block btn-lg" style="font-weight: bold"> <?php echo e(__('Make Payment')); ?></button>
                        </div>
                    </form>
                    <div class="clearfix"></div>
                    <hr style="margin-top: 20px; margin-bottom: 20px">
                    <div class="clearfix"></div>
                        <a href="" class="btn btn-dark btn-block btn-lg" style="font-weight: bold; margin-bottom: 20px"><?php echo e(__('Create An Account')); ?></a>
                </div>
            </div>
            <div class="row">
                <div class="col">
                     <div class="mb-5 mt-2">
                        <h4 style="text-align: center;"><?php echo e(setting('site.site_name')); ?> <?php echo e(__('is the faster, safer way to pay in the internet')); ?></h4>
                            <p style="text-align: center;"> <?php echo e(__('No matter where you shop, we keep your financial information secure')); ?></p>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</div>