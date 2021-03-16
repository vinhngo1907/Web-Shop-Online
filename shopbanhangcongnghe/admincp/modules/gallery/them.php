<?php
	$id=$_GET['id'];
?>
<form action="modules/gallery/xuly.php?id=<?php echo $id ?>" method="post" enctype="multipart/form-data">
	<div class="content-wrapper" style="min-height: 636px;">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-cd"></i> Thêm Gallery Mới</h1>
			<div class="breadcrumb">
				<!-- <button type="submit" class="btn btn-primary btn-sm">
					<a href="index.php?quanly=quanlyhh&ac=lietke">
					<span class="glyphicon glyphicon-floppy-save"></span>Lưu[Thêm]
                </button> -->
                <a class="btn btn-primary btn-sm" href="index.php?quanly=gallery&ac=lietke&id=<?php echo $id ?>" role="button">
					<span class="glyphicon glyphicon-floppy-save"></span> Liệt Kê
				</a>
				<a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhh&ac=lietke" role="button">
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
							<div class="col-md-3" style="margin-left:30px;">
								<div class="form-group">
                                    <label>Hình đại diện <span class="maudo">(*)</span></label>
									<input type="file" id="image_list" name="file[]" style="width: 100%" multiple="multiple">
                                </div>
								<div class="form-group">
                                    <!-- <input name="them" class="form-control" type="submit" value="Thêm Mới"> -->
                                    <input type="submit" id="upload" name="upload" value="Uploads" style="width: 100%">
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