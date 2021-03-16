<script type="text/javascript">
	function DeleteFile(id){
		if(confirm("Are you sure ?")){
			window.location.href="modules/hoadon/xuly.php?id="+id;
		}
	}
	function ApproveOrder(id){
		if(confirm('Xác nhận gói hàng và chuẩn bị giao hàng ?')){
			window.location.href="index.php?quanly=hoadon&ac=lietke&change=update&id="+id;
			
		}
	}
	function Delivery(id){
		if(confirm('Xác nhận đơn hàng đã giao và thanh toán thành công ?')){
			window.location.href="index.php?quanly=hoadon&ac=lietke&change=paid&id="+id;
		}
	}
</script>
<?php 
	if(isset($_GET['trang'])){
		$trang=$_GET['trang'];
	}else{
		$trang='';
	}if($trang=='' || $trang=='1'){
		$trang1=0;
	}else{
		$trang1=($trang*10)-10;
	}
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql=mysqli_query($conn,"select * from dathang order by sodondh desc limit $trang1,10");
	if(isset($_GET['change']) && $_GET['change']=='update'){
        // $id=$_GET['id'];
        $sql_update=mysqli_query($conn,"UPDATE dathang SET trangthai='Đang giao hàng' WHERE sodondh = '$_GET[id]'");
        header('location:index.php?quanly=hoadon&ac=lietke&trang='.$trang);
    }
	if(isset($_GET['change']) && $_GET['change']=='paid'){
		$sql_sua=mysqli_query($conn,"UPDATE dathang SET trangthai='Đã giao' where sodondh='$_GET[id]'");
		header('location:index.php?quanly=hoadon&ac=lietke&trang='.$trang);
	}
?>
<form action="" method="post" enctype="multipart/form-data">
<div class="content-wrapper" >
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-list-alt"></i> Danh Sách Đơn Hàng</h1>
		<div class="breadcrumb">
			<a class="btn btn-primary btn-sm" href="index.php?quanly=hoadon&ac=recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Đơn hàng đã lưu (0)
			</a>
		</div>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<div class="box-header with-border">
						<div class="box-body">
							<div class="row" style="padding:0px; margin:0px;">
								<div class="row">
									<div class="table-responsive">
										<table class="table table-hover table-bordered" style="font-size: 0.9em;">
											<thead>
												<tr>
													<th class="text-center" style="width:20px">Code</th>
													<th>Khách hàng</th>
													<th>Điện thoại</th>
													<th>Tổng tiền</th>
													<th>Ngày tạo hóa đơn</th>
													<th class="text-center">Trạng thái</th>
													<th class="text-center" colspan="2">Xử lý đơn</th>
													<th class="text-center" colspan="2">Thao tác</th>
												</tr>
											</thead>
											<tbody>
											<?php 
												if($sql){
													while($dong=mysqli_fetch_array($sql)){
											?>
												<tr>
												    <td class="text-center"><?php echo $dong['code'] ?></td>
												    <td><?php echo $dong['hotenkh'] ?></td>
												    <td><?php echo $dong['dienthoai'] ?></td>
												    <td><?php echo number_format($dong['tongtien']).'₫' ?></td>
												    <td><?php echo $dong['ngaydh'] ?></td>
												    <td style="text-align: center;"><?php echo $dong['trangthai'] ?></td>
												    <td style="text-align: center;">
												    <?php 
												    	if($dong['trangthai']==='Đang chờ duyệt'){
												    ?>
														<a class="btn btn-default btn-xs" href="#" onclick="ApproveOrder(<?php echo $dong['sodondh'] ?>)" role="button">
															<i class="fa fa fa-check-circle"></i> Duyệt đơn đặt hàng
														</a>
													<?php
														}
														else if($dong['trangthai']==='Đang giao hàng'){
													?>
														<a class="btn btn-success btn-xs" href="#" onclick="Delivery(<?php echo $dong['sodondh'] ?>)" role="button">
															<i class="fa fa-thumbs-o-up"></i> Xác nhận thanh toán
														</a>
													<?php
														}
													 ?>
												    </td>
												    <td class="text-center">
												        <a class="btn btn-danger btn-xs" href="#" onclick="DeleteFile(<?php echo $dong['sodondh'] ?>)" role="button"> <i class="fa fa-times"></i> Hủy đơn </a>
												    </td>

												    <td class="text-center">
												        <!-- /Xem -->
												        <a class="btn btn-info btn-xs" href="index.php?quanly=hoadon&ac=xem&id=<?php echo $dong['sodondh'] ?>" role="button"> <span class="glyphicon glyphicon-eye-open"></span> Xem </a>
												        <!-- /Xóa -->
												        <a class="btn bg-olive btn-xs" href="#" onclick="" role="button"> <i class="fa fa-save"></i> Lưu đơn 
												        </a>
												    </td>
												</tr>
												<?php 
													}
												}
												?>
											</tbody>
										</table>
									</div>
									<div class="col-md-12 text-center">
									    <ul class="pagination">		        
								        <?php 
								        	$sql_trang=mysqli_query($conn,"select * from dathang");
											$count_trang=mysqli_num_rows($sql_trang);
											$a=ceil($count_trang/10);
											echo '
											<li class="hidden-xs"><a href="#">Trang đầu</a></li>
									        <li><a href="#">Trước</a></li>';
										for($b=1;$b<=$a;$b++){
											if($trang==$b){
											echo'
											<li class="active"><a href="index.php?quanly=hoadon&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
											}
											else{
											echo'
											<li><a href="index.php?quanly=hoadon&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
											}
										}
												echo '
											<li><a href="index.php?quanly=hoadon&ac=lietke&trang='.($b-1).'">Sau</a></li>
									        <li class="hidden-xs"><a href="index.php?quanly=hoadon&ac=lietke&trang='.($b).'">Trang cuối</a></li>';
									        ?>
									        
									    </ul>
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