<?php
	$id=$_GET['id'];
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql_sp=mysqli_query($conn,"select * from hanghoa where mshh='$_GET[id]'");
	$dong_sp=mysqli_fetch_array($sql_sp);
	
?>
<div class="content-wrapper" style="min-height: 636px;">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-cd"></i> Danh mục sản phẩm</h1>
		<div class="breadcrumb">
			<a class="btn btn-primary btn-sm" href="index.php?quanly=gallery&ac=them&id=<?php echo $id ?>" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
			</a>			
			<!-- <a class="btn btn-primary btn-sm" href="index.php?quanly=gallery&ac=trash" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác
			</a> -->
			<a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhh&ac=lietke" role="button">
				<span class="glyphicon glyphicon-remove"></span> Thoát
			</a>
		</div>
    </section>
    <section class="content">
        <div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row" style="padding:0px; margin:0px;">
							<!--ND-->
							<div class="table-responsive">
								<table class="table table-hover table-bordered">
									<thead>
										<tr>
											<th>Hình ảnh</th>
											<th>Tên hàng hóa</th>
											<th>Gallery</th>
											<th class="text-center" >Thao tác</th>
										</tr>
									</thead>
									<tbody>
                                        <tr>
											<td class="text-center">
												<img src="modules/quanlyhh/uploads/<?php echo $dong_sp['hinhanh']?>" width="50" height="50"/>
											</td>
											<td><?php echo $dong_sp['tenhh'] ?></td>
											<td>
												<?php 
													$sql_gal=mysqli_query($conn,"select hinhanhsp from gallery where gallery.mshh='$id'");
													$count=mysqli_num_rows($sql_gal);
													if($count > 0){
														while($dong_gal=mysqli_fetch_array($sql_gal)){
												?>
            										<img src="modules/gallery/uploads/<?php echo $dong_gal['hinhanhsp'] ?>" width="50" height="50" />
												<?php 
														}
													}else{	 echo '<p> Chưa có hình ảnh</p>';}
												?>
											</td>
											<td class="text-center">
												<a class="btn btn-danger btn-xs" href="modules/gallery/xuly.php?quanly=xoa&id=<?php echo $id?>" role="button">
													<span class="glyphicon glyphicon-trash"></span> Xóa
												</a>
											</td>
										</tr>
									</tbody>
                                </table>
							</div>
							
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
