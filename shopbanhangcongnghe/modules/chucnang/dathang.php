<?php
    @session_start();
    include('admincp/modules/config.php');
    require"function.php";
    $conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);  
    $sql_nhanvien=mysqli_query($conn,"select * from nhanvien where username='$_SESSION[dangnhap]' limit 1");    
    if(isset($_POST['payment'])){
        if(isset($_SESSION['login']) && isset($_SESSION['dangnhap'])){
            // $sql_nhanvien=mysqli_query($conn,"select * from nhanvien where username='$_SESSION[dangnhap]' limit 1");
            $nhanvien=mysqli_fetch_array($sql_nhanvien);
            $sql_user=mysqli_query($conn,"select * from khachhang where username='$_SESSION[login]' limit 1");
            if($sql_user){
                $row = mysqli_fetch_array($sql_user);
                $hotenkh=$row['hotenkh'];
                $mskh = $row['mskh'];  
                $msnv=$nhanvien['msnv'];
                $province=$_POST['province'];
                $district=$_POST['district'];
                $diachi=$row['diachi'];
                $dienthoai=$row['dienthoai'];
                $total=$_POST['tongtien'];  
                // $price_ship=$_POST['price_ship']; 
                $code = generateRandomString();
                get_payment($hotenkh,$mskh,$msnv,$total,$province,$district,$diachi,$dienthoai,$code);      
            }  
        }elseif(isset($_SESSION['login']) && !isset($_SESSION['dangnhap'])){
            echo'<script>alert("Xin lỗi. Hiện tại hệ thống chưa có nhân viên xử lý đơn đặt hàng !")</script>';
        }elseif(!isset($_SESSION['login']) && isset($_SESSION['dangnhap'])){
            $hotenkh=$_POST['hotenkh']; 
            $nhanvien=mysqli_fetch_array($sql_nhanvien);
            $msnv=$nhanvien['msnv'];
            $province=$_POST['province'];
            $district=$_POST['district'];
            $diachi=$_POST['diachi'];
            $dienthoai=$_POST['dienthoai'];
            $email=$_POST['email'];
            $total=$_POST['tongtien'];
            $code = generateRandomString();
            $insert_customer=mysqli_query($conn,"insert into khachhang(hotenkh,email,diachi,dienthoai) values('$hotenkh','$email','$diachi','$dienthoai')");
            if($insert_customer){
                $sql_customer=mysqli_query($conn,"select * from khachhang order by mskh desc limit 1");
                if($sql_customer)
                    $choose = mysqli_fetch_array($sql_customer);
                    $mskh=$choose['mskh'];
                get_payment($hotenkh,$mskh,$msnv,$total,$province,$district,$diachi,$dienthoai,$code);  
            }
        }elseif(!isset($_SESSION['dangnhap'])){
            echo'<script>alert("Xin lỗi. Hiện tại hệ thống chưa có nhân viên xử lý đơn đặt hàng !")</script>';
        } 
    }
 ?>
 <script type="text/javascript">
     ThanhToan(){
        window.location.href="index.php?xem=thanhtoan";
     }
     
 </script>
