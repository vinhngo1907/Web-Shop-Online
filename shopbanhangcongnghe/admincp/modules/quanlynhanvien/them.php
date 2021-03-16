<form action="modules/quanlynhanvien/xuly.php" method="POST" enctype="multipart/form-data">
<div class="content-wrapper" style="min-height: 636px;">
    <section class="content-header">
        <h1><i class="fa fa-user-plus"></i> Thêm thành viên</h1>
        <div class="breadcrumb">
            <button type="submit" class="btn btn-primary btn-sm" name="them" rol="button">
                <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Thêm]
            </button>
            <a class="btn btn-primary btn-sm" href="index.php?quanly=quanlynhanvien&ac=lietke" role="button">
                <span class="glyphicon glyphicon-remove do_nos"></span> Thoát
            </a>
        </div>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box" id="view">
                    <div class="box-body">
                        <div class="col-md-6" style="margin-right: 20px;">
                            <div class="form-group">
                                <label>Họ và tên <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="hotennv">
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Email <span class="maudo">(*)</span></label>
                                <input type="email" class="form-control" name="email">
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Tên đăng nhập <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="username">
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu <span class="maudo">(*)</span></label>
                                <input type="password" class="form-control" name="password">
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="phone">
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="diachi">
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Quyền<span class="maudo">(*)</span></label>
                                <?php 
                                    $sql_role=mysqli_query($conn,"select * from user_group");
                                 ?>
                                <select name="chucvu" class="form-control"><option value="">[--Chọn danh mục--]</option>
                                    <?php 
                                        if($sql_role){
                                        while($dong_role = mysqli_fetch_array($sql_role)){
                                    ?> 
                                    
                                         
                                    <option value="<?php echo $dong_role['id_usergroup']?>">
                                        <?php echo $dong_role['name']; ?>        
                                    </option>     
                                    <?php }} ?>                     
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Ảnh đại diện</label>
                                <input type="file" id="image_list" name="img">
                            </div>
                            <div class="form-group">
                                <label>Trạng thái</label>
                                <select name="status" class="form-control">
                                    <option value="">[--Chọn danh mục--]</option>
                                    <option value="1">Kích hoạt</option>
                                    <option value="2">Chưa kích hoạt</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Giới tính</label>
                                <select name="gender" class="form-control">
                                    <option value="">[--Chọn danh mục--]</option>
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                </div><!-- /.box -->
            </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>

<!-- /.content -->
</div>
</form>