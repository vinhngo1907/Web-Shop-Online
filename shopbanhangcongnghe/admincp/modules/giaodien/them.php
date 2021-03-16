<form action="modules/giaodien/xuly.php" method="post" enctype="multipart/form-data">
    <div class="content-wrapper">
        <section class="content-header">
            <h1><i class="glyphicon glyphicon-picture"></i> Thêm mới sliders</h1>
            <div class="breadcrumb">
                <button class="btn btn-primary btn-sm"  name="them">
                    <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Thêm]
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
                                    <input type="text" class="form-control" name="tenslider" placeholder="Tên sliders"/>
                                    <div class="error" id="password_error"></div>
                                </div>
                            </div>
                            <div class="col-md-3" style="margin-left:15px;">
                                <div class="form-group">
                                    <label>Hình ảnh<span class="maudo">(*)</span></label>
                                    <input type="file" id="image_list" required="" name="hinh" />
                                    <div class="error" id="password_error"></div>
                                </div>
                                <div class="form-group">
                                    <label>Trang thái<span class="maudo">(*)</span></label>
                                    <select type="text" class="form-control" name="status"> 
                                        <option value="1">Hoạt động</option>
                                        <option value="2">Chưa hoạt động</option>
                                    </select>
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <input type="submit" class="form-control" name="them" value="Thêm Mới"/>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</form>