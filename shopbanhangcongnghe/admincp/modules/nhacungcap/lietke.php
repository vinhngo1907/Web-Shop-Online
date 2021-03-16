<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql = mysqli_query($conn,"select * from nhacungcap order by idnhacc desc");

?>
<script type="text/javascript">
    function EditFile(id){
        window.location.href="index.php?quanly=nhacungcap&ac=sua&id="+id;
    }
    function DeleteFile(id){
        if(confirm("Are you sure?")){
            window.location.href="modules/nhacungcap/xuly.php?id="+id;
        }
    }
</script>
<div class="content-wrapper" style="min-height: 636px;">
<section class="content-header">
    <h1><i class="fa fa-gift"></i> Danh sách nhà cung cấp</h1>
    <div class="breadcrumb">
        <a class="btn btn-primary btn-sm" href="index.php?quanly=nhacungcap&ac=them" role="button"> <span class="glyphicon glyphicon-plus"></span> Thêm mới </a>
        <a class="btn btn-primary btn-sm" href="#" role="button"> <span class="glyphicon glyphicon-trash"></span> Thùng rác(0) </a>
    </div>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box" id="view">
                <div class="box-header with-border">
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row" style="padding: 0px; margin: 0px;">
                            <!--ND-->
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="width: 20px;">ID</th>
                                            <th class="text-center">Code</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Keyword</th>
                                            <th class="text-center">Trạng thái</th>
                                            <th class="text-center" colspan="2">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                            if($sql){
                                                while($dong=mysqli_fetch_array($sql)){
                                        ?>
                                        <tr>
                                            <td class="text-center"><?php echo $dong['idnhacc'] ?></td>
                                            <td><?php echo $dong['code']?></td>
                                            <td><?php echo $dong['tennhacc'] ?></td>
                                            <td><?php echo $dong['keyword']?></td>
                                            <td class="text-center">
                                                <?php 
                                                    if($dong['status'] == 1){
                                                        echo '<a href="#"><span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
                                                </a>';
                                                    }else{
                                                        echo '<a href="#"><span class="glyphicon glyphicon-remove-circle maudo"></span>';
                                                    }
                                                ?>
                                            </td>
                                            <td class="text-center">
                                                <a class="btn btn-success btn-xs" href="#" role="button" onclick="EditFile(<?php echo $dong['idnhacc'] ?>)"> 
                                                    <span class="glyphicon glyphicon-edit"></span>Sửa </a>
                                            </td>
                                            <td class="text-center">
                                                <a class="btn btn-danger btn-xs" href="#" onclick="DeleteFile(<?php echo $dong['idnhacc']?>)" role="button">
                                                    <span class="glyphicon glyphicon-trash"></span>Xóa
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
                                <div class="col-md-12 text-center">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                            <!-- /.ND -->
                        </div>
                    </div>
                    <!-- ./box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
</section>
</div>