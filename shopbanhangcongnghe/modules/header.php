
<section id="header" "="">
	<nav class="navbar" style="z-index: 9999">
		<div class="container">
			<div class="col-md-12 col-lg-12">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed pull-right" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="icon-cart-mobile hidden-md hidden-lg">
						<a href="gio-hang">
							<i class="fa fa-shopping-cart" aria-hidden="true" style="color: #0f9ed8; font-size: 17px;"></i>
							<span>(0)</span>
                        </a>
                    </div>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                	<ul class="nav navbar navbar-nav" id="nav1">
                		<li><a href="/">Trang chủ</a></li>
                		<li><a href="index.php?xem=sanpham">Sản phẩm</a></li>
                		<li><a href="index.php?xem=tintuc">Tin tức</a></li>
                		<li><a href="gioi-thieu">Giới thiệu</a></li>
                		<li><a href="index.php?xem=lienhe">Liên hệ</a></li>
                		<li><a href="index.php?xem=taikhoan">Tài khoản</a></li>
                        <li><a href="index.php?xem=dangky">Đăng ký</a></li>
                        <li><a href="index.php?xem=dangnhap">Đăng nhập</a></li>                	
                    </ul>
                	<ul class="nav navbar navbar-nav pull-right" id="nav2">
                       <?php 
                            // session_start();
                            if(isset($_SESSION['login'])){
                                echo'<li><a href="index.php?xem=taikhoan">Xin chào: '.$_SESSION['login'].'</a></li>
                                <li><a href="index.php?xem=logout">Thoát</a></li>  ';
                        ?>      
                            
                            <?php }else{
                        ?>
                            <li><a href="index.php?xem=register">Đăng ký</a></li>
                            <li><a href="index.php?xem=login">Đăng nhập</a></li>
                        <?php }?>        	
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</section>
<?php 
    $sql_conf=mysqli_query($conn,"select * from cauhinh limit 1");
    if($sql_conf)
        $row_conf=mysqli_fetch_array($sql_conf);
?>
<section class="logo-search">
  <div class="container">
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 logo">
      <a href="index.php"><img src="admincp/images/smart-mobi2.png" alt="Logo Construction"></a>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 search">
        <div class="contact-row">
            <div class="phone inline"><i class="icon fa fa-phone"></i> (87) 012.218.812</div>
            <div class="contact inline"><i class="icon fa fa-envelope"></i> <?php echo $row_conf['mail_smtp'] ?></div>
        </div>
        <form action="index.php?xem=search" method="post" enctype="multipart/form-data" role="form">
            <div class="input-search">
                <input type="text" class="form-control" id="search_text" name="search_text" placeholder="Nhập từ khóa để tìm kiếm...">
                <button name="search" id="search" type="submit"><i class="fa fa-search"></i></button>
            </div>
        </form>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 hidden-xs" style="padding: 24px;">
        <!-- Cart -->
        <div class="cart_header">
            <a href="index.php?xem=giohang" title="Giỏ hàng">
            <span class="cart_header_icon"><img src="admincp/images/cart2.png" alt="Cart"></span>
            <span class="box_text">
                <?php 
                    if(isset($_SESSION['product'])){
                        $sql_product = mysqli_query($conn,"SELECT DISTINCT mshh,giaban FROM giohang ORDER BY mshh");
                        $total = 0; $thanhtien = 0;
                        foreach($_SESSION['product'] as $cart_item){
                            $id=$cart_item['id'];
                            $thanhtien = $cart_item['gia']*$cart_item['soluong'];
                            $total = $total + $thanhtien;
                        }
                        if($sql_product)
                            $count = mysqli_num_rows($sql_product);
                        if($count > 0){
                            echo '
                            <strong class="cart_header_count">Giỏ hàng <span>('.$count.')</span></strong>
                            <span class="cart_price"><p>'.number_format($total).' VNĐ</p></span>';
                        
                        }else{
                        echo'
                            <strong class="cart_header_count">Giỏ hàng <span>(0)</span></strong>
                            <span class="cart_price"><p>0 VNĐ</p></span>';
                        }
                    }else{
                        echo'
                            <strong class="cart_header_count">Giỏ hàng <span>(0)</span></strong>
                            <span class="cart_price"><p>0 VNĐ</p></span>';
                        }
                ?>
                
            </span>
            </a>
            <div class="cart_clone_box">
                <div class="cart_box_wrap hidden">
                    <div class="cart_item original clearfix">
                        <div class="cart_item_image"></div>
                        <div class="cart_item_info">
                            <p class="cart_item_title"><a href="" title=""></a></p>
                            <span class="cart_item_quantity"></span>
                            <span class="cart_item_price"></span>
                            <span class="remove"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Cart -->
        <!-- Account -->
        <div class="user_login">
            <a href="index.php?xem=taikhoan" title="Tài khoản">
            <div class="user_login_icon">
            <img src="admincp/images/user.png" alt="Cart">
            </div>
                <div class="box_text">
                <strong>Tài khoản</strong>
                <!-- <span class="cart_price">Đăng nhập, đăng ký</span> -->
                </div>
            </a>
        </div>
    </div>
</div>
</section>
