<?php
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$id=$_GET['id'];
    $code=$_POST['code'];
    $discount=$_POST['discount'];
	$limit_number=$_POST['limit_number'];
    $payment_limit=$_POST['payment_limit'];
	$expiration_date=$_POST['expiration_date'];
    $description=$_POST['description'];
    $status=$_POST['status'];
	if(isset($_POST['them'])){
        $sql_them="insert into khuyenmai(code,discount,limit_number,payment_limit,expiration_date,description,status) values('$code','$discount','$limit_number','$payment_limit','$expiration_date','$description','$status')";
		mysqli_query($conn,$sql_them);
		header('location:../../index.php?quanly=giamgia&ac=lietke');
	}elseif(isset($_POST['sua'])){
		$sql_sua="update khuyenmai set code='$code',discount='$discount',limit_number='$limit_number',payment_limit='$payment_limit',expiration_date='$expiration_date',description='$description',status='$status' where id='$_GET[id]' ";	
		mysqli_query($conn,$sql_sua);
		header('location:../../index.php?quanly=giamgia&ac=lietke&id='.$id);
	}else{
		$sql_xoa="delete from khuyenmai where id='$id'";
		mysqli_query($conn,$sql_xoa);
		header('location:../../index.php?quanly=giamgia&ac=lietke');
	}
?>