<?php
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	if(isset($_GET['trang'])){
		$trang=$_GET['trang'];
	}else{
		$trang='';
	}if($trang=='' || $trang=='1'){
		$trang1=0;
	}else{
		$trang1=($trang*10)-10;
	}
	$sql="select * from hanghoa,hieusp,nhomhanghoa where hanghoa.idhieusp=hieusp.idhieusp and hanghoa.manhom=nhomhanghoa.manhom order by hanghoa.mshh desc limit $trang1,10 ";
	$run=mysqli_query($conn,$sql);
?>
<script type="text/javascript">
	function EditFile(id){
		window.location.href="index.php?quanly=quanlyhh&ac=sua&id="+id;
	}
	function DeleteFile(id){
		if(confirm("Are you sure ?")){
			window.location.href="modules/quanlyhh/xuly.php?id="+id;
		}
	}
</script>
<div class="content-wrapper" style="min-height: 636px;">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-cd"></i> Danh mục sản phẩm</h1>

		<div class="breadcrumb">
			<a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhh&ac=them" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
			</a>			
			<a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhh&ac=trash" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác(0)
			</a>
		</div>
    </section>
    
    <section class="content">
        <div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<!-- /.box-header --><div class="box-header with-border">
						<div class="box-body">
							<div class="row" style="padding:0px; margin:0px;">
								<!--ND-->
								<div class="table-responsive">
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th class="text-center">ID</th>
												<th>Mã hàng</th>
												<th>Hình</th>
												<th>Tên hàng hóa</th>
												<th>Số lượng trong kho</th>
												<th>Nhóm hàng hóa</th>
												<th>Nhà sản xuất</th>
												<th class="text-center">Trạng thái</th>
												<th class="text-center">Nhập hàng</th>
												<th class="text-center">Gallery</th>
												<th class="text-center" colspan="2">Thao tác</th>
											</tr>
										</thead>
											
										<tbody>
											<?php 
												if($run){
												while($dong=mysqli_fetch_array($run)){
											?>
	                                        <tr>
												<td class="text-center"><?php echo $dong['mshh'] ?></td>
												<td><?php echo $dong['mahh'] ?></td>
												<td class="text-center">
													<img src="modules/quanlyhh/uploads/<?php echo $dong['hinhanh']?>" width="50" height="50"/>
												</td>
												<td><?php echo $dong['tenhh'] ?></td>
												<td class="text-center"><?php echo $dong['soluonghang'] ?></td>
												<td class="text-center"><?php echo $dong['tennhom'] ?></td>
												<td class="text-center"><?php echo $dong['tenhieusp'] ?></td>
												<td class="text-center ">
	                                           	<?php
	                                           		if($dong['trangthai'] == 1){
	                                           			echo '<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>';
	                                           		}else{
	                                           			echo '<span class="glyphicon glyphicon-remove-circle maudo"></span>';
	                                           		}
	                                           	 ?>       
	                                            </td>
												<td class="text-center">
													<a href="index.php?quanly=quanlyhh&ac=import&id=<?php echo $dong['mshh'] ?>" class="btn btn-info btn-xs" role="button">
														<span class="glyphicon glyphicon-edit"></span> Nhập hàng
													</a>
												</td>
												<td class="text-center">
													<a href="index.php?quanly=gallery&ac=lietke&id=<?php echo $dong['mshh'] ?>" class="btn btn-info btn-xs" role="button">
														<span class="glyphicon glyphicon-edit"></span> Gallery
													</a>
												</td>
												<td class="text-center">
													<a class="btn btn-success btn-xs" onclick="EditFile(<?php echo $dong
													['mshh'] ?>)">
														<span class="glyphicon glyphicon-edit"></span> Sửa
													</a>
												</td>
												<td class="text-center">
													<a class="btn btn-danger btn-xs" onclick="DeleteFile(<?php echo $dong['mshh'] ?>)" >
														<span class="glyphicon glyphicon-trash"></span> Xóa
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
								<div class="row">
									<div class="col-md-12 text-center" >
										<ul class="pagination">
											<?php 
												$sql_trang=mysqli_query($conn,"select * from hanghoa");
												$count_trang=mysqli_num_rows($sql_trang);
												$a=ceil($count_trang/10);
												$tmp=0;
												$b=1;
												echo'
												<li class="hidden-xs">
													<a href="index.php?quanly=quanlyhh&ac=lietke&trang='.$b.'" aria-label="Previous">
														<span aria-hidden="true">Trang đầu</span>
													</a>
												</li>
												<li>
													<a href="#" aria-label="Previous">
														<span aria-hidden="true">Trước</span>
													</a>
												</li>';
												for($b;$b<=$a;$b++){
													if($trang==$b){
														echo'<li class="active"><a href="index.php?quanly=quanlyhh&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
														$tmp=$b+1;
													}
													else{
														echo'<li>
																<a href="index.php?quanly=quanlyhh&ac=lietke&trang='.$b.'">'.$b.'
																</a>
															</li>';
													}
												}
												echo'<li>
														<a href="index.php?quanly=quanlyhh&ac=lietke&trang='.$tmp.'" aria-label="Next">
															<span aria-hidden="true">Sau</span>
														</a>
													</li>
											<li class="hidden-xs">
												<a href="index.php?quanly=quanlyhh&ac=lietke&trang='.($b-1).'" aria-label="Next"><span aria-hidden="true">Trang cuối</span></a>
											</li>'
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