<section id="product-all" class="collection">
    <div class="banner-product">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <img src="admincp/images/sp.png" />
            </div>
        </div>
    </div>
    <div class="slider">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="list-menu pull-left col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="widget" style="margin: 0px; min-height: 0px;">
                        <p>Danh mục sản phẩm</p>
                    </div>
                    <ul class="main-ul">
                        <li>
                            <a href="san-pham/dien-thoai " title=""> SmartPhone<i class="fa fa-angle-right pull-right" aria-hidden="true"></i> </a>
                            <ul class="sub">
                                <li><a href="san-pham/samsung " title="">Lenovo</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="san-pham/dien-thoai " title=""> Laptop<i class="fa fa-angle-right pull-right" aria-hidden="true"></i> </a>
                            <ul class="sub"></ul>
                        </li>
                        <li>
                            <a href="san-pham/dien-thoai " title=""> PC-WorkStation<i class="fa fa-angle-right pull-right" aria-hidden="true"></i> </a>
                            <ul class="sub"></ul>
                        </li>
                        <li>
                            <a href="san-pham/dien-thoai " title=""> Phụ Kiện<i class="fa fa-angle-right pull-right" aria-hidden="true"></i> </a>
                            <ul class="sub"></ul>
                        </li>
                        <!-- <li><a href="san-pham/laptop " title=" Laptop">Laptop<i class="fa fa-angle-right pull-right" aria-hidden="true"></i></a>
                            <ul class="sub">
                                <li><a href="1" title="">Lenovo</a></li>
                            </ul>
                        </li>
                        <li><a href="san-pham/phu-kien " title=" Phụ kiện">Phụ kiện</a></li> -->
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
                                            <a class="ws-nw overflow ellipsis" href="index.php?xem=chitietsp&id<?php echo $dong_sale['mshh'] ?>" title=""><?php echo $dong_sale['tenhh'] ?></a>
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
                        <h1><span>Tất cả sản phẩm</span></h1>
                        <div id="sort-by" class="hidden-xs">
                            <label class="left hidden-xs" for="sort-select">Sắp xếp theo: </label>
                            <form class="form-inline form-viewpro">
                                <div class="form-group">
                                    <select id="sortControl" class="sort-by form-control input-sm" onchange="sortby(this.value)">
                                        <option value="number_buy-desc">Bán chạy nhất</option>
                                        <option value="name-asc">A → Z</option>
                                        <option value="name-desc">Z → A</option>
                                        <option value="price-asc">Giá tăng dần</option>
                                        <option value="price-desc">Giá giảm dần</option>
                                        <option value="created-desc">Hàng mới nhất</option>
                                        <option value="created-desc">Hàng cũ nhất</option>
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
                                        $sql = mysqli_query($conn,"select * from hanghoa order by mshh asc limit $trang1,8");
                                            if($sql){
                                                while($dong = mysqli_fetch_array($sql)){
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
                                                <a href="index.php?xem=chitietsp&id=<?php echo $dong['mshh'] ?>" title="Loa Bluetooth Xiaomi Mi Basic 2 Chính hãng">
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
                                    <?php 
                                        }
                                    }
                                    ?>
                                </div>

                                <div class="text-center pull-right">
                                    <ul class="pagination"> 
                                        <?php 
                                            $sql_trang = mysqli_query($conn,"select * from hanghoa");
                                            $count = mysqli_num_rows($sql_trang);
                                            $a = ceil($count/8);
                                            $b=1;
                                            $tmp=0;
                                            echo '
                                            <li class="hidden-xs"><a href="index.php?xem=sanpham&trang='.($b).'">Trang đầu</a></li>
                                            <li><a href="#">Trước</a></li>';
                                            for($b ; $b <= $a; $b++){
                                                if($trang==$b){
                                                    echo'
                                                    <li class="active" href="index.php?xem=sanpham&trang='.$b.'">
                                                        <a>'.$b.'</a>
                                                    </li>';
                                                    $tmp=$b+1;
                                                }else{
                                                    echo '<li><a href="index.php?xem=sanpham&trang='.$b.'">'.$b.'</a></li>';
                                                }
                                            }
                                            echo '
                                            <li><a href="index.php?xem=sanpham&trang='.($tmp).'">Sau</a></li>
                                            <li class="hidden-xs"><a href="index.php?xem=sanpham&trang='.($b-1).'">Trang cuối</a></li>';
                                        ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- </div>
    </div> -->
</section>
