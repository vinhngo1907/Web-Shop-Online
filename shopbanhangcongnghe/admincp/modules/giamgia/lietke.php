<div class="content-wrapper" style="min-height: 891px;">
    <section class="content-header">
        <h1><i class="glyphicon glyphicon-text-background"></i> Danh sách mã giảm giá</h1>
        <div class="breadcrumb">
            <a class="btn btn-primary btn-sm" href="index.php?quanly=giamgia&ac=them" role="button"> <span class="glyphicon glyphicon-plus"></span> Thêm mới </a>
            <a class="btn btn-primary btn-sm" href="http://localhost/DO-AN-TN-2019/admin/coupon/recyclebin" role="button"> <span class="glyphicon glyphicon-trash"></span> Thùng rác(1) </a>
        </div>
    </section>
    <!-- Main coupon -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box" id="view">
                    <div class="box-header with-border">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row" style="padding: 0px; margin: 0px;">
                                <!--ND-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th class="text-center">Mã giảm giá</th>
                                                <th class="text-center">Số tiền giảm</th>
                                                <th class="text-center" "="">Số tiền đơn hàng áp dụng tối thiểu</th>
    											<th class="text-center" "="">Số lần giới hạn nhập</th>
    											<th class="text-center" "="">Hạn nhập</th>
    											<th class="text-center" "="">Trạng thái</th>
                                                <th class="text-center" colspan="2">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                            $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
                                            $sql=mysqli_query($conn,"select * from khuyenmai order by id asc");
                                            if($sql){
                                                while($dong=mysqli_fetch_array($sql)){
                                            ?>
                                            <tr>
                                                <td class="text-center"><?php echo $dong['id'] ?></td>
                                                <td><?php echo $dong['code'] ?></td>
                                                <td><?php echo $dong['discount'] ?></td>
                                                <td><?php echo $dong['payment_limit'].'đ' ?></td>
                                                <td><?php echo $dong['limit_number'] ?></td>
                                                <td><?php echo $dong['expiration_date'] ?></td>
                                                <td class="text-center">
                                                <?php 
                                                    if($dong['status']==1){
                                                        echo '<a href="http://localhost/DO-AN-TN-2019/admin/coupon/status/13">
                                                        <span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
                                                    </a>';
                                                    }else{
                                                        echo'<a href="http://localhost/DO-AN-TN-2019/admin/coupon/status/13">
                                                        <span class="glyphicon glyphicon-remove-circle maudo"></span>
                                                    </a>';
                                                    }
                                                ?>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-success btn-xs" href="index.php?quanly=giamgia&ac=sua&id=<?php echo $dong['id'] ?>" role="button"> <span class="glyphicon glyphicon-edit"></span>Sửa </a>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-danger btn-xs" href="modules/giamgia/xuly.php?id=<?php echo $dong['id'] ?>" onclick="return confirm('Xác nhận Xóa Mã giảm giá này ?')" role="button">
                                                        <span class="glyphicon glyphicon-trash"></span>Xóa
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php
                                                    }
                                                }
                                            ?>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <ul class="pagination"></ul>
                                    </div>
                                </div>
                                <!-- /.ND -->
                            </div>
                        </div>
                        <!-- ./box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
    </section>
    <!-- /.coupon -->
</div>