<?php
    @session_start(); 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
?>

<div class="row content-cart">
    <div class="container">
        <form action="" method="post" id="cartformpage" enctype="multipart/form-data">
        <?php
        if(isset($_SESSION['product'])){
        ?>
            <div class="cart-index">
                <h2>Chi tiết giỏ hàng</h2>
                <div class="tbody text-center">
                    <div class="col-xs-12 col-12 col-sm-12 col-md-8 col-lg-8">
                        <table class="table table-list-product">
                            <thead>
                                <tr style="background: #f3f3f3;">
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th class="text-center">Đơn giá</th>
                                    <th class="text-center">Số lượng</th>
                                    <th class="text-center">Thành tiền</th>
                                    <th class="text-center">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php 
                                $thanhtien = 0; $tongtien = 0;
                                foreach($_SESSION['product'] as $cart_item){
                                    $id=$cart_item['id'];
                                    $sql=mysqli_query($conn,"select * from hanghoa where mshh='$id'");
                                    // if($sql){
                                    $dong=mysqli_fetch_array($sql);
                                    if($dong['sale_off'] != 0){
                                        $dong['giaban'] = $dong['giagoc']- ($dong['giagoc']*$dong['sale_off'])/100;
                                    }else {$dong['giaban'] = $dong['giagoc'];}
                            ?>
                                <tr>
                                    <td class="img-product-cart">
                                        <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh'] ?>">
                                            <img src="admincp/modules/quanlyhh/uploads/<?php echo $dong['hinhanh'] ?>" alt="<?php echo $dong['tenhh'] ?>" width="20" height="80"/>
                                        </a>
                                    </td>
                                    <td style="text-align: left;">
                                        <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh'] ?>" class="pull-left"><?php echo $dong['tenhh']; ?></a>
                                    </td>
                                    <td>
                                        <span class="amount"> 
                                            <?php echo number_format($dong['giaban']).' VNĐ'?>
                                        </span>
                                    </td>
                                    <td >
                                        <div class="quantity clearfix">
                                            <a href="update_cart.php?cong=<?php echo $cart_item['id'] ?>">
                                                <!-- <img src="style/images/plus.png" width="20" height="20"/> -->
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </a>
                                            <?php echo $cart_item['soluong']?>
                                            <a href="update_cart.php?tru=<?php echo $cart_item['id'] ?>">
                                                <!-- <img src="style/images/subtract.png" width="20" height="20"/> -->
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </a>
                                        </div>
                                    </td>
                                    
                                    <td>
                                        <span class="amount"> 
                                        <?php
                                            $thanhtien = $cart_item['soluong']*$cart_item['gia'];
                                            $tongtien = $tongtien + $thanhtien;
                                            echo number_format($thanhtien).' VNĐ'; 
                                         ?>
                                         </span>
                                    </td>
                                    <td>
                                        <a class="remove" title="Xóa" onclick="onRemoveProduct(<?php echo $cart_item['id'] ?>)">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                            <?php
                                }
                            ?>
                            </tbody>
                        </table>
                        <button class="btn" onclick="comeBack()" type="button">
                            <a href="#">Tiếp tục mua hàng</a>
                        </button>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <div class="clearfix btn-submit" style="padding-left: 10px; margin-top: 20px;">
                            <table class="table total-price" style="border: 1px solid #ececec;">
                                <tbody>
                                    <tr style="background: #f4f4f4;">
                                        <td>Tổng tiền</td>
                                        <td><strong><?php echo number_format($tongtien).' VNĐ' ?></strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><h5>Mua hàng trực tiếp tại cửa hàng giảm giá 5%</h5></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><h5>Nếu đặt online Bạn hãy đồng ý với điều khoản sử dụng &amp; hướng dẫn hoàn trả.</h5></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <button type="button" onclick="orderProduct()" class="btn-next-checkout">Đặt hàng</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <?php 
            }else{
        ?>
            <div class="cart-info">
                Chưa có sản phẩm nào trong giỏ hàng !
                <br>    
                <button class="btn" onclick="comeBack()" type="button"> Tiếp tục mua hàng</button>
            </div>
         <?php 
            }
         ?>       
        </form>
    </div>
</div>
<script type="text/javascript">
    function onRemoveProduct(id) {
        window.location.href="update_cart.php?xoa="+id;
        // update_cart.php?xoa='.$cart_item['id'].'
    }
    function comeBack(){
        window.location.href="http://localhost/shopbanhangcongnghe/index.php?xem=sanpham";
    }
    function orderProduct(){
        window.location.href="index.php?xem=dathang";
    }
</script>