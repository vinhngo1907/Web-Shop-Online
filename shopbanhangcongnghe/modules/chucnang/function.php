<?php
    function get_customer($username,$password){
        include('admincp/modules/config.php');
        $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
        // $sql="select * from khachhang where username='$username' and password='$password'";
        $sql=mysqli_query($conn,"select * from khachhang where username='$username' and password='$password' limit 1");
        $nums = mysqli_num_rows($sql);
        if($nums > 0){
            $rows=mysqli_fetch_array($sql);
            if($rows['role']==3){
                $_SESSION['login']=$username;
                header('location:index.php?xem=taikhoan');
            }else{
                echo '<script>alert("Just only customer can login in this page!")</script>';
            }
        }else{
            echo '<script>alert("Login failed. Please try again !")</script>';
        }
    }
    function get_new_customer($hotenkh,$username,$password,$email,$dienthoai,$diachi){
        include('admincp/modules/config.php');
        
        $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
        $sql=mysqli_query($conn,"insert into khachhang(hotenkh,username,password,email,dienthoai,diachi) values('$hotenkh','$username','$password','$email','$dienthoai','$diachi')");
        if($sql){
            $to = $email;
            $discount = strtoupper(generateRandomString());
            $subject = "Hệ thống ShopBanhangCongNghe - Quà thành viên mới";
            // the message
            $message = "Bạn đã trở thành thành viên mới của cửa hàng chúng tôi, Cửa hàng tặng bạn 1 mã giảm giá giảm 100.000 đ : $discount, Mã này có giá trị tới ngày 2020-07-25 Hãy sử dụng tài khoản để mua hàng để tích lũy nhận thêm nhiều ưu đãi !!!!";
            // use wordwrap() if lines are longer than 70 characters
            // $message = wordwrap($msg,70);
            $headers = "From: vinhtrungngo1907@gmail.com.vn";
            // send email 
            if(mail($to,$subject,$message,$headers)==true){
                header('location:index.php?xem=thongbao');
            }else{
                echo'<script>alert("Đăng ký thất bại, vui lòng thửi lại !")</script>';
            }
        }else{
            echo'<script>alert("Đăng ký thất bại, vui lòng thửi lại !")</script>';
        }
    }
    function get_contact($hoten,$email,$phone,$title,$content){
        include('admincp/modules/config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
        $sql = mysqli_query($conn,"INSERT INTO lienhe(hoten,email,phone,title,content) values('$hoten','$email','$phone','$title','$content')");
        if($sql){
            $_POST['status'] = 1;
            echo '<script>alert("Tin nhắn của bạn đã gửi đi thành công !")</script>';
        }else{
            echo'<script>alert("Error! Please try again !")</script>';
        }
    }
    function get_payment($hotenkh,$mskh,$msnv,$total,$province,$district,$diachi,$dienthoai,$code){
        include('admincp/modules/config.php');
        $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
        $insert_cart="insert into dathang (hotenkh,mskh,msnv,tongtien,province,district,diachi,dienthoai,code) values ('$hotenkh','$mskh','$msnv','$total','$province','$district','$diachi','$dienthoai','$code')";
        $ketqua=mysqli_query($conn,$insert_cart);
        if($ketqua){
            for($i=0; $i<count($_SESSION['product']); $i++){
                $max=mysqli_query($conn,"select max(sodondh) from dathang");
                $row=mysqli_fetch_array($max);
                $cart_id=$row[0];
                $product_id=$_SESSION['product'][$i]['id'];
                $product_name=$_SESSION['product'][$i]['tenhh'];
                $quantity=$_SESSION['product'][$i]['soluong'];
                $product_price=$_SESSION['product'][$i]['gia'];
                $price=$quantity*$_SESSION['product'][$i]['gia']; 
                    // echo '$price';
                $insert_cart_detail="INSERT INTO chitietdathang(sodondh,mshh,tenhh,soluong,giaban,giadathang) VALUES ('$cart_id','$product_id','$product_name','$quantity','$product_price','$price')";
                mysqli_query($conn,$insert_cart_detail);
            }   
        }
        unset($_SESSION['product']);
        header('location:index.php?xem=camon');
    }
    
    function generateRandomString($length = 10) {
        return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
    }
    
    function getImageFromArray($ar,$num) {
        $image = array();
        for($i=0;$i<$num;$i++)
        {
            $image[$i] = $ar[$i];
        }
        return $image;
    }  
    function getImagesFromDir($path) {
        $images = array();
        if ( $img_dir = @opendir($path) ) {
            while ( false !== ($img_file = readdir($img_dir)) ) {
                // checks for gif, jpg, png
                if ( preg_match("/(\.gif|\.jpg|\.png)$/", $img_file) ) {
                    $images[] = $img_file;
                }
            }
            closedir($img_dir);
        }
        return $images;
    }
?>