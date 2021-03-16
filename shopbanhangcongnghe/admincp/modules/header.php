<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    if(isset($_GET['ac']) && $_GET['ac']=='dangxuat'){
        unset($_SESSION['dangnhap']);
        header('location:login.php');
    }
?>
<header class="main-header">
    <a href="http://localhost/shopbanhangcongnghe/admincp/index.php" class="logo" style="height: 52px;">
        <span class="logo-lg">Quản trị hệ thống</span>
    </a>
    <nav class="navbar navbar-static-top" style="height: 52px">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <?php
            $sql_order=mysqli_query($conn,"select * from dathang");
            $count = mysqli_num_rows($sql_order);
            if($sql_order)
            $sql1=mysqli_query($conn,"select * from dathang where trangthai='Đang chờ duyệt'");
            $count1=mysqli_num_rows($sql1);  
            $sql2=mysqli_query($conn,"select * from dathang where trangthai='Đang giao hàng'");
            $count2=mysqli_num_rows($sql2);  
         ?>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav" style="height: 52px;  padding: 1px">
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-bell-o"></i><span class="label label-warning"><?php echo $count1+$count2 ?></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- <li >
                            <ul class="menu">
                                <li>
                                    <a href="#"> 
                                        <i class="fa fa-users text-aqua"></i>
                                    <?php echo $count1.' Đơn hàng chưa duyệt' ?></a>
                                </li>
                            </ul>
                        </li>
                        <li >
                            <ul class="menu">
                                <li><a href="#"><i class="fa fa-users text-aqua"></i>  <?php  echo $count2.' Đơn hàng đang giao'?></a></li>
                            </ul>
                        </li> -->
                        <li><a href="index.php?quanly=hoadon&ac=lietke" style="color: #444444;"><i class="fa fa-users text-aqua"></i><?php echo $count1.' Đơn hàng chưa duyệt' ?></a>
                        </li>
                        <li ><a href="index.php?quanly=hoadon&ac=lietke" style="color: #444444;"><i class="fa fa-users text-aqua"></i><?php  echo $count2.' Đơn hàng đang giao'?></a>
                        </li>
                        <li class="footer"><a href="index.php?quanly=hoadon&ac=lietke">Xem</a>
                        </li>
                    </ul>
                    
                </li>
                <li style="height: 52px">
                    <a target="_blank" href="http://localhost/shopbanhangcongnghe/">
                        <span class="glyphicon glyphicon-home"></span>
                        <span>Website</span>
                    </a>
                </li>
                <?php
                    if(isset($_SESSION['dangnhap'])){
                        $sql=mysqli_query($conn,"select * from user_account,nhanvien where nhanvien.username='$_SESSION[dangnhap]' and user_account.username='$_SESSION[dangnhap]' limit 1");
                        if($sql){ 
                            $dong=mysqli_fetch_array($sql);
                ?>
          
                <li class="dropdown user user-menu" style="height: 52px; padding: 0px">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="images/admin/user-group.png" class="user-image" alt="User Image">
                        <span class="hidden-xs">ADMIN</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="images/admin/user-group.png" class="img-circle" alt="User Image">
                            <p><?php echo $dong['username']?><small></small><?php echo $dong['phone'] ?></small></p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="index.php?quanly=quanlynhanvien&ac=sua&id=<?php echo $dong['id_user'] ?>" class="btn btn-default btn-flat">Chi tiết</a>
                            </div>
                            <div class="pull-right">
                                <a href="index.php?ac=dangxuat" class="btn btn-default btn-flat">Thoát</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- </form> -->
                <?php
                       } 
                    }
                ?>
            </ul>
        </div>
    </nav>
</header>