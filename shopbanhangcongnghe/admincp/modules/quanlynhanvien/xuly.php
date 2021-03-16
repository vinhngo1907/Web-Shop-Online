<?php
    include('../config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
    $id=$_GET['id'];
    $hotennv = $_POST['hotennv'];
    $username=$_POST['username'];
    $password=$_POST['password'];
    $role=$_POST['chucvu'];
    $status=$_POST['status'];
    $email=$_POST['email'];
    $phone=$_POST['phone'];
    $diachi=$_POST['diachi'];
    $gender=$_POST['gender'];
    $img=$_FILES['img']['name'];
    $img_tmp=$_FILES['img']['tmp_name'];
    move_uploaded_file($img_tmp,'uploads/'.$img);
    
    if(isset($_POST['them'])){
        $sql_them="insert into nhanvien(hotennv,username,password,chucvu,status,email,phone,diachi,gender,img) 
        values('$hotennv','$username','$password','$role','$status','$email','$phone','$diachi','$gender','$img')";
        mysqli_query($conn,$sql_them);
        header('location:../../index.php?quanly=quanlynhanvien&ac=lietke');
    }else if(isset($_POST['sua'])){
       if($img!=""){
         $sql_sua="update nhanvien set hotennv = '$hotennv',chucvu='$role',status='$status',diachi='$diachi',gender='$gender',img ='$img' where msnv='$_GET[id]'";
       }
       else{
         $sql_sua="update nhanvien set hotennv = '$hotennv',chucvu='$role',status='$status',diachi='$diachi',gender='$gender' where msnv='$id'";
       }
        mysqli_query($conn,$sql_sua);
        header('location:../../index.php?quanly=quanlynhanvien&ac=lietke');
    }else{
        $sql_xoa="delete from nhanvien where msnv = '$id'";
        mysqli_query($conn,$sql_xoa);
        header('location:../../index.php?quanly=quanlynhanvien&ac=lietke');
    }
?>