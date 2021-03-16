<?php
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql_sp=mysqli_query($conn,"select * from hanghoa where mshh='$_GET[id]'");
	if($sql_sp)
		$dong_sp=mysqli_fetch_array($sql_sp);
?>
<form action="modules/quanlyhh/xuly.php?id=<?php echo $dong_sp['mshh']?>" method="post" enctype="multipart/form-data">
<div class="content-wrapper">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-product"></i>Cập Nhật Sản Phẩm</h1>
		<div class="breadcrumb">
			<button class="btn btn-primary btn-sm" rol="button" name="sua" type="submit">
                        <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Cập Nhật]
            </button>
			<a class="btn btn-primary btn-sm" role="button" href="index.php?quanly=quanlyhh&ac=lietke"><span class="glyphicon glyphicon-remove"></span> Thoát</a>
		</div>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<div class="box-header with-border">
						<div class="box-body">
							<div class="row" style="padding-left:0px;margin-left:0px;">
								<div class="col-md-9" style="width: 1000px;">
									<div class="form-group">
										<label for="formGroupExampleInput">Mã hàng hóa</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="mahh" id="formGroupExampleInput" value="<?php echo $dong_sp['mahh'] ?>" disabled>
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Tên hàng hóa</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="tenhh" id="formGroupExampleInput" placeholder="Tên hàng hóa..." value="<?php echo $dong_sp['tenhh'] ?>">
									</div>
									<div class="row" id="view">
										<div class="col-md-12" style="width: 1000px;margin-left:15px;">
											<div class="col-md-6"style="padding-left:0px;width: 490px;">
												<div class="form-group">
													<label for="formGroupExampleInput">Loại sản phẩm</label><span class="maudo">(*)</span>
													<?php
														$sql="select * from nhomhanghoa";
														$run=mysqli_query($conn,$sql);
														if($run){
													?>
													<select name="manhom" class="form-control">
													<?php
													while($dong=mysqli_fetch_array($run)){
														if($dong['manhom']==$dong_sp['manhom']){
													?>
														<option  value="<?php echo $dong['manhom'] ?>" selected="selected">
															<?php echo $dong['tennhom'] ?>	
														</option>
													<?php
														}else{
													?>
														<option value="<?php echo $dong['manhom'] ?>"><?php echo $dong['tennhom'] ?></option>
													<?php
														}
													?>
													<?php
														}
													}
													?>
													</select>
												</div>
											</div>
											<div class="col-md-6" style="padding-left:0px;width: 490px;margin-left: 20px;">
												<div class="form-group">
													<label for="formGroupExampleInput">Nhà sản xuất</label><span class="maudo">(*)</span>
													<?php
														$sql_hieusp="select * from hieusp";
														$run_hieusp=mysqli_query($conn,$sql_hieusp);if($run_hieusp){
													?>
													<select name="idhieusp" class="form-control">
														<?php
															while($dong_hieusp=mysqli_fetch_array($run_hieusp)){
																if($dong_hieusp['idhieusp']==$dong_sp['idhieusp']){
														?>
														<option selected="selected" value="<?php echo $dong_hieusp['idhieusp'] ?>"><?php echo $dong_hieusp['tenhieusp'] ?></option>
														<?php
															}else{
														?>
														<option value="<?php echo $dong_hieusp['idhieusp'] ?>">
															<?php echo $dong_hieusp['tenhieusp'] ?></option>
															<?php
																}
															}
													?>
													</select>
													<?php
														}
													?>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Mô tả ngắn</label>
										<textarea class="form-control" name="motahh" id="formGroupExampleInput"><?php echo $dong_sp['motahh'] ?></textarea>
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Nội dung</label>
										<textarea class="form-control" name="noidung" id="formGroupExampleInput"><?php echo $dong_sp['noidung']?>
										</textarea>
									</div>
								</div>
								<div class="col-md-3" style="margin-left: 30px;">
									<!-- <div class="form-group">
										<label for="formGroupExampleInput">Mã hàng hóa</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="mahh" id="formGroupExampleInput" value="<?php echo $dong_sp['mahh'] ?>">
									</div> -->
									<div class="form-group">
										<label for="formGroupExampleInput">Giá gốc</label>
										<input type="number" class="form-control" name="giagoc" value="<?php echo $dong_sp['giagoc'] ?>">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Khuyến mãi(%)</label>
										<input type="number" class="form-control" name="sale_off" value="<?php echo $dong_sp['sale_off'] ?>">
									</div>
									<div class="form-group">
										<?php if($dong_sp['sale_off'] != 0){
											$dong_sp['giaban'] = $dong_sp['giagoc']-$dong_sp['giagoc']*$dong_sp['sale_off']/100;
										} ?>
										<label for="formGroupExampleInput">Giá bán</label>
										<input type="number" class="form-control" name="giaban" value="<?php echo $dong_sp['giaban'] ?>">
									</div>
									<div class="form-group">
										<label>Số lượng tồn kho</label>
										<input name="soluonghang" class="form-control" type="number" value="<?php echo $dong_sp['soluonghang'] ?>" min="1" step="1" max="1000" disabled="">
									</div>
									<div class="form-group">
										<label>Số lượng đã bán</label>
										<input name="soluonghang" class="form-control" type="number" value="0" min="1" step="1" max="1000" disabled="">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Số lượng</label>
										<input type="number" class="form-control" min="1" step="1" max="1000" name="soluonghang" value="<?php echo $dong_sp['soluonghang'] ?>" >
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput">Hình ảnh</label>
										<input type="file" id="image_list" name="hinhanh" style="width: 100%">
										<img src="modules/quanlyhh/uploads/<?php echo $dong_sp['hinhanh'] ?>" width="50" height="50"/>
									</div>
									<div class="form-group">
	                                    <label>Trạng thái</label>
	                                    <select name="trangthai" class="form-control">
	                                        <?php
	                                            if($dong_sp['trangthai']==1){
	                                        ?>
	                                            <option selected="selected" value="1">Kinh doanh</option>
	                                            <option value="0">Chưa kinh doanh</option>
	                                        <?php
	                                            }else if($dong_sp['trangthai']==0){
	                                        ?>
	                                            <option value="1">Kinh doanh</option>
	                                            <option selected="selected" value="0">Chưa kinh doanh</option>
	                                        <?php
	                                            }
	                                        ?>   
                                    	</select>
                                	</div>
									<!-- <div class="form-group">
									<label>Hình ảnh sản phẩm</label>
									<input type="file" id="image_list" name="image_list[]" multiple="" >
									</div> -->
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