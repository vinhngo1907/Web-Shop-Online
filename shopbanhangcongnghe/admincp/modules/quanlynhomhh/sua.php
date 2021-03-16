<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql="select * from nhomhanghoa where manhom = '$_GET[id]'";
    $run=mysqli_query($conn,$sql);
    if($run){
    $dong=mysqli_fetch_array($run);
?>
<form action="modules/quanlynhomhh/xuly.php?id=<?php echo $dong['manhom']?>" method="POST" enctype="multipart/form-data">
<div class="content-wrapper">
    <section class="content-header">
        <h1><i class="fas fa-location-slash "></i>Danh Sách Nhóm Hàng Hóa</h1>
        <div class="breadcrumb">
            <button class="btn btn-primary btn-sm" rol="button" type="submit" name="sua">
                <span class="glyphicon glyphicon-floppy-save"></span> Lưu[Cập Nhật]
            </button>
            <a class="btn btn-primary btn-sm" rol="button" href="index.php?quanly=quanlynhomhh&ac=lietke">
                <span class="glyphicon glyphicon-remove"></span>Thoát
            </a>
        </div>
    </section>
    <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<div class="box-header with-border">
						<div class="box-body">
							<div class="row" style="padding-left:0px;margin-left:0px;">
								<div class="col-md-9">
									<div class="form-group">
										<label for="formGroupExampleInput">Tên nhóm hàng hóa</label><span class="maudo">(*)</span>
										<input type="text" class="form-control" name="tennhom" id="formGroupExampleInput" value="<?php echo $dong['tennhom']?>">
                                    </div>
                                    <div class="form-group">
										<label for="formGroupExampleInput">Tên nhà sản xuất</label><span class="maudo">(*)</span>
                                        <select class="form-control" name="status" id="formGroupExampleInput">
                                            <?php
                                                if($dong['status']==1){
                                            ?>
                                                <option selected="selected" value="1">Đang kinh doanh</option>
                                                <option selected="selected" value="2">Ngừng kinh doanh</option>
                                            <?php
                                                }else{
                                            ?>
                                                <option value="1">Kinh doanh</option>   
                                                <option selected="selected" value="2">Ngừng kinh doanh</option>
                                            <?php }   ?>   
										</select>
                                    </div>
									<!-- <div class="form-group">
										<input type="submit" class="form-control" name="sua" id="formGroupExampleInput" value="Cập Nhật">
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
<?php
    }
?>