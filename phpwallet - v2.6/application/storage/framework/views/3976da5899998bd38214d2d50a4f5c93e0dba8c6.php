

<?php $__env->startSection('content'); ?>
<div class="container">

    <?php if($merchant): ?>
    <div class="row  justify-content-md-center mb-5 mt-5">
        <div class="col-10" style="margin-top: 20px">
    	   <h2 ><?php echo e($merchant->name); ?></h2>
        </div>
        <?php if(auth()->guard()->check()): ?>
            <?php echo $__env->make('merchant.partials.pay', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
        <?php endif; ?>
        <?php if(auth()->guard()->guest()): ?>
            <?php echo $__env->make('merchant.partials.logandpay', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
        <?php endif; ?>
    </div>
    <?php endif; ?>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('footer'); ?>
    <?php echo $__env->make('partials.footer', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.storefront', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>