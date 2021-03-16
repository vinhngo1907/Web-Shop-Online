<form action="modules/quanlynhomhh/xuly.php" method="POST" enctype="multipart/form-data">
<div class="content-wrapper">
    <section class="content-header">
        <h1><i class="fas fa-location-slash "></i><span class="glyphicon glyphicon-cd"></span>Danh Sách Nhóm Hàng Hóa</h1>
        <div class="breadcrumb">
        	<button class="btn btn-primary btn-sm" name="them" type="submit">
        		<span class="glyphicon glyphicon-plus"></span> Lưu[Thêm]
        	</button>
            <a class="btn btn-primary btn-sm" rol="button" href="index.php?quanly=quanlynhomhh&ac=lietke">
                <span class="glyphicon glyphicon-remove"></span>Thoát
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
								<div class="col-md-9">
									<div class="form-group">
										<label for="formGroupExampleInput">Tên nhóm hàng hóa</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="tennhom" id="formGroupExampleInput">
                                    </div>
									<div class="form-group">
										<label for="formGroupExampleInput">Loại hàng hóa</label><span class="maudo">(*)</span>
                                        <select class="form-control" name="status" id="formGroupExampleInput">
                                        	<option>[--Chọn trạng thái--]</option>
                                            <option value="1">Đang kinh doanh</option>   
                                            <option value="2">Không kinh doanh</option>   
										</select>
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