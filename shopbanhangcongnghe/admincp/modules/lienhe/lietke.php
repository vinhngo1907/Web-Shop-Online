<?php 
    $conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    if(isset($_GET['trang'])){
        $trang = $_GET['trang'];
    }else{
        $trang='';
    }if($trang=='' || $trang =='1'){
        $trang1 = 0;
    }else{
        $trang1 = ($trang*5)-5;
    }
    $sql=mysqli_query($conn,"select * from lienhe order by id_lienhe desc limit $trang1,5");
    
    if(isset($_POST['xoa'])){
        $sql_xoa = "delete from lienhe where id_lienhe = '$_GET[id]'";
        mysqli_query($conn,$sql_xoa);
        header('location:../../index.php?quanly=lienhe&ac=lietke');
    }
    if(isset($_POST['xoa'])){
        $sql_xoa="delete from lienhe where id_lienhe='$_GET[id]'";
        mysqli_query($conn,$sql_xoa);
        header("location:../../index.php?quanly=lienhe&ac=lietke");
    }
?>
<script type="text/javascript">
    function ShowContact(id){
        window.location.href="index.php?quanly=lienhe&ac=xem&id="+id;
    }
    // function DeleteClient(id){
    //     if(alert("Are you sure ?")){
    //         window.location.href="modules/lienhe/lieke.php?quanly=lienhe&ac=xoaid="+id;
    //     }
    // }
</script>
<style type="text/css">
    /*.table .table-hover .table-bordered th{ text-align: center; }*/
</style>
<div class="content-wrapper" style="min-height: 891px;">
    <section class="content-header">
        <h1><i class="glyphicon glyphicon-list-alt"></i> Danh sách liện hệ</h1>
        <div class="breadcrumb">
            <a class="btn btn-primary btn-sm" href="admin/customer/recyclebin" role="button"> 
                <span class="glyphicon glyphicon-trash"></span> Thùng rác (0) 
            </a>
        </div>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box" id="view">
                    <!-- <div class="box-header with-border"> -->
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row" style="padding: 0px; margin: 0px;">
                                <!--ND-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th>Tên khách hàng</th>
                                                <th>Email</th>
                                                <th>Điện thoại</th>
                                                <th>Tiêu đề</th>
                                                <th class="text-center">Trạng thái</th>
                                                <th class="text-center">Ngày gửi</th>
                                                <th class="text-center" colspan="2">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                if($sql){
                                                    while($dong = mysqli_fetch_array($sql)){
                                            ?>
                                            <tr>
                                                <td class="text-center"><?php echo $dong['id_lienhe'] ?></td>
                                                <td><?php echo $dong['hoten'] ?></td>
                                                <td>
                                                    <?php echo $dong['email'];?>
                                                </td>
                                                <td><?php echo $dong['phone'] ?></td>
                                                <td><?php echo $dong['title'] ?></td>
                                                <td class="text-center"><?php 
                                                    if($dong['status']==1){
                                                        echo'<a href="#"> <span class="glyphicon glyphicon-ok-circle mauxanh18"></span> </a>';
                                                    }else{
                                                        echo'<a href="#"> <span class="glyphicon glyphicon-remove-circle maudo"></span> </a>';
                                                    }
                                                ?></td>
                                                <td><?php echo $dong['created_at'] ?></td>
                                                <td class="text-center">
                                                    <a class="btn btn-info btn-xs" href="#" role="button" onclick="ShowContact(<?php echo $dong['id_lienhe']?>)"> <span class="glyphicon glyphicon-edit"></span>Xem</a>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-danger btn-xs" href="#" role="button" role="button">
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
                                    <div class="col-md-12 text-center">
                                        <ul class="pagination">
                                            <?php 
                                                $sql_trang = mysqli_query($conn,"select * from lienhe");
                                                $count = mysqli_num_rows($sql_trang);
                                                $a = ceil($count/7);
                                            ?>
                                            <li class="hidden-xs"><a>Trang đầu</a></li>
                                            <li><a>Trước</a></li>
                                            <!-- <li class="active"><a>1</a></li>
                                            <li><a href="admin/customer/2">2</a></li> -->
                                            <?php
                                                for($b =1; $b<=$a;$b++){
                                                    if($trang==$b){
                                                        echo '
                                                        <li class="active">
                                                            <a href="index.php?quanly=lienhe&ac=lietke&trang='.$b.'">'.$b.'</a>
                                                        </li>';
                                                    }else{
                                                        echo '<li><a href="index.php?quanly=lienhe&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
                                                    }
                                                }
                                             ?>
                                            <li><a href="#">Sau</a></li>
                                            <li class="hidden-xs"><a href="#">Trang cuối</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.ND -->
                            </div>
                        </div>
                        <!-- ./box-body -->
                    <!-- </div> -->
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
    </section>
</div>