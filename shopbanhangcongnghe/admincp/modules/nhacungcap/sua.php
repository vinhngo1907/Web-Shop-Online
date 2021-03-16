<?php 
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql=mysqli_query($conn,"select * from nhacungcap where idnhacc = '$_GET[id]'");
	if($sql)
		$dong=mysqli_fetch_array($sql);
?>
<form action="modules/nhacungcap/xuly.php?id=<?php echo $dong['idnhacc']?>" method="POST" enctype="multipart/form-data">
	<div class="content-wrapper" style="min-height: 891px;">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-text-background"></i> Cập nhật nhà cung cấp</h1>
		<div class="breadcrumb">
			<button type="submit" class="btn btn-primary btn-sm" name="sua">
				<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Cập nhật]
			</button>
			<a class="btn btn-primary btn-sm" href="index.php?quanly=nhacungcap&ac=lietke" role="button">
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
							<div class="col-md-9">
								<div class="box-body">
									<div class="col-md-9">
										<div class="form-group">
											<label>Tên nhà cung cấp</label>
											<input type="text" class="form-control" name="tennhacc" placeholder="Tên nhà cung cấp" value="<?php echo $dong['tennhacc'] ?>">
											<div class="error" id="password_error" style="color: red"></div>
										</div>
										<div class="form-group">
											<label>Mã code <span class="maudo">(*)</span></label>
											<input type="text" class="form-control" name="code" placeholder="Mã code" disabled="" value="<?php echo $dong['code'] ?>">
											<div class="error" id="password_error" style="color: red"></div>
										</div>
										<div class="form-group">
											<label>Từ khóa <span class="maudo">(*)</span></label>
											<input type="text" class="form-control" name="keyword" placeholder="Từ khóa" value="<?php echo $dong['keyword'] ?>">
											<span style="font-style: italic; line-height: 32px;">Chú ý: Mỗi từ khóa phân cách bởi một dấu ",". Ví dụ: dienthoai, laptop</span>
											<div class="error" id="password_error" style="color: red"></div>
										</div>
										<div class="form-group">
											<label>Trạng thái</label>
											<select name="status" class="form-control">
												<?php 
													if($dong['status'] == 1){	
												?>	<option value="1" selected="">Đang hoạt động</option>
													<option value="0">Ngừng hoạt động</option>
												<?php	
													}else{	
												?>
													<option value="1" >Đang hoạt động</option>
													<option value="0" selected="">Ngừng hoạt động</option>
												<?php	}
												?>
											</select>
										</div>
									</div>
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