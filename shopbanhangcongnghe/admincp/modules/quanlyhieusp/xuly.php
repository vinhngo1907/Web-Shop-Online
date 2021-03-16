<?php
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$id=$_GET['id'];
	$tenhieusp=$_POST['tenhieusp'];
	$keyword=$_POST['keyword'];
	$tinhtrang=$_POST['tinhtrang'];
	$logo=$_FILES['logo']['name'];
	
	$logo_tmp=$_FILES['logo']['tmp_name'];
	move_uploaded_file($logo_tmp,'uploads/'.$logo);
	if(isset($_POST['them'])){
		$sql_them="insert into hieusp(tenhieusp,keyword,tinhtrang,logo) values('$tenhieusp','$keyword','$tinhtrang','$logo')";
		mysqli_query($conn,$sql_them);
		header('location:../../index.php?quanly=quanlyhieusp&ac=lietke');
	}elseif(isset($_POST['sua'])){
		if($logo!=''){
			$sql_sua="update hieusp set tenhieusp= '$tenhieusp',keyword='$keyword',tinhtrang = '$tinhtrang', logo='$logo' where idhieusp='$id'";
		}
		else{
			$sql_sua="update hieusp set tenhieusp= '$tenhieusp',keyword='$keyword',tinhtrang = '$tinhtrang' where idhieusp='$id'";
		}
		mysqli_query($conn,$sql_sua);
		header('location:../../index.php?quanly=quanlyhieusp&ac=lietke');
	}else{
		$sql_xoa="delete from hieusp where idhieusp='$id'";
		mysqli_query($conn,$sql_xoa);
		header('location:../../index.php?quanly=quanlyhieusp&ac=lietke');
	}
?>