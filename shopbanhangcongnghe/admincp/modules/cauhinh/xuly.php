<?php 
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$mail_smtp=$_POST['mail_smtp'];
	$mail_smtp_password = $_POST['mail_smtp_password'];	
	$mail_noreply	= $_POST['mail_noreply'];
	$priceShip	=$_POST['priceShip'];
	$title	=$_POST['title'];
	$description = $_POST['description'];
	$id = $_GET['id'];
	if(isset($_POST['save'])){
		$sql_save="update cauhinh set mail_smtp='$mail_smtp', mail_smtp_password = '$mail_smtp_password', mail_noreply = '$mail_noreply', priceShip='$priceShip', title = '$title', description = '$description' where id = '$id'";
		// $sql_save="insert into cauhinh(mail_smtp,mail_smtp_password,mail_noreply,priceShip,title,description) values('$mail_smtp','$mail_smtp_password','$mail_noreply','$priceShip','$title','$description')";
		mysqli_query($conn,$sql_save);
		header('location:../../index.php?quanly=cauhinh&ac=xem');
	}
?>