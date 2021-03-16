<?php 
    require"function.php";
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql_sp=mysqli_query($conn,"select * from hanghoa,hieusp where hanghoa.idhieusp=hieusp.idhieusp and mshh = '$_GET[id]'") ;
    $sql = mysqli_query($conn,"select * from hanghoa where mshh='$_GET[id]'");
    $dong_sp=mysqli_fetch_array($sql_sp); 
    $sql_gallery=mysqli_query($conn,"select * from gallery where mshh = '$_GET[id]'");   
    $path = 'admincp/modules/gallery/uploads/';
    //lấy danh sách hình ảnh từ đường dẫn
    $imgList = getImagesFromDir($path);
    $n = count($imgList);
    $img =  getImageFromArray($imgList,$n);
?>
<script type="text/javascript">
    function AddCart(id){
        if(alert("Thêm sản phẩm vào giỏ hàng thành công !")){
            window.location.href="update_cart.php?xem=giohang&id="+id;
        }
    }
</script>
<form action="update_cart.php?xem=giohang&id=<?php echo $dong_sp['mshh'] ?>" method="post" enctype="multipart/form-data">
    
<section id="product-detail">
    <div class="container">
        <div class="products-wrap">
            <form action="" method="post" id="ProductDetailsForm">
                <div class="breadcrumbs">
                    <ul>
                        <li class="home">
                            <a href="index.php" title="Go to Home Page">Trang chủ</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li class="category3">
                            <a href="index.php?xem=chitietloaisp&id=<?php echo $dong_sp['idhieusp'] ?>" title=""><?php echo $dong_sp['tenhieusp'] ?></a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li class="product"><?php echo $dong_sp['tenhh'] ?></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 listimg-desc-product">
                    <!-- <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
                    <script src="js/jquery.flexslider.js" type="text/javascript"></script> -->
                    <script>
                        // FlexSlider
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>
                    <div class="flexslider">
                        <div class="clearfix"></div>
                        <div class="flex-viewport" style="overflow: hidden; position: relative;">
                            <ul class="slides" style="width: 600%; transition-duration: 0s; transform: translate3d(-560px, 0px, 0px);">
                            <?php 
                                if($sql_gallery){
                                    while($row=mysqli_fetch_array($sql_gallery)){
                            ?>
                            <li data-thumb="admincp/modules/gallery/uploads/<?php echo $row['hinhanhsp'] ?>" style="width: 560px; float: left; display: block;" class="flex-active-slide" >
                                <div class="thumb-image" >
                                    <img src="admincp/modules/gallery/uploads/<?php echo $row['hinhanhsp'] ?>" class="img-responsive" draggable="false" />
                                </div>
                            </li>            
                            <?php
                                    }
                                }
                             ?>
                            </ul>
                        </div>
                         <ol class="flex-control-nav flex-control-thumbs" >
                            <!-- <li>
                                <img src="admincp/modules/quanlyhh/uploads/<?php echo $dong_sp['hinhanh'] ?>" class="flex-active" draggable="false" alt=""/>
                            </li> -->
                        <?php     
                        if($sql_gallery){
                            while($row_2 = mysqli_fetch_array($sql_gallery)){        
                        ?>
                            <!-- <li>
                                <img src="admincp/modules/gallery/uploads/<?php echo $row['hinhanhsp'] ?>" draggable="false" />
                            </li> -->
                            <li>
                                <img src="admincp/modules/gallery/uploads/<?php echo $row_2['hinhanhsp'] ?>" class="flex-active" draggable="false" />
                            </li>
                        <?php 
                            } 
                        }
                        ?>
                        </ol>
                            <ul class="flex-direction-nav">
                                <li class="flex-nav-prev">
                                    <a class="flex-prev flex-disabled" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="flex-nav-next">
                                    <a class="flex-next flex-disabled" href="#" tabindex="-1">Next</a>
                                </li>
                            </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="product-view-content">
                        <div class="product-view-name"><h1><?php echo $dong_sp['tenhh'] ?></h1></div>
                        <div class="product-view-price">
                            <?php 
                                if($dong_sp['sale_off'] == 0){ 
                                $dong_sp['giaban']=$dong_sp['giagoc'];
                            ?>
                                <div class="pull-left">
                                    <span class="price-label">Giá bán:</span>
                                    <span class="price"><?php echo number_format($dong_sp['giaban']).' ₫' ?></span>
                                </div>
                            <?php }else{ ?>
                                <div class="pull-left">
                                    <span class="price-label">Giá bán:</span>
                                    <span class="price">
                                        <?php 
                                            $dong_sp['giaban']=($dong_sp['giagoc']-($dong_sp['giagoc']*$dong_sp['sale_off'])/100);
                                            echo number_format($dong_sp['giaban']).' ₫' 
                                        ?>
                                    </span>
                                </div>
                                <div class="product-view-price-old">
                                    <span class="price"><?php echo number_format($dong_sp['giagoc']).' ₫' ?></span>
                                    <span class="sale-flag"><?php echo '-'.$dong_sp['sale_off'].'%' ?></span>
                                </div>
                            <?php }?>
                        </div>
                        <div class="product-status">
                            <p style=" float: left;margin-right: 10px;">Thương hiệu: Samsung</p>
                            <p>| Tình trạng: <?php if($dong_sp['soluonghang'] >= 1){
                                echo 'Còn hàng';
                            } else{ echo 'Hết hàng';} 
                            ?></p>
                        </div>
                        <div class="product-view-desc">
                            <h4>Mô tả:</h4>
                            <p><?php echo $dong_sp['motahh'] ?></p>
                        </div>
                        <div class="actions-qty">
                            <div class="actions-qty__button">
                                <!-- <button class="button btn-cart add_to_cart_detail detail-button" title="Mua ngay" type="button" aria-label="Mua ngay" onclick="AddCart(<?php echo $dong_sp['mshh'] ?>)" name="add_to_cart"> Mua ngay
                                </button> -->
                                <!-- <a href="update_cart.php?xem=giohang&id=<?php echo $dong_sp['mshh'] ?>"> -->
                                <a href="#" onclick="AddCart(<?php echo $dong_sp['mshh'] ?>)">
                                <input type="submit" value="Mua Ngay" class="button btn-cart add_to_cart_detail detail-button" name="add_to_cart" title="Mua ngay"/>
                                </a>
                                
                            </div>
                            <div class="form-group">
                              <label for="">Nhập số lượng cần mua</label>
                              <input type="number" name="soluong" id="" class="form-control" value="1" aria-describedby="helpId">
                              <small id="helpId" class="text-muted">Help text</small>
                            </div>
                        </div>
                        <div class="fk-boxs" id="km-all" data-comt="False">
                            <div id="km-detail">
                                <p class="fk-tit">Khuyến mại đặc biệt (SL có hạn)</p>
                                <div class="fk-main">
                                    <div class="fk-sales">
                                        <ul>
                                            <li>Tặng PMH Phụ Kiện 2,000,000đ (khi phiếu mua hàng trên 100,000,000 đ)</li>
                                        </ul>
                                        <ul>
                                            <li>Tặng Flip Cover chính hãng Samsung (Áp dụng đến 26/05) <a href="#" target="_blank">Xem chi tiết</a>
                                            </li>
                                        </ul>
                                        <ul>
                                            <li>Giảm thêm 900,000đ khi mua combo sức khỏe - thời trang (Điện thoại + Samsung Watch + Samsung Buds) <a href="#" target="_blank">Xem chi tiết</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="margin-top: 20px;">
                            <b>Tình trạng</b>
                            <br>
                            <span>Nguyên hộp. Đầy đủ phụ kiện từ nhà sản xuất, gồm: Sạc, cáp, tai nghe, que lấy SIM, sách hướng dẫn</span>
                        </div>
                        <div style="margin-top: 20px;">
                            <b>Bảo hành</b>
                            <br>
                            <span>Bảo hành 12 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi nhà sản xuất.</span><a href="#" style="color:red"> (Chi tiết)</a>
                        </div>
                    </div>
                </div>
                <div class="product-v-desc col-md-10 col-12 col-xs-12">
                    <h3>Đặc điểm nổi bật</h3>
                    <style type="text/css">
                        .product-v-desc .col-md-10 .col-12 .col-xs-12 p img{width: 555px; height: 250px;}
                    </style>
                    <?php echo $dong_sp['noidung'] ?>
                </div>
               
            </form>
        </div>
    </div>
</section>
</form>