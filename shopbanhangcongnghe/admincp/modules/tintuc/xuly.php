<?php 
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$id = $_GET['id'];
	$title=$_POST['title'];
	$introtext = $_POST['introtext'];
	$fullcontent = $_POST['fullcontent'];
	$status=$_POST['status'];
	$img=$_FILES['img']['name'];
	$img_tmp=$_FILES['img']['tmp_name'];
	move_uploaded_file($img_tmp,'uploads/'.$img);
	if(isset($_POST['them'])){
        $sql_them="insert into tintuc(title,introtext,fullcontent,status,img) values('$title','$introtext','$fullcontent','$status','$img')";
		mysqli_query($conn,$sql_them);
		header('location:../../index.php?quanly=tintuc&ac=lietke');
	}elseif(isset($_POST['sua'])){
		if($hinhanh!=""){
			$sql_sua="update tintuc set title='$title',introtext='$introtext',fullcontent='$fullcontent', status='$status', img='$img' where mstt='$_GET[id]' ";	
		}else{
			$sql_sua="update tintuc set title='$title',introtext='$introtext',fullcontent='$fullcontent', status='$status' where mstt='$_GET[id]' ";	
		}
		mysqli_query($conn,$sql_sua);
		header('location:../../index.php?quanly=tintuc&ac=lietke');
	}else{
		$sql_xoa="delete from tintuc where mstt='$id'";
		mysqli_query($conn,$sql_xoa);
		header('location:../../index.php?quanly=tintuc&ac=lietke');
	}
?>