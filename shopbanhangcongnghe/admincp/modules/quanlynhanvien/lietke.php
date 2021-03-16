<?php
    $sql="select * from nhanvien order by msnv desc ";
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $run=mysqli_query($conn,$sql);
?>
<script type="text/javascript">
    function EditFile(id){
        window.location.href="index.php?quanly=quanlynhanvien&ac=sua&id="+id;
    }
    function DeleteFile(id){
        if(confirm("Are you sure ?")){
            window.location.href="modules/quanlynhanvien/xuly.php?id="+id;
        }
    }
</script>
<div class="content-wrapper" style="min-height: 636px;">
    <section class="content-header">
        <h1><span class="glyphicon glyphicon-user"></span> Danh sách tài khoản cửa hàng</h1>
        <div class="breadcrumb">
            <a class="btn btn-primary btn-sm" href="index.php?quanly=quanlynhanvien&ac=them" role="button">
                <span class="fa fa-user-plus"></span> Thêm mới
            </a>
            <a class="btn btn-primary btn-sm" href="index.php?quanly=thongke&ac=lietke" role="button">
                <span class="glyphicon glyphicon-trash"></span> Thùng rác(0)
            </a>
        </div>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box" id="view">
                    <div class="box-header with-border">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row" style="padding:0px; margin:0px;">
                                <!--ND-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th>Hình ảnh</th>
                                                <th>Họ và tên</th>
                                                <th class="text-center ">Giới tính</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Địa chỉ</th>
                                                <th class="text-center ">Trạng thái</th>
                                                <th class="text-center " colspan="2 ">Thao tác</th>
										    </tr>
                                        </thead>
									    <tbody>
                                            <?php
                                                if($run){
                                                    $i=1;
                                                    while($dong=mysqli_fetch_array($run)){
                                            ?>
										    <tr>
                                                <td class="text-center "><?php echo $dong['msnv'] ?></td>
                                                <td style="width:100px ">
                                                    <img src="modules/quanlynhanvien/uploads/<?php echo $dong['img'] ?>" class="img-responsive "/>
                                                </td>
                                                <td><?php echo $dong['hotennv'] ?></td>
                                                <td class="text-center ">
                                                    <?php 
                                                        if($dong['gender']== 1){ echo'Nam';}
                                                        else{echo'Nữ';}
                                                    ?>
                                                </td>
                                                <td><?php echo $dong['email']?></td>
                                                <td><?php echo $dong['phone'] ?></td>
                                                <td><?php echo $dong['diachi'] ?></td>
                                                <td class="text-center ">
                                                    <?php 
                                                        if($dong['status']== 1){ 
                                                            echo '<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>';
                                                        }
                                                        else{
                                                            echo'<span class="glyphicon glyphicon-remove-circle maudo"></span>';
                                                        }
                                                    ?>
                                                </td>
                                                <td class="text-center ">
													
                                                    <a class="btn btn-success btn-xs " onclick="EditFile(<?php echo $dong['msnv'] ?>)" role="button ">
                                                        <span class="glyphicon glyphicon-edit "></span> Sửa
                                                    </a>
												</td>
												<td class="text-center ">
													
                                                    <a class="btn btn-danger btn-xs " onclick="DeleteFile(<?php echo $dong['msnv'] ?>)" role="button ">
                                                        <span class="glyphicon glyphicon-edit "></span>Xóa
                                                    </a>
											    </td>
                                            </tr>
                                            <?php
                                                    $i++; 
                                                }
                                            }
                                            ?>
                                        </tbody>
                                        
								    </table>
							    </div>
                                <!-- <div class="row"></div> -->
							<!-- /.ND -->
						    </div>
					    </div><!-- ./box-body -->
				    </div><!-- /.box -->
		        </div>
		<!-- /.col -->
	    </div>
	  <!-- /.row -->
        </div>
    </section>
<!-- /.content -->
</div>
<style>
 @font-face {
  font-family: 'Glyphicons Halflings';
  src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot');
  src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.woff') format('woff'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
}
</style>