<?php 
	include('../config.php');
	$conn = mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);

	if(isset($_GET['ac']) && $_GET['ac']=='xoa'){
        $sql_xoa = "delete from khachhang where mskh = '$_GET[id]'";
        mysqli_query($conn,$sql_xoa);
        header('location:../../index.php?quanly=khachhang&ac=lietke');
    }
?>