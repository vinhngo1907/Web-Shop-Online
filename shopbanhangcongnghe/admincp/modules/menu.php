<?php
    if(isset($_GET['quanly']) && $_GET['ac']){
        $tam=$_GET['quanly']; $tam1=$_GET['ac'];
    }else{
        $tam='';
    }if($tam=='thongke' && $tam1=='lietke'){
        include('modules/thongke/lietke.php');
    }elseif(($tam=='quanlyhieusp') && ($tam1=='them')){
        include('modules/quanlyhieusp/them.php');
    }elseif($tam=='quanlyhieusp' && $tam1=='sua'){
        include('modules/quanlyhieusp/sua.php');
    }elseif($tam=='quanlyhieusp' && $tam1=='lietke'){
        include('modules/quanlyhieusp/lietke.php');
    }elseif(($tam=='quanlynhomhh') && ($tam1=='them')){
        include('modules/quanlynhomhh/them.php');
    }elseif($tam=='quanlynhomhh' && $tam1=='sua'){
        include('modules/quanlynhomhh/sua.php');
    }elseif($tam=='quanlynhomhh' && $tam1=='lietke'){
        include('modules/quanlynhomhh/lietke.php');
    }elseif($tam=='quanlynhanvien' && $tam1=='them'){
        include('modules/quanlynhanvien/them.php');
    }elseif($tam=='quanlynhanvien' && $tam1=='lietke'){
        include('modules/quanlynhanvien/lietke.php');
    }elseif($tam=='quanlynhanvien' && $tam1=='sua'){
        include('modules/quanlynhanvien/sua.php');
    }if($tam=='quanlyhh' && $tam1=='them'){
        include('modules/quanlyhh/them.php');
    }elseif($tam=='quanlyhh' && $tam1=='lietke'){
        include('modules/quanlyhh/lietke.php');
    }elseif($tam=='quanlyhh' && $tam1=='sua'){
        include('modules/quanlyhh/sua.php');
    }elseif($tam=='quanlyhh' && $tam1=='import'){
        include('modules/quanlyhh/import.php');
    }elseif($tam=='giaodien' && $tam1=='them'){
        include('modules/giaodien/them.php');
    }elseif($tam=='giaodien' && $tam1=='sua'){
        include('modules/giaodien/sua.php');
    }elseif($tam=='giaodien' && $tam1=='lietke'){
        include('modules/giaodien/lietke.php');
    }elseif(($tam == 'gallery')&&($tam1 == 'them')){
        include('modules/gallery/them.php');
    }elseif(($tam == 'gallery')&&($tam1 == 'lietke')){
        include('modules/gallery/lietke.php');
    }elseif(($tam == 'gallery')&&($tam1 == 'sua')){
        include('modules/gallery/sua.php');
    }if(($tam == 'nhacungcap')&&($tam1 == 'them')){
        include('modules/nhacungcap/them.php');
    }elseif(($tam == 'nhacungcap')&&($tam1 == 'lietke')){
        include('modules/nhacungcap/lietke.php');
    }elseif(($tam == 'nhacungcap')&&($tam1 == 'sua')){
        include('modules/nhacungcap/sua.php');
    }if($tam=='hoadon' && ($tam1=='lietke')){
        include('modules/hoadon/lietke.php');
    }elseif($tam=='hoadon' && ($tam1=='xem')){
        include('modules/hoadon/chitiethoadon.php');
    }elseif($tam=='hoadon' && ($tam1=='recyclebin')){
        include('modules/hoadon/thungrac.php');
    }
    if($tam=='khachhang' && ($tam1=='lietke')){
        include('modules/khachhang/lietke.php');
    }else if($tam=='khachhang' && ($tam1=='xem')){
        include('modules/khachhang/xem.php');
    }if($tam=='cauhinh' && $tam1 == 'xem'){
        include('modules/cauhinh/xem.php');
    }if($tam=='tintuc' && $tam1 == 'them'){
        include('modules/tintuc/them.php');
    }elseif($tam=='tintuc' && $tam1 == 'sua'){
        include('modules/tintuc/sua.php');
    }elseif($tam=='tintuc' && $tam1 == 'lietke'){
        include('modules/tintuc/lietke.php');
    }if($tam=='lienhe' && $tam1=='xem'){
        include('modules/lienhe/xem.php');
    }elseif($tam=='lienhe' && $tam1=='lietke'){
        include('modules/lienhe/lietke.php');
    }
    if($tam=='giamgia' && $tam1=='lietke'){
        include('modules/giamgia/lietke.php');
    }elseif($tam=='giamgia' && $tam1=='them'){
        include('modules/giamgia/them.php');
    }elseif($tam=='giamgia' && $tam1=='sua'){
        include('modules/giamgia/sua.php');
    }
    if($tam=='giaodien' && $tam1=='trash'){
        include('modules/giaodien/thungrac.php');
    }
