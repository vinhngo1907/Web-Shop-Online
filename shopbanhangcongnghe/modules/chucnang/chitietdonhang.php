<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql_detail=mysqli_query($conn,"select * from chitietdathang where chitietdathang.sodondh='$_GET[id]'");
 ?>
<div class="container order-page">
    <div class="general__title">
        <h2>Chi tiết đơn hàng</h2>
    </div>
    <div class="table-responsive">
        <fieldset>
            <table class="table table-bordered tb-detail-or">
                <thead>
                    <tr class="">
                        <th>Sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        if($sql_detail){
                            while($dong_order=mysqli_fetch_array($sql_detail)){
                     ?>
                    <tr>
                        <td><a href="index.php?xem=chitietsp&id=<?php echo $dong_order['mshh'] ?>"><?php echo $dong_order['tenhh'] ?></a></td>
                        <td><?php echo number_format($dong_order['giaban']).' VNĐ' ?></td>
                        <td><?php echo $dong_order['soluong'] ?></td>
                        <td><?php echo number_format($dong_order['giadathang']).' VNĐ' ?></td>
                    </tr>
                    <!-- <tr>
                        <td><a href="apple-iphone-xr-128gb-black-chinh-hang">Apple iPhone XR 128GB Black Chính hãng</a></td>
                        <td>20,000,000 VNĐ</td>
                        <td>1</td>
                        <td>20,000,000 VNĐ</td>
                    </tr> -->
                <?php 
                    }
                }
                 ?>
                </tbody>
            </table>
        </fieldset>
    </div>
    <div class="or-detail-c">
        <div class="col-sm-8">
            <div class="general__title">
                <h3>Thông tin thanh toán</h3>
            </div>
            <?php 
                $sql_client=mysqli_query($conn,"select * from dathang where sodondh='$_GET[id]'");
                if($sql_client)
                    $dong=mysqli_fetch_array($sql_client);
            ?>
            <div class="content-order">
                <p>Mã Đơn hàng: <?php echo $dong['code'] ?></p>
                <p>Khách hàng: <?php echo $dong['hotenkh'] ?></p>
                <p>Số điện thoại: <?php echo $dong['dienthoai'] ?></p>
                <p>Thời gian đặt hàng: <?php echo $dong['ngaydh'] ?></p>
                <p>Địa chỉ giao hàng: <?php echo $dong['diachi'] ?></p>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="general__title">
                <h3>Tổng tiền hóa đơn</h3>
            </div>
            <div class="content-order">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>Tổng tiền đơn hàng</td>
                            <td class="text-right"><span><?php echo number_format($dong['tongtien']).' VNĐ' ?></span></td>
                        </tr>

                        <tr>
                            <td>Phí giao hàng:</td>
                            <td class="text-right">30,000 VNĐ</td>
                        </tr>
                        <!-- <tr>
                            <td>Voucher :</td>
                            <td class="text-right">-100,000 VNĐ</td>
                        </tr> -->
                        <tr>
                            <td>Tổng thanh toán:</td>
                            <td class="text-right"><span style="color: red; font-size: 23px;"><span><?php echo number_format($dong['tongtien']+30000).' VNĐ' ?></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-xs-12">
            <button class="btn">
                <a href="javascript:;" onclick="window.history.go(-1);" class="viewMore pull-left" style="font-size: 15px;"><i class="fa fa-angle-left" aria-hidden="true"></i> Trở về trang trước</a>
            </button>
        </div>
    </div>
</div>
