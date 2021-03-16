<?php
    // session_start();
    include('admincp/modules/config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    if(isset($_SESSION['login'])){
        $sql=mysqli_query($conn,"select * from khachhang where username = '$_SESSION[login]'");
        $dong=mysqli_fetch_array($sql);
    }
    else{
        header('location:index.php?xem=login');
    }
?>
<!-- <script type="text/javascript">
    function DeleteOrder(id) {
        if(confirm("Xác nhận hủy đơn hàng này ?")){
           window.location.href="index.php?xem=taikhoan&ac=destroy&id="+id;
        }
    }
</script> -->
<?php 
    if(isset($_GET['ac']) && $_GET['ac']=='destroy'){
        $id=$_GET['id'];
        $sql_delete=mysqli_query($conn,"UPDATE dathang SET trangthai='Khách hàng đã hủy' WHERE sodondh = '$_GET[id]'");
        if($sql_delete){
            // $hoadon = mysqli_fetch_array($sql_delete);
            // $sodondh = $hoadon['sodondh'];
            $sql_soluong=mysqli_query($conn,"SELECT * FROM chitietdathang WHERE chitietdathang.sodondh = '$id'");
            if($sql_soluong){
                // $row=mysqli_fetch_array($sql_soluong);
                while($row=mysqli_fetch_array($sql_soluong)){
                    $soluong=$row['soluong'];
                    $sodondh=$row['sodondh'];
                    $mshh=$row['mshh'];
                    // echo $soluong.' ',$mshh.' ',$sodondh.'<br>';
                    $sql_update=mysqli_query($conn,"update hanghoa set soluonghang = soluonghang + '$soluong' WHERE mshh='$mshh'");
                } 
            }
        }
        // header('location:index.php?xem=taikhoan');
    }
?>
<!-- <form action="" method="POST" enctype="multipart/form-data"> -->
<section id="content">
	<div class="container account">
        <aside class="col-right sidebar col-md-3 col-xs-12">
            <div class="block block-account">
                <div class="general__title">
                    <h2><span>Thông tin tài khoản</span></h2>
                </div>
                <div class="block-content">
                    <p>Tài khoản: <strong><?php echo $dong['username'] ?></strong></p>
                    <p>Họ và tên: <strong><?php echo $dong['hotenkh'] ?></strong></p>
                    <p>Email: <strong><?php echo $dong['email'] ?></strong></p>
                    <p>Số điện thoại: <strong><?php echo $dong['dienthoai'] ?></strong></p>
                </div>
                <button class="btn"><a href="reset_password">Đổi mật khẩu</a></button>
            </div>
        </aside>
        <div class="col-main col-md-9 col-sm-12">
            <div class="my-account">
            <?php
                $sql_order = mysqli_query($conn,"select * from dathang,khachhang where dathang.mskh = khachhang.mskh and khachhang.username='$_SESSION[login]'");
                if($sql_order)
                    
             ?>
                <div class="general__title">
                    <h2><span>Danh sách đơn hàng chưa duyệt</span></h2>
                </div>
                
                <table style="padding-right: 10px; width: 100%;">
                    <thead style="border: 1px solid silver;">
                        <tr>
                            <th class="text-left" style="width: 85px; padding: 5px 10px;">Đơn hàng</th>
                            <th style="width: 100px; padding: 5px 10px;">Ngày</th>
                            <th style="width: 100px; text-align: center; padding: 5px 10px;">
                                Giá trị đơn hàng
                            </th>
                            <th style="width: 150px; text-align: center;">Trạng thái đơn hàng</th>
                            <th style="text-align: center;" colspan="2">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody style="border: 1px solid silver;">
                    <?php 
                    while($dong_order = mysqli_fetch_array($sql_order)){
                        if($dong_order['trangthai'] ==='Đang chờ duyệt'){
                    ?>
                        <tr style="border-bottom: 1px solid silver;">
                            <td style="padding: 5px 10px;"><?php echo '#'.$dong_order['code'] ?></td>
                            <td style="padding: 5px 10px;"><?php echo $dong_order['ngaydh'] ?></td>
                            <td style="text-align: center; padding: 5px 10px;"><span class="price-2">
                                <?php echo  number_format($dong_order['tongtien']).' VNĐ' ?></span></td>
                            <td style="padding: 5px 10px; text-align: center;">
                                <?php echo $dong_order['trangthai'] ?>
                            </td>
                            <?php
                                if($dong_order['trangthai']=='Khách hàng đã hủy'){
                             ?>
                            <td width="70">
                                <span> <a style="color: #0f9ed8;" href="index.php?xem=chitietdh&id=<?php echo $dong_order['sodondh'] ?>">Xem chi tiết</a>
                                </span>
                            </td>
                            <?php
                                }else{
                             ?>
                             <td width="70">
                                <span> <a style="color: #0f9ed8;" href="index.php?xem=chitietdh&id=<?php echo $dong_order['sodondh'] ?>">Xem chi tiết</a></span>
                            </td>
                             <td width="70">
                                <!-- <a style="color: red;" href="#" onclick="DeleteOrder(<?php echo $dong_order['sodondh'] ?>)">
                                    Hủy đơn hàng
                                </a> -->
                                <a style="color: red;" href="index.php?xem=taikhoan&ac=destroy&id=<?php echo $dong_order['sodondh'] ?>" >
                                    Hủy đơn hàng
                                </a>
                            </td>
                        <?php 
                            }
                        }
                        ?>
                        </tr>
                        <?php 
                            }
                        ?>
                    </tbody>
                </table>
                <div class="general__title">
                    <h2><span>Danh sách đơn hàng</span></h2>
                </div>

                <div class="table-order">
                    <table style="padding-right: 10px; width: 100%;">
                        <thead style="border: 1px solid silver;">
                            <tr>
                                <th class="text-left" style="width: 85px; padding: 5px 10px;">Đơn hàng</th>
                                <th style="width: 100px; padding: 5px 10px;">Ngày</th>
                                <th style="width: 100px; text-align: center; padding: 5px 10px;">
                                    Giá trị đơn hàng
                                </th>
                                <th style="width: 150px; text-align: center;">Trạng thái đơn hàng</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody style="border: 1px solid silver;">
                            <?php
                                // if ($dong_order['trangthai'] !== 'Đang chờ duyệt') {
                                if($sql_order=mysqli_query($conn,"select * from dathang,khachhang where dathang.mskh = khachhang.mskh and khachhang.username='$_SESSION[login]'")){ 
                                while($query_order = mysqli_fetch_array($sql_order)){
                                    if($query_order['trangthai'] !== 'Đang chờ duyệt'){
                            ?>
                            <tr style="border-bottom: 1px solid silver;">
                                <td style="padding: 5px 10px;"><?php echo '#'.$query_order['code'] ?></td>
                                <td style="padding: 5px 10px;"><?php echo $query_order['ngaydh'] ?></td>
                                <td style="text-align: center; padding: 5px 10px;">
                                    <span class="price-2"><?php echo number_format($query_order['tongtien']).' VNĐ' ?></span>
                                </td>
                                <td style="padding: 5px 10px; text-align: center;">
                                    <?php echo $query_order['trangthai'] ?>
                                </td>
                                <td width="70">
                                    <span> <a style="color: #0f9ed8;" href="index.php?xem=chitietdh&id=<?php echo $query_order['sodondh'] ?>">Xem chi tiết</a></span>
                                </td>
                            </tr>
                            <?php 
                                    }
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</section>