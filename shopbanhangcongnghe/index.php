<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="style/css/flexslider.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="style/css/bootstrap.min.css"/> 
    <!-- <link rel="stylesheet" href="style/css/flexslider.css" type="text/css" media="screen" /> -->
    <title>Website bán hàng online</title>
    
    <!-- hien thi glyphicon -->
    <!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
    
    <link rel="icon" type="image/x-icon" href="admicp/images/cart2.png">
    <link href="style/css/bootstrap.css" rel="stylesheet">

    <link href="style/css/font-awesome.css" rel="stylesheet">
    <!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->
    <link href="style/css/lte.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link href="style/css/owl.carousel.min.css" rel="stylesheet">
    <link href="style/css/AdminLTE.css" rel="stylesheet">
    <link rel="stylesheet" href="style/css/style-jc.css">
    <link href="style/css/menu-tab.css" rel="stylesheet">
    <link href="style/css/style.css" rel="stylesheet">
    <link href="style/css/jquery.bxslider.css" rel="stylesheet">

    <script src="https://connect.facebook.net/vi_VN/sdk.js?hash=8d4926a3ca207e047fe98a228a309d10&amp;ua=modern_es6" async="" crossorigin="anonymous"></script>
	<script id="facebook-jssdk" src="//connect.facebook.net/vi_VN/sdk.js#xfbml=1&amp;version=v2.8"></script>
	<script src="style/js/jquery-2.2.3.min.js"></script>
</head> 
<?php 
    ob_start();
    session_start();
?>
<body>
    <div class="thetop"></div>
    <div id="fb-root" class=" fb_reset">
        <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
        </div>
    </div>
   
        <!-- TOPBAR -->
    <?php
        include('admincp/modules/config.php');
        include('modules/header.php');
        include('modules/menu.php');
        include('modules/main.php');
        include('modules/footer.php');
    ?>
    <script src="style/js/bootstrap.js"></script>
    <!--dropdown-->
    <script src="style/js/app.min.js"></script>

    <script src="style/js/owl.carousel.js"></script>
    <script src="style/js/jquery.jcarousel.js"></script>
    <script src="style/js/jcarousel.connected-carousels.js"></script>
    <script src="style/js/scroll.js"></script>
    <script src="style/js/search-quick.js"></script>
    <script src="style/js/custom-owl.js"></script>
    <script src="style/js/jquery.flexslider.js"></script>
    <div class="scrolltop">
        <div class="scroll icon "><i class="fa fa-4x fa-angle-up "></i></div>
    </div>
    
    <!--dropdown-toggle-->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  -->
    <!--glyphicon-->
   <!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
   <script src = "https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js"> </script> 
</body>
</html>
