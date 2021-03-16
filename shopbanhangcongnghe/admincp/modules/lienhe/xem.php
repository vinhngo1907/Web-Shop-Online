<?php 
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql=mysqli_query($conn,"select * from lienhe where id_lienhe = '$_GET[id]'");
    if($sql)
        $dong = mysqli_fetch_array($sql);
?>
<form action="modules/lienhe?id=<?php echo $dong['id_lienhe'] ?>" method="POST" enctype="multipart/form-data">
    <div class="content-wrapper" style="min-height: 891px;">
    
        <section class="content-header">
            <h1><i class="glyphicon glyphicon-text-background"></i> Chi tiết</h1>
            <div class="breadcrumb">
                <a class="btn btn-primary btn-sm" href="index.php?quanly=lienhe&ac=lietke" role="button">
                    <span class="glyphicon glyphicon-remove"></span> Thoát
                </a>
            </div>
        </section>    
        
        <!-- /.content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box" id="view">
                        <div class="box-body">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label>Họ và tên <span class="maudo"></span></label>
                                    <output type="text" class="form-control" name="SDT" style="width:100%"><?php echo $dong['hoten'] ?></output>
                                    
                                </div>
                                
                                <div class="form-group">
                                    <label>Phone Number <span class="maudo"></span></label>
                                    <output type="text" class="form-control" name="phone" style="width:100%"><?php echo $dong['phone'] ?></output>
                                    
                                </div>
                                <div class="form-group">
                                    <label>Email <span class="maudo"></span></label>
                                    <output type="text" class="form-control" name="email" style="width:100%" ><?php echo $dong['email'] ?></output>
                                    
                                </div>
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <output type="text" class="form-control" name="title" style="width:100%"><?php echo $dong['title'] ?></output>

                                </div>
                                <div class="form-group">
                                    <label>Nội dung mail<span class="maudo"></span></label>
                                    <textarea rows="10" cols="20" name="content" style="width:100% height:100%" id="content" class="form-control">
                                        <?php echo $dong['content'] ?></textarea>
                                    
                                </div>
                                
                            
                        </div>
                    </div><!-- /.box -->
                </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div></section>        
    </div>
</form>