<?php
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$id=$_GET['id'];
	$trangthai = 'Đang giao hàng';
	if(isset($_POST['save'])){

	}
	// else if(isset($_POST['update'])){
	// 	$sql_update=mysqli_query($conn,"update dathang set trangthai = '$trangthai' where sodondh = '$id'");
 //        header('location:../../index.php?quanly=hoadon&ac=lietke');
	// }
	else{
		$sql_xoa=mysqli_query($conn,"delete from dathang where sodondh = '$id'");
		header('location:../../index.php?quanly=hoadon&ac=lietke');
	}
?>