<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    // $sql_laptop=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%laptop%'");
    // $sql_dienthoai=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%dienthoai%'");
    // $sql_pc=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%pc%'"); 
    // $sql_phukien=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%phukien%'"); 
    $sql_nhom=mysqli_query($conn,"select * from nhomhanghoa order by manhom asc");  
?>
<section id="menu-slider" style="margin-bottom: 5px;">
    <div class="menu-pri">
        <div class="container">
            <div class="panel-left" style="background: #0f9ed8;">
                <!--MOBILE-->
                <nav class="navbar navbar-default hidden-md hidden-lg" role="navigation">
                    <div class="container-fluid" style="background-color: #0f9ed8;">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar primary-color"></span>
                                <span class="icon-bar primary-color"></span>
                                <span class="icon-bar primary-color"></span>
                                <span class="icon-bar primary-color"></span>
                            </button>
                            <a class="navbar-brand" style="color: #fff;" href="#">Danh mục sản phẩm</a>
                        </div>
                        <div class="collapse navbar-collapse navbar-ex1-collapse hidden-md hidden-lg">
                            <ul class="nav navbar-nav">
                                 <?php 
                                    if($sql_nhom){
                                        while($row_nhom=mysqli_fetch_array($sql_nhom)){
                                            $id_nhom=$row_nhom['manhom'];
                                    ?>
                                <li class="dropdown">
                                    <a href="index.php?xem=loaisp&id=<?php echo $id_nhom ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $row_nhom['tennhom'] ?>
                                        <i class="fa fa-angle-right pull-right" aria-hidden="true"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <?php 
                                            if($sql_hieusp=mysqli_query($conn,"select * from hanghoa,hieusp where hanghoa.manhom='$id_nhom' and hieusp.idhieusp=hanghoa.idhieusp")){
                                            while($rows_hieusp=mysqli_fetch_array($sql_hieusp)){
                                        ?> 
                                        <li>
                                            <a href="index.php?xem=chitietloaisp&id=<?php echo $rows_hieusp['idhieusp'] ?>"><?php echo $rows_hieusp['tenhieusp'] ?></a>
                                        </li>
                                        <?php 
                                            }
                                        } 
                                        ?>
                                    </ul>
                                </li>
                                <?php 
                                        }
                                    }
                                    ?>
                            </ul>  
                        </div><!-- /.navbar-collapse -->
                    </div>
                </nav>
                <!--MD LG-->
            </div>
            <div class="col-md-12 col-lg-12 panel-right hidden-xs text-center" style="background: #0f9ed8;height: 50px;">
                <ul class="menu-right" style="display: inline-block;">
                    <li class="pull-left"><a href="index.php">Trang chủ</a></li>
                    <li class="pull-left"><a href="index.php?xem=sanpham">Sản phẩm</a></li>
                    <?php 
                        $sql=mysqli_query($conn,"select * from nhomhanghoa order by manhom asc");
                        if($sql){
                            while($dong=mysqli_fetch_array($sql)){
                                // $id=$_GET['manhom'];
                    ?>
                    <li class="pull-left"><a href="index.php?xem=loaisp&id=<?php echo $dong['manhom']?>"><?php echo $dong['tennhom'] ?></a></li>
                    <?php
                        }
                    }
                     ?>
                    <!-- <li class="pull-left"><a href="index.php?xem=laptop">Laptop</a></li>
                    <li class="pull-left"><a href="index.php?xem=pc">PC - WorkStation</a></li>
                    <li class="pull-left"><a href="index.php?xem=phukien">Phụ kiện</a></li>     -->            
                    <li class="pull-left"><a href="index.php?xem=tintuc">Tin tức</a></li>
                    <li class="pull-left"><a href="index.php?xem=gioithieu">Giới thiệu</a></li>
                    <li class="pull-left"><a href="index.php?xem=lienhe">Liên hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>