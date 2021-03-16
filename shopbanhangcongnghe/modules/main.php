<?php
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    if(!isset($_GET['xem']) ){
        include('modules/slider.php');
        include('modules/content.php');
    }else{
        // $id = $_GET['id'];
        if(isset($_GET['xem'])){
            $tam=$_GET['xem'];
        }else{
            $tam='';
        }
        if($tam=='loaisp'){
            include('loaisp/loaisp.php');
        }
        // elseif($tam=='phukien'){
        //     include('loaisp/phukien.php');
        // }
        elseif(isset($_POST['search'])){
            include('chucnang/search.php');
        }elseif($tam=='register'){
            include('chucnang/dangky.php');
        }elseif($tam=='login'){
            include('chucnang/dangnhap.php');
        }elseif($tam=='chitietsp'){
            include('chucnang/chitietsp.php');
        }elseif($tam=='chitietloaisp'){
            include('loaisp/chitietloaisp.php');
        }elseif($tam=='thongbao'){
            include('chucnang/thongbao.php');
        }elseif($tam=='taikhoan'){
            include('chucnang/taikhoan.php');
        }elseif($tam=='giohang'){
            include('chucnang/giohang.php');
        }elseif($tam=='dathang'){
            include('chucnang/dathang.php');
        }if(isset($_POST['ac']) && $_POST['ac']=='add_to_cart'){
            include('modules/chucnang/update_cart.php');
        }if($tam=='lienhe'){
            include('modules/chucnang/lienhe.php');
        }elseif($tam=='sanpham'){
            include('modules/loaisp/sanpham.php');
        }else if($tam=='tintuc'){
            include('modules/chucnang/tintuc.php');
        }if($tam=='chitiettintuc'){
            include('modules/chucnang/chitiettintuc.php');
        }else if($tam=='camon'){
            include('modules/chucnang/camon.php');
        }else if($tam=='chitietdh'){
            include('modules/chucnang/chitietdonhang.php');
        }else if($tam=='gioithieu'){
            include ('modules/chucnang/gioithieu.php');
        }
    }
?>

<?php
    if(isset($_GET['xem']) && $_GET['xem']=='logout'){
        unset($_SESSION['login']);
        if(isset($_SESSION['product'])){
            unset($_SESSION['product']);
        }
        header('location:index.php');
    }
?>