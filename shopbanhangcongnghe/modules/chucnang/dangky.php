
<?php 
	include('admincp/modules/config.php');
	require('function.php');
    if(isset($_POST['register'])){
		$hotenkh=$_POST['hotenkh'];
        $username=$_POST['username'];
		$password=md5($_POST['password']);
		$email=$_POST['email'];
		$dienthoai=$_POST['dienthoai'];
		$diachi=$_POST['diachi'];
		if($username =='' || $password == ''){
			echo'<script>alert("Vui lòng điền đầy đủ thông tin!")</script>';
		}
        else{
			get_new_customer($hotenkh,$username,$password,$email,$dienthoai,$diachi);
		}
    }
?>
<form action="" method="POST" enctype="multipart/form-data" name="register">
<section id="product-detail">    
    <div class="container">
        <div class="col-md-6 col-sm-6 col-xs-12">
			<div class="products-wrap">
				<div class="accordion accordion-lg divcenter nobottommargin clearfix" style="max-width: 550px;">
					<div id="register">
						<div class="acctitle acctitlec">Đăng ký tài khoản</div>
							<div class="acc_content clearfix" style="display: block;">
							<input name="FormType" type="hidden" value="customer_register">
							<input name="utf8" type="hidden" value="true"> 
							<div class="col_full">
								<label for="first_name">Tên đăng nhập:<span class="require_symbol">*</span></label>
								<input type="text" id="first_name" name="username" value="" class="form-control" placeholder="Tên đăng nhập">
								<div class="error" id="username_error"></div>
							</div> 
							<div class="col_full">
								<label for="register-form-password">Mật khẩu:<span class="require_symbol">*</span></label>
								<input type="password" id="register-form-password" name="password" placeholder="Mật khẩu" class="form-control">
							    <div class="error" id="password_error"></div>
							</div>
							<!-- <div class="col_full">
								<label for="register-form-repassword">Nhập lại mật khẩu:<span class="require_symbol">* </span></label>
								<input type="password" id="register-form-repassword" name="re_password" value="" class="form-control" placeholder="Nhập lại mật khẩu">
								<div class="error" id="re_password_error"></div>
							</div> -->
							<div class="col_full">
								<label for="first_name">Họ tên:<span class="require_symbol">*</span></label>
								<input type="text" id="first_name" name="hotenkh" placeholder="Họ tên" class="form-control">
								<div class="error" id="name_error"></div>
							</div>              
							<div class="col_full">
								<label for="register-form-email">Email:<span class="require_symbol">*</span></label>
								<input type="text" id="register-form-email" name="email" class="form-control" placeholder="Nhập email">
								<div class="error" id="email_error"></div>
							</div>
							<div class="col_full">
								<label for="first_name">Số điện thoại:<span class="require_symbol">*</span></label>
								<input type="text" id="first_name" name="dienthoai" placeholder="Số điện thoại" class="form-control">
								<div class="error" id="phone_error"></div>
							</div>
							<div class="col_full">
								<label for="first_name">Địa chỉ:<span class="require_symbol">*</span></label>
								<textarea type="text" id="first_name" name="diachi" class="form-control"></textarea>
								<div class="error" id="address_error"></div>
							</div>
							<div class="col_full nobottommargin">
								<button class="button button-3d button-black nomargin" id="register-form-submit" name="register" type="submit" style="margin-bottom: 20px">Đăng ký</button>
								<ul>
									<li class="right" style="font-size: 18px;">Nếu đã có tài khoản, hãy <a href="index.php?xem=login" style="font-size: 19px; color: #0f9ed8;">Đăng nhập</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
</section>
</form>