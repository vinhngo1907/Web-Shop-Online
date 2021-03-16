<?php 
    @session_start();
    include('admincp/modules/config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    if(isset($_SESSION['login'])){
        $sql=mysqli_query($conn,"select * from khachhang where username='$_SESSION[login]'");
        if($sql)
            $dong=mysqli_fetch_array($sql);
?>
<section id="checkout-cart">
    <div class="container">
        <div class="col-md-12">
            <div class="wrapper overflow-hidden">
                <div class="checkout-content">
                    <div class="tks-header">
                        <h3 class="fa fa-check-circle">Thông tin đơn hàng đã được gửi đến <?php echo $dong['email'] ?>. Qúy khách hãy đăng nhập gmail để kiểm tra thông tin đơn hàng.</h3>
                    </div>
                    <div class="tks-content" style="min-height: 1px; overflow: hidden;">
                        <div class="col-xs-12 col-sm-12 col-md-7 col-login-checkout" style="margin-bottom: 20px;">
                            <table class="table tks-tabele-info-cus">
                                <thead>
                                    <tr>
                                        <th colspan="2">Thông tin thanh toán nhận hàng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Khách hàng :</td>
                                        <td><?php echo $dong['hotenkh'] ?></td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại :</td>
                                        <td><?php echo $dong['dienthoai'] ?></td>
                                    </tr>
                                    <tr>
                                        <td>Địa chỉ thanh toán :</td>
                                        <td><?php echo $dong['diachi'] ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
<?php 
    }else{
        $query=mysqli_query($conn,"select * from khachhang order by mskh desc");
        if($query)
            $row=mysqli_fetch_array($query);
?>   
<section id="checkout-cart">
    <div class="container">
        <div class="col-md-12">
            <div class="wrapper overflow-hidden">
                <div class="checkout-content">
                    <div class="tks-header">
                        <h3 class="fa fa-check-circle">Thông tin đơn hàng đã được gửi đến <?php echo $row['email'] ?>. Qúy khách hãy đăng nhập gmail để kiểm tra thông tin đơn hàng.</h3>
                    </div>
                    <div class="tks-content" style="min-height: 1px; overflow: hidden;">
                        <div class="col-xs-12 col-sm-12 col-md-7 col-login-checkout" style="margin-bottom: 20px;">
                            <table class="table tks-tabele-info-cus">
                                <thead>
                                    <tr>
                                        <th colspan="2">Thông tin thanh toán nhận hàng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Khách hàng :</td>
                                        <td><?php echo $row['hotenkh'] ?></td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại :</td>
                                        <td><?php echo $row['dienthoai'] ?></td>
                                    </tr>
                                    <tr>
                                        <td>Địa chỉ thanh toán :</td>
                                        <td><?php echo $row['diachi'] ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
<?php 
    }
?>                
                        <div class="col-xs-12 col-sm-12 col-md-5 products-detail">
                            <div class="no-margin-table" style="width: 95%; float: right;">
                                <table class="table" style="color: #333;">
                                    <thead>
                                        <tr>
                                            <th colspan="3" style="font-weight: 600;">Thông tin đơn hàng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr style="background: #fafafa; color: #333;" class="text-transform font-weight-600">
                                            <td>Sản phẩm</td>
                                            <td class="text-center">Số lượng</td>
                                            <td class="text-center">Giá</td>
                                            <td class="text-center">Tổng</td>
                                        </tr>
                                        <?php 
                                            $total = 0;
                                            $sql_order=mysqli_query($conn,"select * from dathang order by sodondh desc");
                                            // $id_dathang = $_GET['sodondh'];
                                            if($sql_order)
                                                $dong_order=mysqli_fetch_array($sql_order);
                                                $id = $dong_order['sodondh'];
                                            $sql_orderdetail=mysqli_query($conn,"select * from chitietdathang where sodondh = '$id'");
                                            if($sql_orderdetail){
                                                while($dong_orderdetail=mysqli_fetch_array($sql_orderdetail)){
                                        ?>
                                        <tr>
                                            <td><?php echo $dong_orderdetail['tenhh'] ?></td>
                                            <td class="text-center"><?php echo $dong_orderdetail['soluong'] ?></td>
                                            <td class="text-center"><?php echo number_format($dong_orderdetail['giaban']) ?></td>
                                            <td><?php echo number_format($dong_orderdetail['giadathang']).'VNĐ' ?></td>
                                        </tr>
                                        <?php 
                                                $total = $total + $dong_orderdetail['giadathang'];
                                            }
                                        }
                                        ?> <tr style="background: #fafafa;">
                                            <td colspan="3">Tổng cộng :</td>
                                            <td class="text-center">
                                                <?php echo number_format($total).'VNĐ' ?>
                                            </td>
                                        </tr>
                                        <tr style="background: #fafafa;">
                                            <td colspan="3">Vận chuyển</td>
                                            <td class="text-center">30,000 VNĐ</td>
                                        </tr>
                                        <tr style="background: #fafafa;">
                                            <td colspan="3" class="font-weight-600">
                                                Thành tiền<br />
                                                <span style="font-style: italic;">(Tổng số tiền thanh toán)</span>
                                            </td>
                                            <td class="text-center" style="font-weight: 600; font-size: 17px; color: red;"><?php echo number_format($total+30000).'VNĐ' ?></td>
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="btn-tks clearfix">
                        <button type="button" onclick="window.location.href='http://localhost/shopbanhangcongnghe/index.php?xem=sanpham'" class="btn-next-checkout pull-left">Tiếp tục mua hàng</button>
                        <button type="button" onclick="window.print()" class="btn-update-order pull-left">In</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
