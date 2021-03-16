<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql=mysqli_query($conn,"select * from hanghoa where sale_off!=0");
?>
<div class="container" style="margin-top: 20px;">
    <div class="sale-title"><span>SẢN PHẨM KHUYẾN MÃI HOT</span></div>
</div>
<div class="container" style="margin-bottom: 20px;">
    <div class="owl-carousel owl-carousel-product owl-theme owl-loaded owl-drag" style="border: 1px solid #0f9ed8;">
        <div class="owl-stage-outer" >
            <div class="owl-stage" style="left: 0px; width: 2297px;">
                <?php 
                if($sql){
                    while($dong=mysqli_fetch_array($sql)){
                ?>
                <div class="owl-item active" style="width: 219.602px; margin-right: 10px;">
                    <div class="item" style="margin: 0px;">
                        <div class="products-sale">
                            <div class="lt-product-group-image">
                                <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh'] ?>" title="<?php echo $dong['tenhh'] ?>">
                                    <img class="img-p" src="admincp/modules/quanlyhh/uploads/<?php echo $dong['hinhanh'] ?>" alt="">
                                </a>
                                <div class="giam-percent">
                                    <span class="text-giam-percent"><?php echo 'Giảm -'.$dong['sale_off'].'%'?></span>
                                </div>
                            </div>
                            <div class="lt-product-group-info">
                                <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh'] ?>" title="<?php echo $dong['tenhh'] ?>" style="text-align: left;">
                                    <h3><?php echo $dong['tenhh'] ?></h3>
                                </a>
                                <div class="price-box">
                                    <p class="old-price"><span class="price"><?php echo number_format($dong['giagoc']).' đ' ?></span></p>
                                    <p class="special-price">
                                        <span class="price">
                                            <?php echo number_format($dong['giagoc']-($dong['giagoc']*$dong['sale_off'])/100).' đ' ?>
                                        </span>
                                    </p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php 
                    }
                } 
                ?>
            </div>
        </div>
    </div>
</div>