?>
 <?php
     if(isset($_GET['ac']) && $_GET['ac']=='dangxuat'){
         unset($_SESSION['dangnhap']);
         header('location:login.php');
     }
?>
<div class="clr"></div>
<aside class="main-sidebar" >
    <section class="sidebar">
        <ul class="sidebar-menu" >
            <li class="treeview">
                <a href="index.php?quanly=thongke&ac=lietke">
                    <i class="fa fa-bar-chart"></i> <span>Th???ng k??</span>
                </a>
            </li>
            <li class="header">QU???N L?? C???A H??NG</li>
            <li class="treeview">
                <a href="index.php?quanly=tintuc&ac=lietke"><i class="glyphicon glyphicon-list"></i><span>Tin t???c</span></a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=quanlyhh&ac=lietke"><i class="fa fa-leaf"></i><span>S???n ph???m</span></a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=quanlynhomhh&ac=lietke"><i class="fa fa-indent"></i><span>Nh??m h??ng h??a</span></a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=quanlyhieusp&ac=lietke">
                    <i class="fa fa-gift"></i><span>Nh?? s???n xu???t</span>
                </a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=nhacungcap&ac=lietke">
                    <i class="glyphicon glyphicon-text-background"></i><span>Nh?? cung c???p</span></a>
            </li>
            <li class="header">QU???N L?? B??N H??NG</li>
            <li class="treeview">
                <a href="index.php?quanly=giamgia&ac=lietke"><i class="fa fa-diamond"></i> <span>M?? gi???m gi??</span>
                </a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=lienhe&ac=lietke"><i class="fa fa-envelope"></i> <span>Li??n h???</span></a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=hoadon&ac=lietke"><i class="fa fa-shopping-cart"></i><span>????n h??ng</span></a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=khachhang&ac=lietke"><i class="fa fa-user"></i><span>Kh??ch h??ng</span></a>
            </li>
            <li class="treeview">
                <a href="index.php?quanly=giaodien&ac=lietke"><i class="fa fa-cogs"></i> <span>Giao di???n</span></a>
            </li>
            <li class="header">C??I ?????T</li>
            <li class="treeview" >
                <a href="#">
                    <i class="glyphicon glyphicon-cog" ></i><span>H??? th???ng</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu menu-open">
                    <li class="active">
                        <a href="index.php?quanly=cauhinh&ac=xem">
                            <i class="fa fa-cogs"></i> C???u h??nh
                        </a>
                    </li>
                    <li class="active">
                        <a href="index.php?quanly=quanlynhanvien&ac=lietke">
                            <i class="fa fa-user"></i> Nh??n vi??n
                        </a>
                    </li>
                    <!-- <li> 
                        <a href="http://localhost/DO-AN-TN-2019/admin/configuration/update">
                            <i class="fa fa-cogs"></i> C???u h??nh
                        </a>
                    </li> -->
                </ul>
            </li>
            <li><a href="index.php?ac=dangxuat"><i class="fa fa-sign-out text-red"></i> <span>Tho??t</span></a></li>
        </ul>
    </section>
<!-- /.sidebar -->
</aside>    