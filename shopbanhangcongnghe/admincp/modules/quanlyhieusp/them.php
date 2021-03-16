<form action="modules/quanlyhieusp/xuly.php" method="post" enctype="multipart/form-data">
<div class="content-wrapper">
	<section class="content-header">
        <h1><i class="glyphicon glyphicon-text-background"></i> Thêm Nhà Cung Cấp</h1>
            <div class="breadcrumb">
                <button class="btn btn-primary btn-sm" name="them" type="submit">
                    <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Thêm]
                </button>
                <a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhieusp&ac=lietke" role="button">
                    <span class="glyphicon glyphicon-remove"></span> Thoát
                </a>
            </div>
    </section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<div class="box-header with-border">
						<div class="box-body">
							<div class="row" style="padding-left:0px;margin-left:0px;">
								<div class="col-md-9" style="width:1010px;">
									<div class="form-group">
										<label for="formGroupExampleInput">Tên nhà sản xuất</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="tenhieusp" id="formGroupExampleInput">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Tên nhà sản xuất</label><span class="maudo">(*)</span>
										<select class="form-control" name="tinhtrang" id="formGroupExampleInput">
											<option value="1">Xuất bản</option>
											<option value="2">Chưa xuất bản</option>
										</select>
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Từ khóa <span class="maudo">(*)</span></label>
										<input type="text" class="form-control" name="keyword" id="formGroupExampleInput" placeholder="từ khóa">
										<span style="font-style: italic; line-height: 32px;">Chú ý: Mỗi từ khóa phân cách bởi một dấu ",". Ví dụ: dienthoai, maytinhbang</span>
										<div class="error" id="password_error" style="color: red"></div>
									</div>
								</div>
								<div class="col-md-3" style="margin-left:10px;">
									<div class="form-group">
										<label>Logo đại diện</label><span class="maudo">(*)</span>
										<input type="file" id="image_list" name="logo" required="" style="width: 100%">
                                	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</form>