<?php 
	$conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql=mysqli_query($conn,"select * from khuyenmai where id='$_GET[id]'");
	if($sql)
		$dong=mysqli_fetch_array($sql);
?>
<form action="modules/giamgia/xuly.php?id=<?php echo $dong['id'] ?>" enctype="multipart/form-data" method="post" accept-charset="utf-8">
<div class="content-wrapper" style="min-height: 891px;">
	
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-text-background"></i> Cập nhật mã giảm giá</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm" name="sua">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Cập nhật]
				</button>
				<a class="btn btn-primary btn-sm" href="index.php?quanly=giamgia&ac=lietke" role="button">
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
							<div class="col-md-6">
								<div class="form-group">
									<label>Mã giảm giá</label>
									<input type="text" class="form-control" name="code" style="width:100%" placeholder="Mã giảm giá" value="<?php echo $dong['code'] ?>">
									<div class="error" id="password_error"></div>
								</div>
								<div class="form-group">
									<label>Số tiền giảm giá</label>
									<input type="number" class="form-control" name="discount" style="width:100%" placeholder="Số tiền giảm giá" value="<?php echo $dong['discount'] ?>">
									<div class="error" id="password_error"></div>
								</div>
								<div class="form-group">
									<label>Tổng số lần nhập</label>
									<input type="number" class="form-control" name="limit_number" style="width:100%" placeholder="Số lần giới hạn nhập" value="<?php echo $dong['limit_number'] ?>">
									<div class="error" id="password_error"></div>
								</div>
								<div class="form-group">
									<label>Số lần đã nhập</label>
									<input type="number" class="form-control" name="number_used" style="width:100%" value="0" disabled="">
									<div class="error" id="password_error"></div>
								</div>
								<div class="form-group">
									<label>Số lần còn lại</label>
									<input type="text" class="form-control" style="width:100%" placeholder="Số lần giới hạn nhập" value="200" disabled="">
								</div>
								
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Số tiền đơn hàng tối thiểu được áp dụng</label>
									<input type="number" class="form-control" name="payment_limit" style="width:100%" placeholder="Số tiền đơn hàng tối thiểu được áp dụng" value="<?php echo $dong['payment_limit'] ?>">
								</div>
								<div class="form-group">
									<label>Ngày giới hạn nhập</label>
									<input type="text" class="form-control" name="expiration_date" style="width:100%" placeholder="Số lần giới hạn nhập" value="<?php echo $dong['expiration_date'] ?>">
								</div>
								<div class="form-group">
									<label>Mô tả ngắn</label>
									<textarea name="description" class="form-control" value=""><?php echo $dong['description'] ?></textarea>
								</div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="status" class="form-control">
										<?php 
											if($dong['status']==1){
										?>
										<option value="1" selected="">Có hiệu lực</option>
										<option value="0">Hết hiệu lục</option>
										<?php 
											}else{
										?>
										<option value="1" selected="">Có hiệu lực</option>
										<option value="0">Hết hiệu lục</option>
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
	
	<!-- /.coupon -->
</div></form>