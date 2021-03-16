<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql="select * from slider order by idslider desc";
    $run=mysqli_query($conn,$sql);
?>
<script type="text/javascript">
    function EditFile(id) {
        window.location.href="index.php?quanly=giaodien&ac=sua&id="+id;
    }
</script>
<div class="content-wrapper" style="min-height: 636px;">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-picture"></i> Quản lý sliders</h1>
			<div class="breadcrumb">
				<a class="btn btn-primary btn-sm" href="index.php?quanly=giaodien&ac=them">
					<span class="glyphicon glyphicon-plus"></span> Thêm mới </a>
				<a class="btn btn-primary btn-sm" href="index.php?quanly=giaodien&ac=trash" role="button">
					<span class="glyphicon glyphicon-trash"></span> Thùng rác
				</a>
			</div>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box" id="view">
						<div class="box-body">
                            <!-- <div class="box-header with-border"> -->
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th class="text-center">Hình</th>	
                                                <th class="text-center">Tên sliders</th>
                                                <th class="text-center">Trạng thái</th>	
                                                <th colspan="2" class="text-center">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                                if($run){
                                                    $i=1;
                                                    while($dong=mysqli_fetch_array($run)){ 
                                            ?>
                                            <tr>
                                                <td class="text-center"><?php echo $dong['idslider'] ?></td>
                                                <td>
                                                <img src="modules/giaodien/uploads/<?php echo $dong['hinh']?>" width="83" height="32"/>
                                                </td>	
                                                <td><?php  echo $dong['tenslider'] ?></td>
                                                <td class="text-center">
                                                    <?php  if($dong['status']==1) {echo '
                                                    <a href="#">
                                                        <span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
                                                    </a>';
                                                    }else echo '<a href="#">
                                                        <span class="glyphicon glyphicon-remove-circle maudo"></span></a>';
                                                     ?>
                                                </td>	
                                                <!-- <td class="text-center">
                                                    <a class="btn btn-success btn-xm" href="index.php?quanly=giaodien&ac=sua&id=<?php echo $dong['idslider']?>">
                                                        <span class="glyphicon glyphicon-edit"></span> Sửa</a>
                                                </td> -->
                                                <td class="text-center">
                                                    <a class="btn btn-success btn-xs" href="#" role="button" onclick="EditFile(<?php echo $dong['idslider']?>)">
                                                        <span class="glyphicon glyphicon-edit"></span>Sửa
                                                    </a>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-danger btn-xs" href="modules/giaodien/xuly.php?id=<?php echo $dong['idslider']?>" role="button">
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
                            <!-- </div> -->
						</div>
					</div><!-- /.box -->
				</div>
			<!-- /.col -->
		  </div>
		  <!-- /.row -->
		</section>
<!-- /.content -->
</div>