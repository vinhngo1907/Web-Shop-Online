<?php 
  $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
  $sql_product=mysqli_query($conn,"select * from hanghoa");
  $count_product=mysqli_num_rows($sql_product);
  $sql_news=mysqli_query($conn,"select * from tintuc");
  $count_news=mysqli_num_rows($sql_news);
  $sql_clients=mysqli_query($conn,"select * from khachhang");
  $count_clients=mysqli_num_rows($sql_clients);
  $sql_orders=mysqli_query($conn,"select * from dathang");
  $count_orders=mysqli_num_rows($sql_orders);
?>

<div class="content-wrapper" style="min-height: 636px;">
  <!-- Content Header (Page header) -->
  <!-- Main content -->
  <section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row" style="padding:10px;">
      <div class="col-lg-3 col-xs-6" >
        <!-- small box -->
        <div class="small-box bg-aqua">
          <div class="inner">
            <h3><?php echo $count_product ?></h3>
            <p>Sản phẩm</p>
            <div class="icon">
              <iconify-icon data-icon="ion-bag"></iconify-icon>
              <!-- <i class="ion ion-bag"></i> -->
            </div>
          </div>
          <a href="index.php?quanly=quanlyhh&ac=lietke" class="small-box-footer">Danh sách sản phẩm</a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-green" >
          <div class="inner">
            <h3><?php echo $count_news ?></h3>
            <p>Bài viết</p>
          </div>
          <div class="icon">
            <span class="iconify" data-icon="ion:chatbox-sharp" data-inline="false"></span>
            <!-- <i class="ion ion-android-chat "></i> -->
          </div>
          <a href="index.php?quanly=tintuc&ac=lietke" class="small-box-footer">Danh sách bài viết</a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-yellow">
          <div class="inner">
            <h3><?php echo $count_clients ?></h3>
            <p>Liên hệ</p>
          </div>
          <div class="icon">
            <span class="iconify" data-icon="foundation-mail" data-inline="false"></span>
            <!-- <i class="ion ion-email"></i> -->
          </div>
          <a href="index.php?quanly=khachhang&ac=lietke" class="small-box-footer">Liên hệ khách hàng</a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-red">
          <div class="inner">
            <h3><?php echo $count_orders ?></h3>
            <p>Đơn hàng</p>
          </div>
          <div class="icon">
            <span class="iconify" data-icon="ion-cube" data-inline="false"></span>
            <!-- <i class="ion ion-cube"></i> -->
          </div>
          <a href="index.php?quanly=hoadon&ac=lietke" class="small-box-footer">Danh sách đơn hàng</a>
        </div>
      </div>
      <!-- ./col -->
    </div>
    <!-- /.row -->
  </section>
  <section class="content" >
    <div class="row" style="padding:10px;">
      <!-- /.col (LEFT) -->
      <div class="col-md-12">
        <!-- LINE CHART -->
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Bán hàng &amp; Doanh thu</h3>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
              </button>
              <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <div class="box-body">
    <div class="chart">
        <div id="chart_div" style="width: 100%; height: 250px;">
            <div style="position: relative;">
                <div dir="ltr" style="position: relative; width: 1406px; height: 250px;">
                    <div aria-label="A chart." style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;">
                        <svg width="1406" height="250" aria-label="A chart." style="overflow: hidden;">
                            <defs id="defs">
                                <clipPath id="_ABSTRACT_RENDERER_ID_0"><rect x="141" y="48" width="1124" height="155"></rect></clipPath>
                            </defs>
                            <rect x="0" y="0" width="1406" height="250" stroke="none" stroke-width="0" fill="#ffffff"></rect>
                            <g>
                                <text text-anchor="start" x="141" y="29.25" font-family="Arial" font-size="15" font-weight="bold" stroke="none" stroke-width="0" fill="#000000">Số lượng bán ra từ 01/2019 - 12/2019</text>
                                <rect x="141" y="16.5" width="1124" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                            </g>
                            <g>
                                <rect x="1280" y="48" width="111" height="39" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                <g>
                                    <rect x="1280" y="48" width="111" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                    <g><text text-anchor="start" x="1316" y="60.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">Bán ra</text></g>
                                    <rect x="1280" y="48" width="30" height="15" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                </g>
                                <g>
                                    <rect x="1280" y="72" width="111" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                    <g><text text-anchor="start" x="1316" y="84.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">Đơn hàng</text></g>
                                    <rect x="1280" y="72" width="30" height="15" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                </g>
                            </g>
                            <g>
                                <rect x="141" y="48" width="1124" height="155" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                <g clip-path="url(http://localhost/DO-AN-TN-2019/admin#_ABSTRACT_RENDERER_ID_0)">
                                    <g>
                                        <rect x="141" y="202" width="1124" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect>
                                        <rect x="141" y="164" width="1124" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect>
                                        <rect x="141" y="125" width="1124" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect>
                                        <rect x="141" y="87" width="1124" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect>
                                        <rect x="141" y="48" width="1124" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect>
                                    </g>
                                    <g>
                                        <rect x="159" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="253" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="347" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="440" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="534" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="627" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="721" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="814" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="908" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="1002" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="1095" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="1189" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#3366cc"></rect>
                                        <rect x="189" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="282" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="376" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="470" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="563" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="657" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="750" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="844" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="937" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="1031" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="1125" y="125" width="28" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                        <rect x="1218" y="125" width="29" height="0.5" stroke="none" stroke-width="0" fill="#dc3912"></rect>
                                    </g>
                                    <g><rect x="141" y="125" width="1124" height="1" stroke="none" stroke-width="0" fill="#333333"></rect></g>
                                </g>
                                <g></g>
                                <g>
                                    <g><text text-anchor="middle" x="188.29166666666666" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">01/2020</text></g>
                                    <g><text text-anchor="middle" x="281.875" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">02/2020</text></g>
                                    <g><text text-anchor="middle" x="375.4583333333333" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">03/2020</text></g>
                                    <g><text text-anchor="middle" x="469.04166666666663" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">04/2020</text></g>
                                    <g><text text-anchor="middle" x="562.625" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">05/2020</text></g>
                                    <g><text text-anchor="middle" x="656.2083333333333" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">06/2020</text></g>
                                    <g><text text-anchor="middle" x="749.7916666666666" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">07/2020</text></g>
                                    <g><text text-anchor="middle" x="843.375" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">08/2020</text></g>
                                    <g><text text-anchor="middle" x="936.9583333333333" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">09/2020</text></g>
                                    <g><text text-anchor="middle" x="1030.5416666666665" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">10/2020</text></g>
                                    <g><text text-anchor="middle" x="1124.125" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">11/2020</text></g>
                                    <g><text text-anchor="middle" x="1217.7083333333333" y="224.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">12/2020</text></g>
                                    <g><text text-anchor="end" x="126" y="207.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#444444">-1.0</text></g>
                                    <g><text text-anchor="end" x="126" y="169.25" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#444444">-0.5</text></g>
                                    <g><text text-anchor="end" x="126" y="130.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#444444">0.0</text></g>
                                    <g><text text-anchor="end" x="126" y="92.25" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#444444">0.5</text></g>
                                    <g><text text-anchor="end" x="126" y="53.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#444444">1.0</text></g>
                                </g>
                            </g>
                            <g></g>
                        </svg>
                        <div aria-label="A tabular representation of the data in the chart." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Month</th>
                                        <th>Bán ra</th>
                                        <th>Đơn hàng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>01/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>02/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>03/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>04/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>05/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>06/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>07/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>08/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>09/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>10/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>11/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td>12/2020</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div aria-hidden="true" style="display: none; position: absolute; top: 260px; left: 1416px; white-space: nowrap; font-family: Arial; font-size: 15px;">Đơn hàng</div>
                <div></div>
            </div>
        </div>
    </div>
</div>

          <div class="box-footer">
            <div class="row">
              <div class="col-sm-4 col-xs-6">
                <div class="description-block border-right">
                  <h5 class="description-header" style="color: #e90000;">0 VNĐ</h5>
                  <span class="description-text">Tổng doanh thu</span>
                </div>
                <!-- /.description-block -->
              </div>
              <!-- /.col -->
            </div>
            <div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 1 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 2 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 3 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 4 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 5 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 6 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 7 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 8 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 9 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 10 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 11 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div><div class="col-sm-4 col-xs-6">
                <div class="description-block border-right" style="display: inline-flex;">
                  <span class="description-text">Doanh thu tháng 12 :  </span> 
                  <h5 class="description-header" style="color: #e90000;padding-left: 10px;">0 VNĐ</h5>
                </div>
                <!-- /.description-block -->
              </div>            <!-- /.row -->
          </div>
          <!-- /.box-body -->
        </div>
      </div> 
    </div></section>
    <!-- /.content -->
  </div>