<?php 
    // session_start();
    include('admincp/modules/config.php');
    require('function.php');
    if(isset($_POST['login'])){
        $username=$_POST['username'];
        // $password=$_POST['password'];
        $password=md5($_POST['password']);
        if($username==''){
            echo '<script>alert("Tên đăng nhập không được để trống")</script>';
        }elseif ($password=='') {
            echo '<script>alert("Password không được để trống !")</script>';
        }else{
            get_customer($username,$password);
        }
        
    }
?>
<form action="" method="POST" enctype="multipart/form-data">
    <div class="container">
        <div class="products-wrap">
            <div class="container">
                <div class="col-md-3 col-sm-3 hidden-xs"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div id="login">
                        <div class="acctitle acctitlec">Đăng nhập</div>
                        <div class="acc_content clearfix" style="display: block;">
                            <div class="col_full">
                                <label for="login-form-username">Tài khoản:<span class="require_symbol">* </span></label>
                                <input type="text" id="login-form-username" name="username" value="" class="form-control">
                                <div class="error" id="username_error"></div>
                            </div>
                            <div class="col_full">
                                <label for="login-form-password">Mật khẩu:<span class="require_symbol">* </span></label>
                                <input type="password" id="login-form-password" name="password" value="" class="form-control">
                                <div class="error" id="password_error"></div>	
                            </div>
                            <div class="col_full nobottommargin">
                                <button class="button button-3d button-black nomargin pull-left" id="login-form-submit" name="login" type="submit">Đăng nhập</button>
                                <ul class="pull-right">
                                    <li><a href="quen-mat-khau" class="fright">Quên mật khẩu?</a></li>
                                    <li><a href="index.php?xem=register" class="fright">Người dùng mới? Đăng ký tài khoản</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 hidden-xs"></div>
            </div>
        </div>
    </div>
</form>
