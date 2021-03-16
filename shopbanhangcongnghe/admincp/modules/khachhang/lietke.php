<?php 
    $conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    if(isset($_GET['trang'])){
        $trang = $_GET['trang'];
    }else{
        $trang='';
    }if($trang=='' || $trang =='1'){
        $trang1 = 0;
    }else{
        $trang1 = ($trang*7)-7;
    }
    $sql=mysqli_query($conn,"select * from khachhang order by mskh desc limit $trang1,7"); 
?>
<script type="text/javascript">
    function ShowInfo(id){
        window.location.href="index.php?quanly=khachhang&ac=xem&id="+id;
    }
</script>
<div class="content-wrapper" style="min-height: 891px;">
    <section class="content-header">
        <h1><i class="glyphicon glyphicon-user"></i> Danh sách khách hàng</h1>
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
                                                <th>Tên khách hàng</th>
                                                <th>Email</th>
                                                <th>Điện thoại</th>
                                                <th class="text-center" colspan="2">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                if($sql){
                                                    while($dong = mysqli_fetch_array($sql)){
                                            ?>
                                            <tr>
                                                <td class="text-center"><?php echo $dong['mskh'] ?></td>
                                                <td><?php echo $dong['hotenkh'] ?></td>
                                                <td><?php 
                                                    if($dong['email'] == '') echo "Khách vãng lai";
                                                    else{
                                                        echo $dong['email'];
                                                    }
                                                ?></td>
                                                <td><?php echo $dong['dienthoai'] ?></td>
                                                <td class="text-center">
                                                    <a class="btn btn-info btn-xs" href="#" role="button" onclick="ShowInfo(<?php echo $dong['mskh']?>)"> <span class="glyphicon glyphicon-edit"></span>Xem </a>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-danger btn-xs" href="modules/khachhang/xuly.php?ac=xoa&id=<?php echo $dong['mskh'] ?>" onclick="return confirm("Are you sure ?") " role="button">
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
                                        <ul class="pagination">
                                            <?php 
                                                $sql_trang = mysqli_query($conn,"select * from khachhang");
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
                                                            <a href="index.php?quanly=khachhang&ac=lietke&trang='.$b.'">'.$b.'</a>
                                                        </li>';
                                                    }else{
                                                        echo '<li><a href="index.php?quanly=khachhang&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
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
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
    </section>
</div>