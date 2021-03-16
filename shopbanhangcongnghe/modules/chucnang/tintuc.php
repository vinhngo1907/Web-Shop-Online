<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql=mysqli_query($conn,"select * from tintuc order by mstt asc");
 ?>
<section id="content">
    <div class="row wraper">
        <div class="banner-product">
            <div class="container">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <img src="admincp/images/sp.png" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 list-menu pull-left">
                    <div class="widget" style="margin: 0px; min-height: 0px;">
                        <p>Danh mục sản phẩm</p>
                    </div>

                    <ul class="main-ul"></ul>
                </div>
                <div class="widget">
                    <p>Bài viết mới nhất</p>
                    <div class="tab-container">
                        <?php
                            if($sql){
                            while($dong=mysqli_fetch_array($sql)){
                         ?>
                        <div class="spost clearfix">
                            <div class="entry-image e-img">
                                <a href="index.php?xem=chitiettintuc&id=<?php echo $dong['mstt'] ?>" class="nobg a-circle">
                                    <img class="img-circle-custom" src="admincp/modules/tintuc/uploads/<?php echo $dong['img'] ?>" alt="" />
                                </a>
                            </div>
                            <div class="entry-c">
                                <div class="entry-title e-title">
                                    <h4>
                                        <a href="index.php?xem=chitiettintuc&id=<?php echo $dong['mstt'] ?>"><?php echo $dong['title'] ?></a>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    <?php }} ?>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 product-content" id="list-content">
                <div class="product-wrap">
                    <div class="fs-newsboxs">
                        <?php 
                            if(isset($_GET['trang'])){
                                $trang=$_GET['trang'];
                            }else{
                                $trang='';
                            }if($trang=='' || $trang==1){
                                $trang1=0;
                            }else{
                                $trang1=($trang*3)-3;
                            }
                            if($sql_2 = mysqli_query($conn,"select * from tintuc order by mstt desc limit $trang1,3")){
                                while($dong_2=mysqli_fetch_array($sql_2)){
                        ?>
                        <div class="fs-ne2-it clearfix">
                            <div class="fs-ne2-if">
                                <a class="fs-ne2-img" href="index.php?xem=chitiettintuc&id=<?php echo $dong_2['mstt'] ?>">
                                    <img src="admincp/modules/tintuc/uploads/<?php echo $dong_2['img'] ?>" "="">
                                </a>
                                <div class="fs-n2-info">
                                    <h3>
                                        <a class="fs-ne2-tit" href="index.php?xem=chitiettintuc&id=<?php echo $dong_2['mstt'] ?>" title="">
                                           <?php echo $dong_2['title'] ?>
                                        </a>
                                    </h3>
                                    <div class="fs-ne2-txt"><?php echo $dong_2['introtext'] ?></div>
                                    <p class="fs-ne2-bot">
                                        <span class="fs-ne2-user">
                                            <img class="lazy" src="" style="" />
                                        </span>
                                        <span><?php echo $dong_2['created'] ?></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <?php 
                                }
                            }
                        ?>
                    </div>
                    <div class="row text-center">
                        <ul class="pagination">
                            
                            <?php 
                            $sql_count=mysqli_query($conn,"select * from tintuc");
                            $count=mysqli_num_rows($sql_count);
                            echo '
                                <li class="hidden-xs"><a>Trang đầu</a></li>
                                <li><a>Trước</a></li>';
                                $a = ceil($count/3);
                                for($b = 1;$b<=$a;$b++){
                                    if($trang==$b){
                                        echo'<li class="active"><a href="index.php?xem=tintuc&trang='.$b.'">'.$b.'</a></li>';
                                    }else{
                                        echo'<li><a href="index.php?xem=tintuc&trang='.$b.'">'.$b.'</a></li>';
                                    }
                                }
                                echo'<li><a href="index.php?xem=tintuc&trang='.($b-1).'">Sau</a></li>
                                <li class="hidden-xs"><a href="index.php?xem=tintuc&trang='.($b-1).'">Trang cuối</a></li>';
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
