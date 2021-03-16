<?php
    $sql="select * from slider where idslider='$_GET[id]'";
    $run=mysqli_query($conn,$sql);
    if($run){
        $dong=mysqli_fetch_array($run);
    }
?>
<form action="modules/giaodien/xuly.php?id=<?php echo $dong['idslider'] ?>" method="post" enctype="multipart/form-data">
    <div class="content-wrapper">
        <section class="content-header">
            <h1><i class="glyphicon glyphicon-picture"></i> Cập nhật sliders</h1>
            <div class="breadcrumb">
                <button class="btn btn-primary btn-sm" type="submit" name="sua">
                   <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Cập Nhật]
                </button>
                <a class="btn btn-primary btn-sm" href="index.php?quanly=giaodien&ac=lietke" role="button">
                    <span class="glyphicon glyphicon-remove do_nos"></span> Thoát
                </a>
            </div>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box" id="view">
                        <div class="box-body" >
                            <div class="col-md-9" style="width: 1000px;">
                                <div class="form-group">
                                    <label>Tên sliders<span class="maudo">(*)</span></label>
                                    <input type="text" class="form-control" name="tenslider" value="<?php echo $dong['tenslider']?>"/>
                                    <div class="error" id="password_error"></div>
                                </div>
                            </div>
                            <div class="col-md-3" style="margin-left:15px;">
                                <div class="form-group">
                                    <label>Hình ảnh<span class="maudo">(*)</span></label>
                                    <input type="file" id="image_list"  name="hinh" />
                                    <img src="modules/giaodien/uploads/<?php echo $dong['hinh'] ?>" width="400" height="120"/>
                                    <div class="error" id="password_error"></div>
                                </div>
                                <div class="form-group">
                                    <label>Trang thái<span class="maudo">(*)</span></label>
                                    <select type="text" class="form-control" name="status"> 
                                        <?php
                                            if($dong['status']==1){
                                        ?>
                                                <option selected="selected" value="1">Hoạt động</option>
                                                <option value="2">Chưa hoạt động</option>
                                        <?php
                                            }else{ 
                                        ?>
                                        <option value="1">Hoạt động</option>
                                        <option selected="selected" value="2">Chưa hoạt động</option>
                                        <?php
                                            } 
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <input type="submit" class="form-control" name="sua" value="Cập Nhật"/>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</form>