<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql_nhom = mysqli_query($conn,"select * from nhomhanghoa order by manhom asc");
    if($sql_nhom){
        while($rows_nhom=mysqli_fetch_array($sql_nhom)){
            $id_nhom = $rows_nhom['manhom'];
?>
<div class="list-product">
    <div class="list-header-z">
        <h2><a href="index.php?xem=loaisp&id=<?php echo $rows_nhom['manhom'] ?>">
            <?php echo $rows_nhom['tennhom'].' nổi bật' ?>        
            </a>
        </h2>
        <ul class="sub-category">
        <?php 
            $query_product = mysqli_query($conn,"select * from hanghoa,hieusp where hieusp.idhieusp=hanghoa.idhieusp and hanghoa.manhom='$id_nhom'");
            if($query_product){
                while($rows_hieusp=mysqli_fetch_array($query_product)){
        ?>
            <li>
                <a href="index.php?xem=chitietloaisp&id=<?php echo $rows_hieusp['idhieusp']?>" title="<?php echo $rows_hieusp['tenhieusp'] ?>" class="ws-nw overflow ellipsis"><?php echo $rows_hieusp['tenhieusp'] ?>
                </a>
            </li>
        <?php 
            } 
        }
        ?>
        </ul>
    </div>
    <div class="product-container">
    <?php 
        $sql_product = mysqli_query($conn,"select * from hanghoa where hanghoa.manhom='$id_nhom' order by mshh asc limit 10");
        if($sql_product){
            while($rows_sp=mysqli_fetch_array($sql_product)){
    ?>
        <div class="p-box-5">
            <div class="product-lt">
                <div class="lt-product-group-image">
                    <a href="index.php?xem=chitietsp&id=<?php echo $rows_sp['mshh'] ?>" title="">
                        <img class="img-p" src="admincp/modules/quanlyhh/uploads/<?php echo $rows_sp['hinhanh']?>" alt="">
                    </a>
                    <?php 
                        if($rows_sp['sale_off']==0){ 
                    ?>
                    <?php 
                        }else{
                    ?>
                        <div class="giam-percent">
                            <span class="text-giam-percent"><?php echo 'Giảm -'.$rows_sp['sale_off'].'%' ?></span>
                        </div>
                    <?php 
                        }
                    ?>        
                </div>
                <div class="lt-product-group-info">
                    <a href="index.php?xem=chitietsp&id=<?php echo $rows_sp['mshh'] ?>" title="<?php echo $rows_sp['tenhh'] ?>" style="text-align: left;">
                        <h3><?php echo $rows_sp['tenhh'] ?></h3>
                    </a>
                    <div class="price-box">      
                        <?php if($rows_sp['sale_off'] == 0){?> 
                            <p class="special-price"><span class="price"><?php echo number_format($rows_sp['giagoc']).' ₫'?></span></p>
                        <?php }else{ ?>
                            <p class="special-price">
                                <span class="price"><?php echo number_format($rows_sp['giagoc']-$rows_sp['giagoc']*$rows_sp['sale_off']/100).' ₫'?>
                                </span>
                            </p>
                            <p class="old-price"><span class="price"><?php echo number_format($rows_sp['giagoc']).' ₫'?></span></p>
                        <?php }?>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    <?php 
        } 
    } 
    ?>
    </div>
</div>
<?php 
    } 
 }
 ?>

<div class="adv">
    <section id="service" style="margin: 20px;">
        <div class="container">
            <div class="row">
                <div id="service_home" class="clearfix">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center m-b-xs-10">
                        <div class="service_item">
                            <div class="icon icon_product">
                                <img src="admincp/images/icon_142e7.png" alt="">
                                
                            </div>
                            <div class="description_icon">
                                <span class="large-text">
                                    Miễn phí giao hàng
                                </span>
                                <span class="small-text">
                                    Cho hóa đơn từ 100,000,000 đ
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center m-b-xs-10">
                        <div class="service_item">
                            <div class="icon icon_product">
                                <img src="admincp/images/icon_242e7.png" alt="">
                            </div>
                            <div class="description_icon">
                                <span class="large-text">
                                    Giao hàng trong ngày
                                </span>
                                <span class="small-text">
                                    Với tất cả đơn hàng
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center m-b-xs-10">
                        <div class="service_item">
                            <div class="icon icon_product">
                                <img src="admincp/images/icon_342e7.png" alt="">
                            </div>
                            <div class="description_icon">
                                <span class="large-text">
                                    Sản phẩm an toàn
                                </span>
                                <span class="small-text">
                                    Cam kết chính hãng
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Begin-->
    <!--End-->
</div>