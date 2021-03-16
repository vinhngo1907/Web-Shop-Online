<?php
    include('../config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $id=$_GET['id'];
    $tenslider=$_POST['tenslider'];
    $status=$_POST['status'];
    $hinh=$_FILES['hinh']['name'];
    $hinh_tmp=$_FILES['hinh']['tmp_name'];
    move_uploaded_file($hinh_tmp,'uploads/'.$hinh);
    if(isset($_POST['them'])){
        $sql_them="insert into slider(tenslider,hinh,status) values('$tenslider','$hinh','$status')";
        mysqli_query($conn,$sql_them);
        header('location:../../index.php?quanly=giaodien&ac=lietke');
    }elseif(isset($_POST['sua'])){
        if($sliders!=''){
            $sql_sua="update slider set tenslider='$tenslider',hinh='$hinh',status='$status'  where idslider='$id'";
        }else{
            $sql_sua="update slider set tenslider='$tenslider',status='$status' where idslider='$id'";
        }
        mysqli_query($conn,$sql_sua);
        header('location:../../index.php?quanly=giaodien&ac=lietke');
    }else{
        $sql_xoa="delete from slider where idslider='$id'";
        mysqli_query($conn,$sql_xoa);
        header('location:../../index.php?quanly=giaodien&ac=lietke');
    }
?>