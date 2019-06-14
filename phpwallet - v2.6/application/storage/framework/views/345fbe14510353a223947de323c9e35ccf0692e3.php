

<?php $__env->startSection('content'); ?>

    <?php if($transaction->transactionable_type == "App\Models\Sale"): ?>
		<?php echo $__env->make('Transactions.type.sale', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php elseif($transaction->transactionable_type == "App\Models\Purchase"): ?>
		<?php echo $__env->make('Transactions.type.purchase', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php endif; ?>
            
    <div class="row">
    	<div class="col">
    	</div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
	<?php echo $__env->make('partials.footer', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.transaction', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>