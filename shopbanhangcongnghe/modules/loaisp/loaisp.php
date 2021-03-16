<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
     // $sql_phone = mysqli_query($conn,"select * from hanghoa where hanghoa.manhom=8 ");

    $sql_dienthoai=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%dienthoai%'"); 
    $sql_maytinh=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%laptop%'");
    $sql_pc=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%pc%'"); 
    $sql_phukien=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%phukien%'"); 
    $id=$_GET['id'];
?>
<section id="product-all" class="collection">
    <div class="banner-product">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <img src="admincp/images/sp.png">
            </div>
        </div>
    </div>
    <div class="slider">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="list-menu pull-left col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="widget" style="margin: 0px; min-height: 0px;"><p>Danh mục sản phẩm</p></div>
                     <ul class="main-ul">
                    <?php 
                        $sql_nhom=mysqli_query($conn,"select * from nhomhanghoa order by manhom asc");
                        if($sql_nhom){
                            while ($rows_nhom=mysqli_fetch_array($sql_nhom)) {
                                $id_nhom=$rows_nhom['manhom'];
                    ?>
                        <li>
                            <a href="index.php?xem=loaisp&id=<?php echo $rows_nhom['manhom'] ?>" title="<?php echo $rows_nhom['tennhom'] ?>"><?php echo $rows_nhom['tennhom'] ?>
                                <i class="fa fa-angle-right pull-right" aria-hidden="true"></i>
                            </a>
                            <ul class="sub" style="height: auto;">
                            <?php 
                                if($sql_hieusp=mysqli_query($conn,"select * from hanghoa,hieusp where hanghoa.manhom='$id_nhom' and hieusp.idhieusp=hanghoa.idhieusp")){
                                while($rows_hieusp=mysqli_fetch_array($sql_hieusp)){
                            ?> 
                                <li><a href="index.php?xem=chitietloaisp&id=<?php echo $rows_hieusp['idhieusp'] ?>" title="<?php echo $rows_hieusp['tenhieusp'] ?>"><?php echo $rows_hieusp['tenhieusp'] ?></a></li>
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
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 products-sale-off">
                    <div class="widget">
                        <p>Sản phẩm khuyến mãi</p>
                        <div class="panel-left-body">
                            <div id="post-list-footer" class="sidebar_menu">
                                <?php $sql_sale=mysqli_query($conn,"select * from hanghoa where hanghoa.sale_off != 0");
                                    if($sql_sale){
                                        while($dong_sale=mysqli_fetch_array($sql_sale)){ 
                                ?>
                                <div class="spost clearfix">
                                    <div class="entry-image">
                                        <a href="index.php?xem=chitietsp&id=<?php echo $dong_sale['mshh'] ?>" title="">
                                            <img src="admincp/modules/quanlyhh/uploads/<?php echo $dong_sale['hinhanh'] ?>" >
                                        </a>
                                    </div>
                                    <div class="entry-c" style="width:194px;">
                                        <div class="entry-title">
                                            <a class="ws-nw overflow ellipsis" href="index.php?xem=chitietsp&id=<?php echo $dong_sale['mshh'] ?>" title=""><?php echo $dong_sale['tenhh'] ?></a>
                                        </div>
                                        <ul class="entry-meta">
                                            <li class="color">
                                                <ins><?php echo number_format($dong_sale['giagoc']-$dong_sale['giagoc']*$dong_sale['sale_off']/100).'đ' ?></ins>
                                                <del><?php echo number_format($dong_sale['giagoc']).'đ'?></del>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <?php 
                                        }
                                    } 
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 product-content">
                <div class="product-wrap">
                    <div class="collection__title">
                        <h1><span>
                            <?php 
                                $sql_type=mysqli_query($conn,"select * from nhomhanghoa where nhomhanghoa.manhom='$id' ");
                                $row = mysqli_fetch_array($sql_type);
                                echo $row['tennhom']; 
                            ?>
                        </span></h1>
                        <div id="sort-by" class="hidden-xs">
                            <label class="left hidden-xs" for="sort-select">Sắp xếp theo: </label>
                            <form class="form-inline form-viewpro">
                                <div class="form-group">
                                    <select id="sortControl" class="form-control input-sm" onchange="sortby(this.value)">
                                        <option value="number_buy-desc">Bán chạy nhất</option>
                                        <option value="name-asc">A → Z</option>
                                        <option value="name-desc">Z → A</option>
                                        <option value="price-asc">Giá tăng dần</option>
                                        <option value="price-desc">Giá giảm dần</option>
                                        <option value="created-desc">Hàng mới nhất</option>
                                        <option value="created-asc">Hàng cũ nhất</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="collection-filter" id="list-product">
                            <div class="category-products clearfix">
                                <div class="products-grid clearfix">
                                    <?php 
                                        if(isset($_GET['trang'])){
                                            $trang=$_GET['trang'];
                                        }else{
                                            $trang = "";
                                        }if($trang=='' || $trang==1){
                                            $trang1 = 0;
                                        }else{
                                            $trang1 = ($trang*8)-8;
                                        }
                                        $sql_product=mysqli_query($conn,"select * from hanghoa where hanghoa.manhom='$id' limit $trang1,8");
                                        if($sql_product){ 
                                            while($dong=mysqli_fetch_array($sql_product)){
                                    ?>
                                    <div class="col-md-3 col-lg-3 col-xs-6 col-6">
                                        <div class="product-lt">
                                            <div class="lt-product-group-image">
                                                <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh']?>" title="Loa Bluetooth Xiaomi Mi Basic 2 Chính hãng">
                                                    <img class="img-p" src="admincp/modules/quanlyhh/uploads/<?php echo $dong['hinhanh'] ?>" alt="" />
                                                </a>
                                                <?php 
                                                if($dong['sale_off'] != 0){
                                                    echo '<div class="giam-percent">
                                                        <span class="text-giam-percent">Giảm -'.$dong['sale_off'].'%</span>
                                                        </div>';
                                                }
                                                ?>
                                            </div>

                                            <div class="lt-product-group-info">
                                                <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh'] ?>" title="<?php echo $dong['tenhh']?>">
                                                    <h3><?php echo $dong['tenhh'] ?></h3>
                                                </a>
                                                <div class="price-box">
                                                    <?php if($dong['sale_off'] == 0){ ?>
                                                        <p class="special-price">
                                                            <span class="price"><?php echo number_format($dong['giagoc']).' đ'?></span>
                                                        </p>
                                                    <?php }else{ ?>
                                                        <p class="old-price">
                                                            <span class="price" style="color: #ccc"><?php echo number_format($dong['giagoc']).' đ' ?></span>
                                                        </p>
                                                        <p class="special-price">
                                                            <span class="price"><?php echo number_format($dong['giagoc']-($dong['giagoc']*$dong['sale_off']/100)).' đ' ?></span>
                                                        </p>
                                                    <?php }?>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php }}?>
                                </div>
                            </div>
                            <div class="text-center pull-right">
                                <ul class="pagination">
                                    <?php 
                                        $sql_trang = mysqli_query($conn,"select * from hanghoa where manhom = '$id'");
                                        $count = mysqli_num_rows($sql_trang);
                                        $a = ceil($count/8);
                                        $b=1;
                                        echo '
                                        <li class="hidden-xs"><a href="index.php?xem=loaisp&id='.$id.'&trang='.($b).'">Trang đầu</a></li>
                                        <li><a href="#">Trước</a></li>';
                                        for($b ; $b <= $a; $b++){
                                            if($trang==$b){
                                                echo'
                                                <li class="active" href="index.php?xem=loaisp&id='.$id.'&trang='.$b.'">
                                                    <a>'.$b.'</a>
                                                    </li>';
                                            }else{
                                                echo '<li><a href="index.php?xem=loaisp&id='.$id.'&trang='.$b.'">'.$b.'</a></li>';
                                            }
                                        }
                                        echo '
                                        <li><a href="index.php?xem=loaisp&id='.$id.'&trang='.($b-1).'">Sau</a></li>
                                        <li class="hidden-xs"><a href="index.php?xem=loaisp&id='.$id.'&trang='.($b-1).'">Trang cuối</a></li>';
                                        ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
