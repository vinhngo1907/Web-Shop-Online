<?php
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	$id=$_GET['id'];
    $mahh=$_POST['mahh'];
    $tenhh=$_POST['tenhh'];
	$giaban=$_POST['giaban'];
    $giagoc=$_POST['giagoc'];
	$soluonghang=$_POST['soluonghang'];
    $sale_off=$_POST['sale_off'];
    $nhasx=$_POST['idhieusp'];
    $nhomhh=$_POST['manhom'];
    $motahh=$_POST['motahh'];
	$noidung=$_POST['noidung'];
	$status=$_POST['trangthai'];
	$hinhanh=$_FILES['hinhanh']['name'];
	$hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];
	move_uploaded_file($hinhanh_tmp,'uploads/'.$hinhanh);
	if(isset($_POST['them'])){
        $sql_them="insert into hanghoa(mahh,tenhh,giaban,giagoc,soluonghang,sale_off,idhieusp,manhom,motahh,noidung,trangthai,hinhanh) values('$mahh','$tenhh','$giaban','$giagoc','$soluonghang','$sale_off','$nhasx','$nhomhh','$motahh','$noidung','$status','$hinhanh')";
		mysqli_query($conn,$sql_them);
		header('location:../../index.php?quanly=quanlyhh&ac=lietke');
	}elseif(isset($_POST['sua'])){
		if($hinhanh!=""){
			$sql_sua="update hanghoa set tenhh='$tenhh',giaban='$giaban',giagoc='$giagoc',sale_off='$sale_off',idhieusp='$nhasx',manhom='$nhomhh',motahh='$motahh',noidung='$noidung',trangthai='$status',hinhanh='$hinhanh'where mshh='$_GET[id]' ";	
		}else{
			$sql_sua="update hanghoa set tenhh='$tenhh', giaban='$giaban', giagoc='$giagoc',sale_off='$sale_off',idhieusp='$nhasx',manhom='$nhomhh',motahh='$motahh',trangthai='$status',noidung='$noidung' where mshh='$_GET[id]' ";	
		}
		mysqli_query($conn,$sql_sua);
		header('location:../../index.php?quanly=quanlyhh&ac=lietke&id='.$id);
	}else{
		$sql_xoa="delete from hanghoa where mshh='$id'";
		mysqli_query($conn,$sql_xoa);
		header('location:../../index.php?quanly=quanlyhh&ac=lietke');
	}
?>
