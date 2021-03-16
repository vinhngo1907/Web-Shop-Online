<?php
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql="select * from hieusp where idhieusp=$_GET[id]";
	$run=mysqli_query($conn,$sql);
	if($run){
		$dong=mysqli_fetch_array($run);
?>
<form action="modules/quanlyhieusp/xuly.php?id=<?php echo $dong['idhieusp']?>" method="post" enctype="multipart/form-data">
	<div class="content-wrapper">
		<section class="content-header">
		<h1><i class="glyphicon glyphicon-text-background"></i> Cập Nhật Nhà Sản Xuất</h1>
    <div class="breadcrumb">
      <button class="btn btn-primary btn-sm" type="submit" name="sua">
        <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Cập Nhật]
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
							<div class="row" style="padding-left:0px; margin-left:0px;">
								<div class="col-md-9" style="width:1000px;">
									<div class="form-group">
										<label for="formGroupExampleInput">Tên nhà sản xuất</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="tenhieusp" id="formGroupExampleInput" value="<?php echo $dong['tenhieusp'] ?>">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Tình trạng</label><span class="maudo">(*)</span>
										<select class="form-control" name="tinhtrang" id="formGroupExampleInput">
											<?php
												if($dong['tinhtrang']==1){
											?>
											<option value="1" selected="selected">Xuất bản</option>
											<option value="2" >Chưa xuất bản</option>
											<?php
												}else{
											?>		
											<option value="1">Xuất bản</option>
											<option value="2" selected="selected">Chưa xuất bản</option>	
											<?php
												}
											?>	
										</select>
									</div>
									<!-- <div class="form-group">
										<input type="submit" class="form-control" name="sua" id="formGroupExampleInput" value="Cập Nhật">
									</div> -->
								</div>
								<div class="col-md-3" style="margin-left:20px;">
									<div class="form-group">
										<label for="formGroupExampleInput">Từ khóa <span class="maudo">(*)</span></label>
										<input type="text" class="form-control" name="keyword" id="formGroupExampleInput" value="<?php echo $dong['keyword'] ?>">
										<span style="font-style: italic; line-height: 32px;">Chú ý: Mỗi từ khóa phân cách bởi một dấu ",". Ví dụ: dienthoai, maytinhbang</span>
										<div class="error" id="password_error" style="color: red"></div>
									</div>
									<div class="form-group">
										<label>Logo đại diện</label><span class="maudo">(*)</span>
										<input type="file" id="image_list" name="logo" style="width: 100%">
										<img src="modules/quanlyhieusp/uploads/<?php echo $dong['logo'] ?>"/>
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
<?php
	}
?>