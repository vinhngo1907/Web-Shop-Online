<form action="modules/nhacungcap/xuly.php" method="POST" enctype="multipart/form-data">
    <div class="content-wrapper" style="min-height: 636px;">
    <section class="content-header">
        <h1><i class="glyphicon glyphicon-text-background"></i> Thêm nhà cung cấp</h1>
        <div class="breadcrumb">
            <button type="submit" class="btn btn-primary btn-sm" name="them">
                <span class="glyphicon glyphicon-floppy-save" ></span>
                Lưu[Thêm]
            </button>
            <a class="btn btn-primary btn-sm" href="index.php?quanly=nhacungcap&ac=lietke" role="button"> <span class="glyphicon glyphicon-remove do_nos"></span> Thoát </a>
        </div>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box" id="view">
                    <div class="box-body">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label>Tên nhà cung cấp <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="tennhacc" placeholder="Tên nhà cung cấp" />
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Mã code <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="code" placeholder="Mã code" />
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Từ khóa <span class="maudo">(*)</span></label>
                                <input type="text" class="form-control" name="keyword" placeholder="Từ khóa" />
                                <span style="font-style: italic; line-height: 32px;">Chú ý: Mỗi từ khóa phân cách bởi một dấu ",". Ví dụ: dienthoai, maytinhbang</span>
                                <div class="error" id="password_error" style="color: red;"></div>
                            </div>
                            <div class="form-group">
                                <label>Trạng thái</label>
                                <select name="status" class="form-control">
                                    <option value="1">Xuất bản</option>
                                    <option value="0">Chưa xuất bản</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
</div>
</form>