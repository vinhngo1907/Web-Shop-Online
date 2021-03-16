<?php
	include('../config.php');
	$conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
	if(isset($_GET['quanly'])&&$_GET['quanly']=='xoa'){
		$id=$_GET['id'];
		$sql_xoa=mysqli_query($conn,"delete from gallery where mshh='$_GET[id]'");
		header('location:../../index.php?quanly=gallery&ac=lietke&id='.$id);
	}
    // them
	if(isset($_POST['upload'])){
		$id=$_GET['id'];
		foreach($_FILES['file']['name'] as $i=>$name){
			$name=$_FILES['file']['name'][$i];
			$type=$_FILES['file']['type'][$i];
			$size=$_FILES['file']['size'][$i];
			$tmp=$_FILES['file']['tmp_name'][$i];
			$explode=explode('.',$name);
			$ext=end($explode);
			$path='uploads/';
			$path=$path.basename($explode[0].time().'.'.$ext);
			$hinhanhsp=basename($explode[0].time().'.'.$ext);
			$thongbao=array();
			if(empty($tmp)){
				echo $thongbao[] = 'Vui lòng chọn ít nhất 1 file';
			}else{
				$chophep=array('jpeg','jpg','png','gif','bmp');
				$max_size = 4000000;
				if(in_array($ext,$chophep)===false){
					echo $thongbao[] = 'File <strong>'.$name.'</strong> không hợp lệ<br>';
				}
				if($size > $max_size){
					echo $thongbao[] = 'File <strong>'.$name.'</strong> không hợp lệ<br>';
				}
			}
			if(empty($thongbao)){
				if(!file_exists('uploads')){
					mkdir('uploads',0777);
				}
				if(move_uploaded_file($tmp,$path)){
					$sql=mysqli_query($conn,"insert into gallery(mshh,hinhanhsp) values('$id','".$hinhanhsp."')");
					header('location:../../index.php?quanly=gallery&ac=lietke&id='.$id);
				}
				else{
					echo $thongbao[] = 'Uploads file <strong>'.$name.'</strong> thất bại<br>';
				}
			}
		}// kêt thúc vòng lặp foreach
	}
?>
