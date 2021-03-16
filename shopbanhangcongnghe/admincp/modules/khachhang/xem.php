<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql=mysqli_query($conn,"select * from khachhang where mskh = '$_GET[id]'");
    if($sql)
        $dong = mysqli_fetch_array($sql);
?>
<form action="modules/khachhang/xuly.php?id=<?php echo $dong['mskh'] ?>" method="POST" enctype="multipart/form-data">
    <div class="content-wrapper" style="min-height: 891px;">
    
        <section class="content-header">
            <h1><i class="fa fa-user-plus"></i> Cập nhật khách hàng</h1>
            <div class="breadcrumb">
                <a class="btn btn-primary btn-sm" href="index.php?quanly=khachhang&ac=lietke" role="button">
                    <span class="glyphicon glyphicon-remove"></span> Thoát
                </a>
            </div>
        </section>    
        <section class="content">
          <!-- Info boxes -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-body">
                            <!--ND-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Họ và tên <span class="maudo">(*)</span></label>
                                    <input type="text" name="hotenkh" class="form-control" value="<?php echo $dong['hotenkh'] ?>">
                                </div>
                                <div class="form-group">
                                    <label>Điện thoại <span class="maudo">(*)</span></label>
                                    <input type="text" name="dienthoai" class="form-control" value="<?php echo $dong['dienthoai'] ?>">
                                </div>
                                <div class="form-group">
                                    <label>Email <span class="maudo">(*)</span></label>
                                    <input type="email" name="email" class="form-control" value="<?php echo $dong['email'] ?>">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <select name="status" class="form-control" style="width:300px">
                                        <?php 
                                            if($dong['status'] == 1)
                                        ?>
                                        <option value="1" selected="">Đang hoạt động</option>
                                        <option value="0">Ngừng hoạt động</option>
                                    </select>
                                </div>
                            </div>
                            <!--/.ND-->
                        </div>
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section><!-- /.content -->
            
</div>
</form>