<form action="" method="POST" enctype="multipart/form-data">
    <section id="checkout-cart">
        <div class="container">
            <div class="col-md-12">
                <div class="wrapper overflow-hidden">
                    <div style="font-size: 16px; padding-top: 10px; color: #ccc;">
                        Bạn có tài khoản?
                        <a href="index.php?xem=login" >Ấn vào đây để đăng nhập</a>
                    </div>
                    <div class="checkout-content">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-login-checkout" style="margin-bottom: 20px">
                            <p class="text-center">Địa chỉ giao hàng của quý khách</p>
                            <div class="wrap-info" style="width: 100%; min-height: 1px; overflow: hidden; padding: 10px;">
                                <table class="table tinfo" >
                                    <tbody>
                                        <?php 
                                        if(isset($_SESSION['login'])){
                                            $sql=mysqli_query($conn,"select * from khachhang where username='$_SESSION[login]'");

                                            $nums = mysqli_num_rows($sql);
                                            if($nums > 0) 
                                                $dong=mysqli_fetch_array($sql);
                                        ?>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Khách hàng: <span class="require_symbol">* </span></td>
                                            <td>
                                                <input type="text" class="form-control" disabled="" placeholder="Họ và tên" name="hotenkh" value="<?php echo $dong['hotenkh'] ?>">
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Email: <span class="require_symbol">* </span></td>
                                            <td>
                                                <input type="text" class="form-control" name="email" readonly  value="<?php echo $dong['email'] ?>" placeholder="Email">
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Số điện thoại: <span class="require_symbol">* </span></td>
                                            <td>
                                                <input type="text" class="form-control" placeholder="Số điện thoại" name="dienthoai" readonly value="<?php echo $dong['dienthoai'] ?>">
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <?php
                                            }else{
                                        ?>
                                            <tr>
                                            <td class="width30 text-right td-right-order">Khách hàng: <span class="require_symbol">* </span></td>
                                            <td>
                                                <input type="text" class="form-control" placeholder="Họ và tên" name="hotenkh" value="">
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Email: <span class="require_symbol">* </span></td>
                                            <td>
                                                <input type="text" class="form-control" name="email" value="" placeholder="Email">
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Số điện thoại: <span class="require_symbol">* </span></td>
                                            <td>
                                                <input type="text" class="form-control" placeholder="Số điện thoại" name="dienthoai" value="">
                                                <div class="error"></div>
                                            </td>
                                        </tr>    
                                        <?php } ?>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Tỉnh/Thành phố: <span class="require_symbol">* </span>
                                            </td>
                                            <td>

                                                <select name="province" id="province"  class="form-control next-select">
                                                    <option value="">--- Chọn tỉnh thành ---</option>
                                                    <?php
                                                    $sql_province = mysqli_query($conn,"select * from db_district order by id asc");
                                                    if($sql_province){
                                                        while($dong_province = mysqli_fetch_array($sql_province)){
                                                    ?>
                                                    <option value="<?php echo $dong_province['id'] ?>"><?php echo $dong_province['name'] ?></option>
                                                    <?php 
                                                        }   
                                                    }
                                                    ?>
                                                    
                                                </select>
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Quận/Huyện: <span class="require_symbol">* </span></td>
                                            <td>
                                            <select name="district" id="district" class="form-control next-select"><option value="">--- Chọn quận huyện ---</option>
                                            <?php 
                                                $sql_district = mysqli_query($conn,"select * from db_district");
                                                if($sql_district){
                                                    while($dong_district = mysqli_fetch_array($sql_district)){
                                                    
                                            ?>
                                                <option value="<?php echo $dong_district['id'] ?>"><?php echo $dong_district['name'] ?></option>
                                                
                                            <?php } } ?>
                                            </select>
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <?php 
                                            if(isset($_SESSION['login'])){
                                            echo '<tr>
                                                <td class="width30 text-right td-right-order">Địa chỉ giao hàng: <span class="require_symbol">* </span></td>
                                                <td>
                                                    <textarea name="diachi" placeholder="Địa chỉ giao hàng:" class="form-control" rows="4"=""="" style="height: auto !important;" value="">'.$dong['diachi'].'</textarea>
                                                    <div class="error"></div>
                                                </td>
                                        </tr>';
                                            }else{
                                        ?>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Địa chỉ giao hàng: <span class="require_symbol">* </span></td>
                                            <td>
                                                <textarea name="diachi" placeholder="Địa chỉ giao hàng:" class="form-control" rows="4"=""="" style="height: auto !important;" value=""></textarea>
                                                <div class="error"></div>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td class="width30 text-right td-right-order">Mã giảm giá (nếu có):</td>
                                            <td>
                                                <input id="coupon" style="border-radius: 5px; border-color: #0f9ed8;" type="text" class="form-control" placeholder="Mã giảm giá" name="coupon">
                                                <div class="error" id="result_coupon"></div>
                                            </td>
                                            <td colspan="1">
                                                <a class="check-coupon" title="mã giảm giá" onclick="checkCoupon()">Sử dụng</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: none;"></td>
                                            <td style="border: none;">
                                                <div class="btn-checkout frame-100-1 overflow-hidden border-pri" style="float: right;">
                                                    <button type="submit" onclick="ThanhToan()" style="width: 300px" class="bg-pri border-pri col-fff" name="payment">Đặt hàng</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 products-detail">
                        <div class="no-margin-table col-login-checkout" style="width: 100%;">
                            <p>Thông tin đơn hàng</p>
                            <table class="table" style="color: #333">
                                <tbody>
                                    <tr class="text-transform font-weight-600">
                                        <td style="width: 190px;"><h4>Sản phẩm</h4></td>
                                        <td class="text-center"><h4>Số lượng</h4></td>
                                        <td class="text-center"><h4>Giá</h4></td>
                                        <td class="text-center"><h4>Tổng tiền</h4></td>
                                    </tr>
                                    <?php 
                                    $thanhtien = 0; $tongtien = 0;
                                    if(isset($_SESSION['product'])){
                                        $sql_config=mysqli_query($conn,"select * from cauhinh");
                                        // if($sql_config)    
                                        $config=mysqli_fetch_array($sql_config);
                                        $ship = $config['priceShip'];  
                                        
                                        foreach($_SESSION['product'] as $cart_item){
                                            $id=$cart_item['id'];
                                            $sql=mysqli_query($conn,"select * from hanghoa where mshh='$id'");
                                            $dong=mysqli_fetch_array($sql);
                                            if($dong['sale_off'] != 0){
                                                $dong['giaban'] = $dong['giagoc']- ($dong['giagoc']*$dong['sale_off'])/100;
                                            }else {$dong['giaban'] = $dong['giagoc'];}
                                    ?>   
                                        <tr>
                                            <td><?php echo $dong['tenhh'] ?></td>
                                            <td class="text-center"><?php echo $cart_item['soluong'] ?></td>
                                            <input type="hidden" min="1" name="soluong" value="<?php echo $cart_item['soluong'] ?>">
                                            <td><?php echo number_format($dong['giaban']).' ₫' ?> </td>
                                            <td style="float: right;" class="text-center">
                                            <?php
                                                $thanhtien = $cart_item['gia']*$cart_item['soluong'];
                                                $tongtien = $tongtien + $thanhtien;
                                                echo number_format($thanhtien).'₫' ;
                                            ?>
                                            </td>
                                        </tr>
                                    <?php 
                                        } 
                                    }
                                    ?>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Tổng cộng :</td>
                                        <td style="float: right;"><?php echo number_format($tongtien).' VNĐ'; ?></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <p style="font-size: 12px;">(Phí giao hàng)</p>
                                        </td>
                                        <td style="float: right;"><?php echo number_format($ship).' VNĐ'; ?> </td>
                                    </tr>

                                    <tr style="background: #f4f4f4">
                                        <td colspan="3">
                                            <p style="font-size: 15px; color: red;">Thành tiền</p>
                                            <span style="font-weight: 100; font-style: italic;">(Tổng số tiền thanh toán)</span>
                                        </td>
                                        <td class="text-center">
                                            <p style="font-size: 15px; color: red;"> 
                                                <?php echo number_format($tongtien+$ship).' VNĐ';?>
                                                <input type="hidden" name="tongtien" value="<?php echo $tongtien ?>">
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>