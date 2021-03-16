<!DOCTYPE html PUBLIC>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="style-login.css" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>UserAdmin</title>
</head>

<body>
    <?php
        session_start();
        include('modules/config.php');
        $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
        include('modules/config.php');
        if(isset($_POST['login'])){
            $username=$_POST['username'];
            $password=$_POST['password'];
            $sql=mysqli_query($conn,"select * from user_account where username='$username' and password='$password' limit 1");
            $nums=mysqli_num_rows($sql);
            if($nums > 0){
                $row=mysqli_fetch_array($sql);
                if($row['role'] == 1 || $row['role'] == 2){
                    $_SESSION['dangnhap']=$username;
                    header('location:index.php?quanly=thongke&ac=lietke');
                }else{
                    echo'<script>alert("Just only admin can access this page!");</script>';
                } 
            }
            else{
                echo'<script>alert("Login failed. Please try again!");</script>';
                // header('location:login.php');
            }
        }
    ?>
    <div id="login">

        <form action="login.php" method="post" enctype="multipart/form-data">
            <h2 align="center">Đăng nhập</h2>
            <input type="text" name="username" size="40" id="username" placeholder="Enter Username..." required="required"/>
            <input type="password" name="password" size="40" placeholder="Enter Username..." required="required"/>
            <input type="submit" name="login" value="Sign-in" id="button"/>
        </form>
    </div>
</body>
</html>