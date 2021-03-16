<?php 
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql=mysqli_query($conn,"select * from dathang where sodondh='$_GET[id]'");
	if($sql)
		$dong=mysqli_fetch_array($sql);
?>
<div class="content-wrapper" style="min-height: 786px;">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-shopping-cart"></i> Chi tiết đơn hàng</h1>
		<div class="breadcrumb">
			<a class="btn btn-primary btn-sm" href="index.php?quanly=hoadon&ac=lietke" role="button">
				<span class="glyphicon glyphicon-remove"></span> Thoát
			</a>
		</div>
	</section>
	<section class="content">
		<!-- Info boxes -->
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-body">
						<!--ND-->
						<div id="view">
							<form action="admin/orders/detail/75" enctype="multipart/form-data" method="post" accept-charset="utf-8">
								<h1 class="text-center" style="color: red;">CHI TIẾT ĐƠN HÀNG</h1>
								<h4>Tên khách hàng: <b><?php echo $dong['hotenkh'] ?></b></h4>
								<h4>Điện thoại: <i><?php echo $dong['dienthoai'] ?></i></h4>
								<h4>Thời gian đặt hàng: <i><?php echo $dong['ngaydh'] ?></i></h4>
								<h4><?php echo $dong['diachi'] ?></h4>
								<h4>Mã đơn hàng: <b><?php echo $dong['code'] ?></b></h4>
								<br>
								<div class="table-responsive">
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th class="text-center">STT</th>
												<th>Tên sản phẩm</th>
												<th class="text-center" style="width:100px">Số lượng</th>
												<th style="width:120px">Giá bán</th>
												<th class="text-right" style="width:120px">Thành tiền</th>
											</tr>
										</thead>
										<tbody>
											<?php 
												$sql_order=mysqli_query($conn,"select * from chitietdathang where sodondh='$_GET[id]'");
												$total=0;
												if($sql_order){
													while($rows=mysqli_fetch_array($sql_order)){
											?>
										    <tr>
										        <td class="text-center"><?php echo $rows['id'] ?></td>
										        <td><?php echo $rows['tenhh'] ?></td>
										        <td class="text-center"><?php echo $rows['soluong'] ?></td>
										        <td><?php echo number_format($rows['giaban']).'₫' ?></td>
										        <td class="text-right"><?php echo number_format($rows['giadathang']).'₫' ?></td>
										    </tr>
										    <?php 
										    		$total=$total+$rows['giadathang'];
										    	}
										    }	
										    ?>
										    <tr>
										        <td colspan="6" class="text-right" style="border: none; font-size: 1.1em;">Tổng cộng: <?php echo number_format($total).'₫' ?></td>
										    </tr>
										    <tr>
										        <td colspan="6" class="text-right" style="border: none; font-size: 1.1em;">Voucher giảm giá : 100,000₫</td>
										    </tr>
										    <tr>
										        <td colspan="6" class="text-right" style="border: none; font-size: 0.9em;">
										            <i>Phí vận chuyển: </i>
										            30,000₫
										        </td>
										    </tr>
										    <tr>
										        <td colspan="6" class="text-right" style="border: none; color: red; font-size: 1.3em;">Thành tiền: <?php echo number_format($dong['tongtien']+30000).'₫'?></td>
										    </tr>

										    <tr>
										        <td class="text-right" colspan="6">
										            <a class="btn btn-primary btn-md" role="button" onclick="window.print()"> <span class="glyphicon glyphicon-print"></span> In đơn hàng </a>
										        </td>
										    </tr>
										    
										</tbody>
									</table>
								</div>
								<div class="row">
									<div class="col-md-12 text-right">
										<ul class="pagination">
										</ul>
									</div>
								</div>
							</form>                    
						</div>
						<!--/.ND-->
					</div>
				</div><!-- /.box -->
			</div><!-- /.col -->
		</div><!-- /.row -->
	</section><!-- /.content -->	      	
</div>