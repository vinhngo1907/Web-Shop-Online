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
  $sql="select * from hieusp order by idhieusp desc limit $trang1,10";
	$run=mysqli_query($conn,$sql);
?>
<script type="text/javascript">
  function DeleteFile(id){
    if(confirm("Are you sure ?")){
      window.location.href="modules/quanlyhieusp/xuly.php?id="+id;
    }
  }
  function EditFile(id){
    window.location.href="index.php?quanly=quanlyhieusp&ac=sua&id="+id;
  }
</script>
<div class="content-wrapper">
  <section class="content-header">
    <h1><i class="glyphicon glyphicon-cd"></i> Danh Sách Nhà Sản Xuất</h1>
    <div class="breadcrumb">
      <a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhieusp&ac=them" role="button">
        <span class="glyphicon glyphicon-plus"></span> Thêm mới
      </a>
      <a class="btn btn-primary btn-sm" href="index.php?quanly=quanlyhieusp&ac=xoa" role="button">
        <span class="glyphicon glyphicon-trash"></span> Thùng rác
      </a>
    </div>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box" id="view">
          <div class="box-header with-border">
            <div class="box-body">
              <div class="row" style="padding-left:0px; margin-left:0px;">
                <div class="table-responsive">
                  <table class="table table-hover table-bordered" border="1" style="width:100%;">
                    <thead>
                      <tr>
                      <th>ID</th>
                      <th class="text-center">Logo</th>
                      <th class="text-center">Tên nhà sản xuất</th>
                      <th class="tinhtrang">Key Word</th>
                      <th class="text-center">Tình trạng</th>
                      <th colspan="2"><div align="center">Quản lý</div></th>
                    </tr>
                    </thead>
                    <?php
                      if($run){
                      $i=1;
                      while($dong=mysqli_fetch_array($run)){
                    ?>
                    <tbody>
                      <tr>
                        <td><?php echo $i; ?></td>
                        <th class="text-center"><img src="modules/quanlyhieusp/uploads/<?php echo $dong['logo'] ?>"/></th>
                        <td class="text-center"><?php echo $dong['tenhieusp'] ?></td>
                        <td><?php echo $dong['keyword'] ?></td>
                        <td class="text-center"><?php if($dong['tinhtrang']==1)
                        {
                          // echo"Xuất bản"; 
                          echo '<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>';
                        }else echo '<span class="glyphicon glyphicon-remove-circle maudo"></span>'; ?></td>
                        <td><div align="center">
                          <a onclick="EditFile(<?php echo $dong['idhieusp'] ?>)" class="btn btn-success btn-xs">
                            <span class="glyphicon glyphicon-edit"></span>Sửa
                            </a></div>
                          </td>
                        <td>
                          <div align="center">
                            <a onclick="DeleteFile(<?php echo $dong['idhieusp']?>)" class="btn btn-danger btn-xs">
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
                <div class="row ">
                  <div class="col-md-12 text-center ">
                    <ul class="pagination ">
                      <li class="hidden-xs">
                        <a href="index.php?quanly=quanlynhomhh&ac=lietke&trang=1" aria-label="Previous"><span aria-hidden="true">Trang đầu</span></a>
                      </li>
                      <li><a href="#" aria-label="Previous"><span aria-hidden="true">Trước</span></a></li>
                      <?php
                        $sql_trang=mysqli_query($conn,"select * from hieusp");
                        $count_trang=mysqli_num_rows($sql_trang);
                        $a=ceil($count_trang/10);
                        for($b=1;$b<=$a;$b++){
                          if($trang==$b){
                            echo'<li class="active"><a href="index.php?quanly=quanlyhieusp&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
                          }else{
                            echo'<li><a href="index.php?quanly=quanlyhieusp&ac=lietke&trang='.$b.'">'.$b.'</a></li>';
                          }
                        }
                      ?>
                      <li ><a href="#" aria-label="Previous"><span aria-hidden="true">Sau</span></a></li>
                      <li class="hidden-xs">
                        <a href="#" aria-label="Next"><span aria-hidden="true">Trang cuối</span></a>
                      </li>
                    </ul>
                  </div>
							  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>