<?php
	@session_start();
	include('admincp/modules/config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$name=$_SESSION['login'];	
	$mskh = $_POST['mskh'];
	$msnv = $_POST['msnv'];
	$trangthai=$_POST['trangthai'];
		$insert_cart="insert into dathang (hoten,mskh,msnv,trangthai) value ('".$name."')";
	// $insert_cart="insert into dathang(hoten,mskh,msnv,trangthai) values('$name','$mskh','$msnv','$trangthai')";
	$ketqua=mysqli_query($conn,$insert_cart);
	if($ketqua){
		for($i=0;$i<count($_SESSION['product']);$i++){
			$max=mysqli_query($conn,"select max(id) from cart");
			$row=mysqli_fetch_array($max);
				
			$cart_id=$row[0];
			$product_id=$_SESSION['product'][$i]['id'];
			$quantity=$_SESSION['product'][$i]['soluong'];
				
			$price=$_SESSION['product'][$i]['gia'];		
			$insert_cart_detail="insert into cart_detail (cart_id,product_id,quantity,price) values('".$cart_id."','".$product_id."','".$quantity."','".$price."')";
			$cart_detail=mysqli_query($conn,$insert_cart_detail);
		}	
	}	
	unset($_SESSION['product']);
	header('location:index.php?quanly=camon');
	
?>