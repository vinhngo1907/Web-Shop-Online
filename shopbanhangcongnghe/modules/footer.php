<?php 
  $conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
  $sql=mysqli_query($conn,"select * from cauhinh limit 1");
  if($sql)
    $row=mysqli_fetch_array($sql);
?>
<footer id="footer">
    <div class="news-social">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <ul class="list-unstyled social pull-right">
                  <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                  <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                  <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                  <li><a href="#"><i class="fab fa-youtube"></i></a></li>
              </ul>
          </div>
      </div>
  </div>
  <div class="top-footer">
    <div class="container">
        <div class="col-xs-12 col-sm-12 col-md-6" style="width: 620px;">
            <div class="col-xs-12 col-sm-6">
                <a href="index.php">
                    <img src="admincp/images/smart-mobi2.png" style="width: 100%;" class="img-fix f-logo" alt="smart-construction">
                </a>
                <div class="about-store"><?php echo $row['description'] ?></div>
            </div>
            <div class="col-xs-12 col-sm-6">
              <div class="f-contact">
                  <h3>Thông tin liên hệ</h3>
                  <ul class="list-unstyled">
                      <li class="clearfix">
                          <i class="fa fa-map-marker"></i>
                          <span>33 Trần Xuân Soạn, Quận 7, TPHCM</span>
                      </li>
                      <li class="clearfix">
                          <i class="fa fa-phone"></i>
                          <span>0978651616 - 0981.334455</span>
                      </li>
                      <li class="clearfix">
                          <i class="fa fa-envelope"></i>
                          <span><a href="mailto:vinhtrungngo1907@gmail.com">vinhtrungngo1907@gmail.com</a></span>
                      </li>
                  </ul>
              </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6" style="width: 310px;">
            <div class="col-xs-12 col-sm-6">
                <h3 class="footer-title">HỖ TRỢ KHÁCH HÀNG</h3>
                <ul class="list-unstyled linklists">
                    <li><a href="chinh-sach">Hướng dẫn thanh toán</a></li>          
                    <li><a href="chinh-sach">Hướng dẫn đặt hàng</a></li>
                    <li><a href="dieu-khoan">Điều khoản</a></li>                   
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6">
               <!-- <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Ffacebook&tabs=timeline&width=340&height=200&small_header=false&adapt_container_width=false&hide_cover=false&show_facepile=false&appId" width="340" height="200" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe> -->
           </div>
        </div>
    </div>
  </div>
</footer>