<?php
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$id=$_GET['id'];
    $tennhacc=$_POST['tennhacc'];
	$keyword=$_POST['keyword'];
    $code=$_POST['code'];
	$status=$_POST['status'];
	if(isset($_POST['them'])){
        $sql_them="insert into nhacungcap(tennhacc,keyword,code,status) values('$tennhacc','$keyword','$code','$status')";
		mysqli_query($conn,$sql_them);
		header('location:../../index.php?quanly=nhacungcap&ac=lietke');
	}elseif(isset($_POST['sua'])){
		$sql_sua="update nhacungcap set tennhacc='$tennhacc',keyword='$keyword',status='$status'where idnhacc='$_GET[id]' ";	
		mysqli_query($conn,$sql_sua);
	
		header('location:../../index.php?quanly=nhacungcap&ac=lietke');
	}else{
		$sql_xoa="delete from nhacungcap where idnhacc='$id'";
		mysqli_query($conn,$sql_xoa);
		header('location:../../index.php?quanly=nhacungcap&ac=lietke');
	}
?>