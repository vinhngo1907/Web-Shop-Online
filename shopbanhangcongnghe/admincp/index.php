<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
  <title>Danh mục sản phẩm</title>
  <link rel="icon" type="image/x-icon" href="css/images/iconu.png">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Danh mục sản phẩm</title>
    
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/font-awesome.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.css">
  <link rel="stylesheet" href="css/ionicons.min.css">
  <meta property="fb:app_id" content="659513967881060"> 

  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <!-- hien thi glyphicon -->
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="css/_all-skins.min.css">
  <script src="js/loader.js"></script>
  <script src="ckeditor/ckeditor.js"></script>
  <style>
    
    .icon{
      padding-top: 11px;
    }
    .cke{visibility:hidden;}
    .content-header h1, th, label{color: #333;}
    label{font-weight: 600 !important;}
    .maudo{color: red}
    .mauxanh18{color: green;}
    .main-header a{text-decoration: none;}
    .active a{text-decoration: none;}
    @font-face {
      font-family: 'Glyphicons Halflings';
      src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot');
      src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.woff') format('woff'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
    }
  </style>
    
</head>
<?php
ob_start();
	session_start();
	if(!isset($_SESSION['dangnhap'])){
		header('location:login.php');
	}
?>
  <body class="hold-transition skin-blue sidebar-mini">
    <script type="text/javascript" src="https://www.gstatic.com/charts/45/loader.js"></script>
  	<div class="wrapper">
      <?php
          include('modules/config.php');
          include('modules/header.php');
          include('modules/menu.php');
      ?>
    </div>
      <script src="js/bootstrap.js"></script>
      <!-- <script src="js/bootstrap.min.js"></script> -->
      <script src="js/jquery-2.2.3.min.js"></script>
      <script type="text/javascript" src="js/delete.js"></script> 

      <!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>  -->
      <!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>  -->

      <script type="text/javascript" src="js/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
      <script type="text/javascript" src="js/tinymce/js/tinymce/tinymce.min.js"></script>
      <script>tinymce.init({ selector:'textarea' });</script>
      
      <!--dropdown-->
      <script src="js/app.min.js"></script>
      
      <!--dropdown-toggle-->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
      
      <!--glyphicon-->
     <!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
     <script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
  </body> 
</html>
