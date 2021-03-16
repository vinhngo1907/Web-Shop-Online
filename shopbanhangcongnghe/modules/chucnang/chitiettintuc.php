<?php 
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$sql=mysqli_query($conn,"select * from tintuc where mstt='$_GET[id]'");
	if($sql)
		$dong=mysqli_fetch_array($sql);
?>
<section id="content">
	<div class="row wraper">
		<div class="banner-product">
			<div class="container">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<img src="admincp/images/sp.png">
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
		            		$sql_news=mysqli_query($conn,"select * from tintuc order by mstt asc");
		            		if($sql_news){
		            			while($rows=mysqli_fetch_array($sql_news)){
		            	?>
		                <div class="spost clearfix">
		                    <div class="entry-image e-img">
		                        <a href="index.php?xem=chitiettintuc&id=<?php echo $rows['mstt'] ?>" class="nobg a-circle">
		                            <!-- <img class="admincp/modules/tintuc/uploads/<?php echo $rows['img'] ?>" alt="Mua phụ kiện theo Combo giảm đến 30%" /> -->
		                            <img class="img-circle-custom" src="admincp/modules/tintuc/uploads/<?php echo $rows['img'] ?>" alt="Mua phụ kiện theo Combo giảm đến 30%" />
		                        </a>
		                    </div>
		                    <div class="entry-c">
		                        <div class="entry-title e-title">
		                            <h4>
		                                <a href="index.php?xem=chitiettintuc&id=<?php echo $rows['mstt'] ?>"><?php echo $rows['title'] ?></a>
		                            </h4>
		                        </div>
		                    </div>
		                </div>
		                <?php 
		                	}
		                }
		                ?>
		            </div>
		        </div>
		    </div>
		    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 product-content" id="list-content">
		        <div class="product-wrap" id="info-content">
		            <div class="content-ct">
		                <div class="fs-ne2-it clearfix" style="padding-top: 5px;">
		                    <div class="fs-ne2-it clearfix">
		                        <div class="entry-title">
		                            <h3><?php echo $dong['title'] ?></h3>
		                        </div>
		                        <ul class="entry-meta clearfix">
		                            <li><i class="fa fa-calendar" style="margin-right: 5px;"></i><?php echo $dong['created'] ?></li>
		                        </ul>
		                    </div>
		                    <div class="introtext">
		                        <p></p>
		                    </div>
		                    <div class="entry-content"><?php echo $dong['fullcontent'] ?></div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</section>
