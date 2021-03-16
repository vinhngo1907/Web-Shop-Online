<?php 
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql=mysqli_query($conn,"select * from tintuc where mstt = '$_GET[id]'");
	if($sql)
		$dong = mysqli_fetch_array($sql);
?>
<form action="modules/tintuc/xuly.php?id=<?php echo $dong['mstt'] ?>" method="post" enctype="multipart/form-data">
	<div class="content-wrapper" style="min-height: 636px;">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-text-background"></i> Thêm bài viết mới</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm" name="sua">
					<span class="glyphicon glyphicon-floppy-save"></span>Lưu[Cập Nhật]
				</button>
				<a class="btn btn-primary btn-sm" href="index.php?quanly=tintuc&ac=lietke" role="button">
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
							<div class="col-md-9" style="width: 1000px;">
								<div class="form-group">
									<label>Tiêu đề bài viết <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="title" style="width:100%" placeholder="Tiêu đề bài viết" value="<?php echo $dong['title']?>">
									<div class="error" id="password_error"></div>
								</div>
								
								<div class="form-group">
									<label>Mô tả ngắn</label>
									<textarea name="introtext" class="form-control"><?php echo $dong['introtext'] ?></textarea>
								</div>
								<div class="form-group">
									<label>Chi tiết mô tả</label>
									<textarea name="fullcontent" id="detail" class="form-control"><?php echo $dong['fullcontent'] ?></textarea>
								</div>
							</div>
							
							<div class="col-md-3" style="margin-left:30px;">
								<div class="form-group">
                                    <label>Hình đại diện</label>
                                    <input type="file" id="image_list" name="img" style="width: 100%">
                                    <img src="modules/tintuc/uploads/<?php echo $dong['img'] ?>" width="180" height="100" />
                                </div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="status" class="form-control">
										<?php
											if($dong['status']==1){
										 ?>
										<option value="1" selected="selected">Đăng</option>
										<option value="0">Chưa đăng</option>
										<?php 
											}else{
										?>
										<option value="1">Đăng</option>
										<option value="0" selected="selected">Chưa đăng</option>
										<?php
											}
										 ?>
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