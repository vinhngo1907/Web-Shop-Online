<?php
    if(isset($_GET['trang'])){
      $trang=$_GET['trang'];
    }else{
      $trang='';
    }if($trang=='' || $trang=='1'){
      $trang1=0;
    }else{
      $trang1=($trang*10)-10;
    }
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $sql="select * from nhomhanghoa order by manhom desc limit $trang1,10";
    $run=mysqli_query($conn,$sql);
?>
<script type="text/javascript">
  function EditFile($id){
    window.location.href="index.php?quanly=quanlynhomhh&ac=sua&id="+$id;
  }
  function DeleteFile($id){
    if(confirm("Are you sure ?"))
      window.location.href="modules/quanlynhomhh/xuly.php?id="+$id;
  }
</script>
  <div class="content-wrapper" style="min-height: 632px;">
    <section class="content-header">
        <h1><i class="glyphicon glyphicon-cd "></i> Danh Sách Nhóm Hàng Hóa</h1>
        <div class="breadcrumb">
            <a class="btn btn-primary btn-sm" rol="button" href="index.php?quanly=quanlynhomhh&ac=them">
                <span class="glyphicon glyphicon-plus"></span>Thêm mới
            </a>
            <a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhh&amp;ac=trash" role="button">
              <span class="glyphicon glyphicon-trash"></span> Thùng rác(0)
            </a>
        </div>
    </section>
    <section class="content" style="margin-right: auto; margin-left:auto;">
      <div class="row">
        <div class="col-md-12">
          <div class="box" id="view">
            <!-- <div class="box-header with-border"> -->
              <div class="box-body">
                <div class="row" style="padding-left:0px; margin-left:0px;">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" style="width:100%;text-align: center;">
                      <thead >
                        <tr>
                          <th class="text-center">ID</th>
                          <th class="text-center">Tên nhóm</th>
                          <th class="text-center">Trạng thái</th>
                          <th class="text-center">Ngày tạo</th>
                          <th colspan="2" class="text-center">Thao tác</th>
                        </tr>
                      </thead>
                      <?php
                        if($run){
                        $i=1;
                        while($dong=mysqli_fetch_array($run)){
                      ?>
                      <tbody>
                        <tr>
                          <td class="text-center "><?php echo $dong['manhom'] ?></td>
                          <td><?php echo $dong['tennhom'] ?></td>
                          <td class="text-center">
                            <?php 
                              if( $dong['status']==1) echo'<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>';
                              else{echo'<span class="glyphicon glyphicon-remove-circle maudo"></span>';} 
                              ?>
                          </td>
                          <td class="text-center"><?php echo $dong['created'] ?></td>
                          <td><div align="center">
                            <a class="btn btn-success btn-xs" onclick="EditFile(<?php echo $dong['manhom']?>)">
                              <span class="glyphicon glyphicon-edit"></span>Sửa
                              </a></div>
                          </td>
                          <td>
                            <div align="center">
                              <a onclick="DeleteFile(<?php echo $dong['manhom']?>)" class="btn btn-danger btn-xs">
                              <span class="glyphicon glyphicon-trash"></span>Xóa</a>
                              </div>
                          </td>
                        </tr>
                      </tbody>
                      <?php
                        $i++;
                        }
                      }
                      ?>
                    </table>
                  </div>
                  <!-- <div class="row ">
                    <div class="col-md-12 text-center ">
                      <ul class="pagination ">
                        <li class="hidden-xs">
                          <a href="index.php?quanly=quanlynhomhh&ac=lietke&trang=1" aria-label="Previous"><span aria-hidden="true">Trang đầu</span></a>
                        </li>
                        <li><a href="#" aria-label="Previous"><span aria-hidden="true">Trước</span></a></li>
                      <?php
                        $sql_trang=mysqli_query($conn,"select * from nhomhanghoa");
                        $count_trang=mysqli_num_rows($sql_trang);
                        $a=ceil($count_trang/10);
                        for($b=1;$b<=$a;$b++){
                          if($trang==$b){
                            echo'<li class="active"><a href="index.php?quanly=quanlynhomhh&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
                          }
                          else{
                            echo'<li><a href="index.php?quanly=quanlynhomhh&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
                          }
                        }
                      ?>
                        <li><a href="#" aria-label="Previous"><span aria-hidden="true">Sau</span></a></li>
                        <li class="hidden-xs">
                          <a href="#" aria-label="Next"><span aria-hidden="true">Trang cuối</span></a>
                        </li>
                      </ul>
                    </div>
                  </div> -->
                </div>
              </div>
            <!-- </div> -->
          </div>
        </div>
      </div>
    </section>
  </div>