<?php
    include('../config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $id=$_GET['id'];
    $tennhom=$_POST['tennhom'];
    $status=$_POST['status'];
    if(isset($_POST['them'])){
        $sql_them="insert into nhomhanghoa(tennhom,status) values('$tennhom','$status')";
        mysqli_query($conn,$sql_them);
        header('location:../../index.php?quanly=quanlynhomhh&ac=lietke');
    }elseif(isset($_POST['sua'])){
        $sql_sua="update nhomhanghoa set tennhom='$tennhom', status=$status where manhom='$id'";
        mysqli_query($conn,$sql_sua);
        header('location:../../index.php?quanly=quanlynhomhh&ac=lietke');
    }
    // else{
    //     $sql_xoa="delete from nhomhanghoa where manhom ='$_GET[id]'";
    //     mysqli_query($conn,$sql_xoa);
    //     header('location:../../index.php?quanly=quanlynhomhh&ac=lietke');
    // }
?>