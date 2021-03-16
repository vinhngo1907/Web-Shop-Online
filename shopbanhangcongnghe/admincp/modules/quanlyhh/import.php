<?php 
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	
	$sql=mysqli_query($conn,"select * from hanghoa where mshh ='$_GET[id]'");
	if($sql)
		$dong=mysqli_fetch_array($sql);
		$id_nhom = $dong['manhom'];
?>
<form action="modules/quanlyhh/xuly.php<?php echo $dong['mshh'] ?>" enctype="multipart/form-data" method="post" accept-charset="utf-8">
<div class="content-wrapper" style="min-height: 636px;">	
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-text-background"></i> Nhập hàng</h1>
		<div class="breadcrumb">
			<button type="submit" class="btn btn-primary btn-sm">
				<span class="glyphicon glyphicon-floppy-save"></span> Lưu[Cập nhật]
			</button>
			<a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhh&ac=lietke" role="button">
				<span class="glyphicon glyphicon-remove do_nos"></span> Thoát
			</a>
		</div>
	</section>
	<!---------- Main content --------->
	<section class="content">
	    <div class="row">
	        <div class="col-md-12">
	            <div class="box" id="view">
	                <div class="box-body">
	                    <div class="col-md-9">
	                        <div class="form-group">
	                            <label>Tên sản phẩm </label>
	                            <input type="text" class="form-control" disabled="" name="tenhh" style="width: 100%;" placeholder="Tên sản phẩm" value="<?php echo $dong['tenhh'] ?>" />
	                            <div class="error" id="password_error"></div>
	                        </div>
	                        <div class="form-group">
	                            <label>Loại sản phẩm</label>
	                            <?php
									$sql_nhom=mysqli_query($conn,"select * from nhomhanghoa where manhom = '$id_nhom'");
									if($sql_nhom){
										$dong_nhom = mysqli_fetch_array($sql_nhom);
								?>
	                            <select name="manhom" class="form-control" style="width: 300px;" disabled="">
	                            <?php 
	                            	if($dong['manhom']==$dong_nhom['manhom']){
	                            ?>
	                                <option  value="<?php echo $dong_nhom['manhom'] ?>" selected="selected">
										<?php echo $dong_nhom['tennhom'] ?>	
									</option>
	                            <?php } ?>
	                            </select>
	                            <?php
									}
								?>
	                            <div class="error" id="password_error"></div>
	                        </div>
	                        <div class="form-group">
	                            <label>Tổng số lượng đã nhập</label>
	                            <input type="number" class="form-control" name="soluong" placeholder="Số lượng" min="0" max="10000" value="0" disabled="" value="<?php echo $dong_order ?>" />
	                        </div>
	                        <?php
	                        	$sql_order = mysqli_query($conn,"select * from chitietdathang where mshh = '$_GET[id]'");
								$count = 0;
	                        	if($sql_order){
	                        		while ($dong_order=mysqli_fetch_array($sql_order)) {
	                        		$count = $count + $dong_order['soluong'];	                        		}
	                        	}
	                         ?>
	                        <div class="form-group">
	                            <label>Số lượng sản phẩm đã bán</label>
	                            <input type="number" class="form-control" name="number" placeholder="Số lượng" min="0" max="10000" value="<?php echo $count ?>" disabled=""  />
	                        </div>
	                        <div class="form-group">
	                            <label>Số lượng còn của cửa hàng</label>
	                            <input type="number" class="form-control" name="soluonghang" placeholder="Số lượng" min="0" max="10000" value="<?php echo $dong['soluonghang'] ?>" disabled="" />
	                        </div>
	                        
	                        <div class="form-group">
	                            <label>Nhập số lượng nhập thêm<span class="maudo">(*)</span></label>
	                            <input type="number" class="form-control" name="soluong" style="width: 100%;" placeholder="Số lượng" min="0" max="10000" />
	                            <div class="error" id="password_error"></div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- /.box -->
	        </div>
	        <!-- /.col -->
	        <!-- /.row -->
	    </div>
	</section>
</div>
