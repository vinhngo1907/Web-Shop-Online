<?php 
	include('modules/config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);

?>
<form action="modules/quanlyhh/xuly.php" method="post" enctype="multipart/form-data">
	<div class="content-wrapper" style="min-height: 636px;">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-cd"></i> Thêm Sản Phẩm Mới</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm" name="them">
					<span class="glyphicon glyphicon-floppy-save"></span>Lưu[Thêm]
				</button>
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
							<div class="col-md-9" style="width: 1000px;">
								<div class="form-group">
									<label>Tên hàng hóa <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="tenhh" style="width:100%" placeholder="Tên sản phẩm">
									<div class="error" id="password_error"></div>
								</div>
								<div class="row">
									<div class="col-md-12" style="width: 1000px;margin-left:15px;">
									    <div class="col-md-6" style="padding-right: 0px;">
                                            <div class="form-group">
                                                <label>Nhóm hàng hóa <span class="maudo">(*)</span></label>
												<?php 
													$sql_nhomhh=mysqli_query($conn,"select * from nhomhanghoa");
                                                    if($sql_nhomhh){
                                                ?>
                                                <select name="manhom" class="form-control">
													<option>[--Chọn nhóm hàng hóa--]</option>
                                                    <?php while($dong_nhomhh=mysqli_fetch_array($sql_nhomhh)){ ?>
                                                    <option value="<?php  echo $dong_nhomhh['manhom']?>">
                                                      <?php  echo $dong_nhomhh['tennhom']?>
                                                    </option>
                                                    <?php }?>
                                                </select>
                                                    <?php } ?>
                                                <div class="error" id="password_error"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="padding-left: 0px;">
                                            <div class="form-group">
                                                <label>Nhà sản xuất<span class="maudo">(*)</span></label>
                                                <?php $sql_hieusp=mysqli_query($conn,"select * from hieusp");
                                                    if($sql_hieusp){
                                                ?>
                                                <select name="idhieusp" class="form-control">
													<option>[--Chọn hiệu sản phẩm--]</option>
													<?php 
														while($dong_hieusp=mysqli_fetch_array($sql_hieusp)){ 
													?>
                                                    <option value="<?php  echo $dong_hieusp['idhieusp']?>" >
                                                    	<?php  echo $dong_hieusp['tenhieusp']?>
                                                    </option>
													<?php 
														}
													?>
                                                </select>
                                                    <?php } ?>
                                                <div class="error" id="password_error"></div>
                                            </div>
									    </div>
								    </div>
								</div>
								<div class="form-group">
									<label>Mô tả ngắn</label>
									<textarea name="motahh" class="form-control"></textarea>
								</div>
								<div class="form-group">
									<label>Chi tiết sản phẩm</label>
									<textarea name="noidung" id="detail" class="form-control"></textarea>
								</div>
							</div>
							
							<div class="col-md-3" style="margin-left:30px;">
								<div class="form-group">
									<label>Mã hàng hóa</label>
									<input type="text" name="mahh" class="form-control" style="width:100%" placeholder="Mã hàng hóa">
								</div>
								<div class="form-group">
									<label>Giá gốc</label>
									<input name="giagoc" class="form-control" type="number" value="0" min="0" step="1" max="1000000000">
								</div>
								<div class="form-group">
									<label>Khuyến mãi (%)</label>
									<input name="sale_off" class="form-control" type="number">
								</div>
								<div class="form-group">
									<label>Giá bán</label>
									<input name="giaban" class="form-control" type="number" value="0" min="0" step="1" max="1000000000">
									<div class="error" id="password_error"></div>
								</div>
								<div class="form-group">
									<label>Số lượng</label>
									<input name="soluonghang" class="form-control" type="number" value="1" min="1" step="1" max="1000">
								</div>
								<div class="form-group">
                                    <label>Hình đại diện</label>
                                    <input type="file" id="image_list" name="hinhanh" required="" style="width: 100%">
                                </div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="trangthai" class="form-control">
										<option>[--Chọn trạng thái--]</option>
										<option value="1">Kinh doanh</option>
										<option value="0">Chưa Kinh doanh</option>
									</select>
								</div>
							</div>
							
							<!-- <div class="form-group">
								<input name="them" class="form-control" type="submit" value="Thêm Mới">
							</div> -->
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