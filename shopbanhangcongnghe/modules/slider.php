<section id="menu-slider">
    <div class="slider">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 list-menu pull-left" >
                <img style="width: 100%; height: 160px;" src="admincp/images/Right-banner.png">
                <img style="width: 100%; height: 160px;margin-top:7px;" src="admincp/images/banner2.png">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 slider-main pull-left" >
                <!-- <div class="owl-carousel-slider owl-carousel owl-theme owl-loaded owl-drag">
                    <div class="owl-stage-outer">
                        <div class="owl-stage" style="left: -2595px; width: 6055px;">
                            <div class="owl-item" style="width: 855px; margin-right: 10px;">
                                <div class="item"><img src="admincp/modules/giaodien/uploads/<?php echo $dong['hinh'] ?>" height="370"></div>
                            </div>
                            
                        </div>
                    </div>
                </div> -->
                <section class="slider" >
                    <div class="flexslider">
                        <ul class="slides" >
                        <?php 
                        $conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
                        $sql=mysqli_query($conn,"select * from slider order by idslider asc");
                        if($sql){
                            while($dong=mysqli_fetch_array($sql)){
                                if($dong['status']==1){
                        ?>
                            <li>
                                <img src="admincp/modules/giaodien/uploads/<?php echo $dong['hinh'] ?>" height="370">
                            </li>
                        <?php 
                            }
                        }}
                        ?>
                        </ul>
                    </div>
                </section>
            </div>
            <!-- jQuery -->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
            <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>

                <!-- FlexSlider -->
            <script defer src="style/js/jquery.flexslider.js"></script>

            <script type="text/javascript">
                $(function(){
                    SyntaxHighlighter.all();
                });
                $(window).load(function(){
                    $('.flexslider').flexslider({
                        animation: "slide",
                        controlNav:false,
                    });
                });
            </script>
        </div>
    </div>
    <?php 
        // include('sanpham/khuyenmai.php');
        // include('sanpham/banchay.php');
    ?>
</section>

