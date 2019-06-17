<!DOCTYPE html>
<html lang="<?php echo e(app()->getLocale()); ?>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <title><?php echo $__env->yieldContent('page'); ?> - <?php echo e(setting('site.site_name')); ?></title>

    <!-- Styles -->
    <!-- Fonts -->
    

    <!-- Styles -->
    
    
   

    <link rel="stylesheet" href="<?php echo e(asset('assets/css/bootstrap.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/jquery-jvectormap-2.0.3.min.css')); ?>"/>
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/morris.min.css')); ?>" />
    <!-- Custom Css -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/main.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/color_skins.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/bootstrap-select.min.css')); ?>">
    

    <style type="text/css">
    .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}
    .jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    .bitcoin .body {position: absolute;word-break: break-all;}
    .remove{cursor: pointer;}
    </style>


    <?php echo $__env->make('partials.footerstyles', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <script src="<?php echo e(asset('js/vue.min.js')); ?>"></script>
    
</head>
<body class="theme-green menu_dark" id="app">
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="<?php echo e(asset('assets/images/logo.svg')); ?>" width="48" height="48" alt="sQuare"></div>
        <p>Please wait...</p>        
    </div>
</div>
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<?php echo $__env->make('layouts.topnavbar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php echo $__env->make('layouts.aside', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<section class="content">
            <div class="container">
                <?php echo $__env->yieldContent('content'); ?>
            </div>

      <!-- Scripts -->
    <?php echo $__env->yieldContent('footer'); ?>
</section>
    <!-- Jquery Core Js --> 
    <script src="<?php echo e(asset('assets/js/libscripts.bundle.js')); ?>"></script> <!-- Lib Scripts Plugin Js ( jquery.v3.2.1, Bootstrap4 js) --> 
    <script src="<?php echo e(asset('assets/js/vendorscripts.bundle.js')); ?>"></script> <!-- slimscroll, waves Scripts Plugin Js -->

    <script src="<?php echo e(asset('assets/js/morrisscripts.bundle.js')); ?>"></script><!-- Morris Plugin Js -->
    <script src="<?php echo e(asset('assets/js/jvectormap.bundle.js')); ?>"></script> <!-- JVectorMap Plugin Js -->
    <script src="<?php echo e(asset('assets/js/knob.bundle.js')); ?>"></script> <!-- Jquery Knob-->

    <script src="<?php echo e(asset('assets/js/mainscripts.bundle.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/infobox-1.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/index.js')); ?>"></script>

    <?php echo $__env->yieldContent('js'); ?>
    
</body>
</html>
