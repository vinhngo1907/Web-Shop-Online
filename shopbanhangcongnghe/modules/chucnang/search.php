<?php 
    //  $sql_phone = mysql_query("select * from hanghoa where hanghoa.manhom=8 ");
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sqli_dienthoai=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%dienthoai%'"); 
    $sqli_maytinh=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%laptop%'");
    $sqli_pc=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%pc%'"); 
    $sqli_phukien=mysqli_query($conn,"select * from hieusp where hieusp.keyword like '%phukien%'"); 
    if(isset($_POST['search'])){
        $search = $_POST['search_text'];
        $sql_search=mysqli_query($conn,"select * from hanghoa where hanghoa.tenhh like '%$search%'");
        $count_search=mysqli_num_rows($sql_search);
    }
?>
<!-- <form action="" method="POST" enctype="multipart/form-data"> -->
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
                        <div class="widget" style="margin: 0px; min-height: 0px;">
                            <p>Danh mục sản phẩm</p>
                        </div>
                        <ul class="main-ul">
                            <li><a href="index.php?xem=dienthoai" title=" Điện thoại">Điện thoại<i class="fa fa-angle-right pull-right" aria-hidden="true"></i></a>
                                <ul class="sub">
                                <?php if($sql_dienthoai){
                                    while($dong_dienthoai=mysqli_fetch_array($sql_dienthoai)){
                                    ?> 
                                    <li><a href="san-pham/samsung " title=""><?php echo $dong_dienthoai['tenhieusp'] ?></a></li>
                                    <?php }}?>
                                </ul>
                            </li>
                            <li><a href="san-pham/laptop " title=" Laptop">Laptop<i class="fa fa-angle-right pull-right" aria-hidden="true"></i></a>
                                <ul class="sub">
                                <?php if($sql_maytinh){
                                    while($dong_maytinh=mysqli_fetch_array($sql_maytinh)){
                                    ?>    
                                <li><a href="<?php echo $dong_maytinh['idhieusp'] ?>" title=""><?php echo $dong_maytinh['tenhieusp'] ?></a></li>
                                    <?php }} ?>   
                                </ul>
                            </li>
                            <li><a href="san-pham/phu-kien " title=" Phụ kiện">Phụ kiện</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 products-sale-off">
                        <div class="widget">
                            <p>Sản phẩm khuyến mãi</p>
                            <div class="panel-left-body">
                                <div id="post-list-footer" class="sidebar_menu">
                                    <?php $sql_sale=mysqli_query($conn,"select * from hanghoa");
                                    if($sql_sale){
                                        while($dong_sale=mysqli_fetch_array($sql_sale)){ ?>
                                    <div class="spost clearfix">
                                        <div class="entry-image">
                                            <a href="index.php?xem=chitietsp&id=<?php echo $dong_sale['mshh'] ?>" title="">
                                                <img src="admincp/modules/quanlyhh/uploads/<?php echo $dong_sale['hinhanh'] ?>">
                                            </a>
                                        </div>
                                        <div class="entry-c" style="width:194px;">
                                            <div class="entry-title">
                                                <a class="ws-nw overflow ellipsis" href="<?php echo $dong_sale['mshh'] ?>" title=""><?php echo $dong_sale['tenhh'] ?></a>
                                            </div>
                                            <ul class="entry-meta">
                                                <li class="color">
                                                    <ins><?php echo number_format($dong_sale['giagoc']-$dong_sale['giagoc']*$dong_sale['sale_off']/100).'đ' ?></ins>
                                                    <del><?php echo number_format($dong_sale['giagoc']).'đ'?></del>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <?php }} ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 product-content">
                    <div class="product-wrap">
                        <div class="collection__title">
                             <?php echo '<h3>Tìm được '.$count_search.' kết quả với từ khóa : <span style="color: red;">'.$search.'</span></h3>'?>
                            <div class="collection-filter" id="list-product">
                                <div class="category-products clearfix">
                                    <div class="products-grid clearfix">
                                        <?php if( $count_search== 0){ echo'<script>alert("Không tìm thấy kết quả"); </script>';?>
                                        <?php }else{ while($dong_search=mysqli_fetch_array($sql_search)){?>
                                        <div class="col-md-3 col-lg-3 col-xs-6 col-6">
                                            <div class="product-lt">
                                                <div class="lt-product-group-image">
                                                    <a href="index.php?xem=chitietsp&id=<?php echo $dong_search['mshh'] ?>" title="">
                                                        <img class="img-p" src="admincp/modules/quanlyhh/uploads/<?php echo $dong_search['hinhanh'] ?>" alt="">
                                                    </a>
                                                    <?php if($dong_search['sale_off'] == 0){ ?>
                                                    <?php }else{?>
                                                        <div class="giam-percent">
                                                            <span class="text-giam-percent"><?php echo 'Giảm '.$dong_search['sale_off'].'%'; ?></span>
                                                        </div>
                                                    <?php }?>
                                                </div>
                                                <div class="lt-product-group-info">
                                                    <a href="index.php?xem=chitietsp&id=<?php echo $dong_search['mshh'] ?>" title="">
                                                        <h3><?php echo $dong_search['tenhh'] ?></h3>
                                                    </a>
                                                    <div class="price-box">
                                                        <?php if($dong_search['sale_off'] == 0){ ?>
                                                        <p class="special-price">
                                                            <span class="price"><?php echo number_format($dong_search['giagoc']).' đ' ?></span>
                                                        </p>
                                                        <?php }else{ ?>
                                                        <p class="old-price">
                                                            <span class="price" style="color: #ccc"><?php echo number_format($dong_search['giagoc']).' đ' ?></span>
                                                        </p>
                                                        <p class="special-price">
                                                            <span class="price"><?php echo number_format($dong_search['giagoc']-($dong_search['giagoc']*$dong_search['sale_off']/100)).' đ' ?></span>
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
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- </form> -->
