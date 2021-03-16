<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql = mysqli_query($conn,"select * from tintuc order by mstt desc");
?>
<script type="text/javascript">
    function DeleteFile(id){
        if(confirm("Are you sure ?")){
            window.location.href="modules/tintuc/xuly.php?id="+id;
        }
    }
    function EditFile(id){
        window.location.href="index.php?quanly=tintuc&ac=sua&id="+id;
    }
</script>
<div class="content-wrapper" style="min-height: 891px;">
    <section class="content-header">
        <h1><i class="glyphicon glyphicon-text-background"></i> Danh sách bài viết</h1>
        <div class="breadcrumb">
            <a class="btn btn-primary btn-sm" href="index.php?quanly=tintuc&ac=them" role="button" name="them"> 
                <span class="glyphicon glyphicon-plus"></span> Thêm mới 
            </a>
            <a class="btn btn-primary btn-sm" href="#" role="button"> 
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
                            <div class="row" style="padding: 0px; margin: 0px;">
                                <!--ND-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th class="text-center" style="width: 100px;">Hình</th>
                                                <th class="text-center">Tiêu đề bài viết</th>
                                                <th class="text-center">Trạng thái</th>
                                                <th class="text-center" colspan="2">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                if($sql){
                                                    while($dong = mysqli_fetch_array($sql)){
                                            ?>
                                            <tr>
                                                <td class="text-center"><?php echo $dong['mstt'] ?></td>
                                                <td>
                                                    <img src="modules/tintuc/uploads/<?php echo $dong['img'] ?>" width="100" height="50"/>
                                                </td>
                                                <td><?php echo $dong['title'] ?></td>
                                                <td class="text-center">
                                                    <?php if($dong['status']==1){
                                                        echo'<a href="#">
                                                        <span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
                                                    </a>';
                                                    }else{
                                                        echo'<a href="#">
                                                        <span class="glyphicon glyphicon-remove-circle maudo"></span>
                                                    </a>';
                                                    } ?>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-success btn-xs" href="#" role="button" onclick="EditFile(<?php echo $dong['mstt'] ?>)"> <span class="glyphicon glyphicon-edit"></span>Sửa </a>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-danger btn-xs" href="#" onclick="DeleteFile(<?php echo $dong['mstt'] ?>)" role="button">
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
    <!-- /.content -->
</div>

