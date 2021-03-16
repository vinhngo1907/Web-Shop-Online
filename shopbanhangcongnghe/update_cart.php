<?php 
    session_start();
    include('admincp/modules/config.php');
    $conn=mysqli_connect($tenmaychu,$tentaikhoan,$pass,$csdl);
 
    if( isset($_GET['cong'])){
        $id=$_GET['cong'];
        foreach ($_SESSION['product'] as $cart_item) {

            if($cart_item['id']!=$id){
                $product[] = array('tenhh'=>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$cart_item['soluong'],'gia'=>$cart_item['gia']);
                $_SESSION['product'] = $product;
                $quantity = $cart_item['soluong'];
                $price = $cart_item['gia']*$quantity;
                $sql_plus=mysqli_query($conn,"UPDATE giohang set soluong = '$quantity',giaban = '$price'  where giohang.mshh = '$id'");
            }else{
                $tang =  $cart_item['soluong']+1;
                if($cart_item['soluong'] < 100){
                    
                    $product[] = array('tenhh'=>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$tang,'gia'=>$cart_item['gia']);
                }else{
                    $product[] = array('tenhh'=>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$cart_item['soluong'],'gia'=>$cart_item['gia']);
                }
                $_SESSION['product'] = $product;
                $quantity = $tang;
                $price = $cart_item['gia']*$quantity;
                $sql_plus=mysqli_query($conn,"UPDATE giohang set soluong = '$quantity', giaban = '$price'  where giohang.mshh = '$id'");
            }
            header('location:index.php?xem=giohang');
        }
    }    
    if(isset($_SESSION['product']) && isset($_GET['tru'])){
        $id= $_GET['tru'];
        foreach ($_SESSION['product'] as $cart_item) {
            if($cart_item['id'] != $id){
                $product[] = array('tenhh' =>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$cart_item['soluong'],'gia'=>$cart_item['gia']);
                $_SESSION['product'] = $product;
                $quantity = $cart_item['soluong'];
                $price = $cart_item['gia']*$quantity;
                $sql_update=mysqli_query($conn,"UPDATE giohang set soluong = '$quantity',giaban = '$price'  where giohang.mshh = '$id'");
            }else{
                $giam = $cart_item['soluong']-1;
                if($cart_item['soluong'] > 1){
                    $product[] = array('tenhh' =>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$giam,'gia'=>$cart_item['gia']);
                }else{
                    $giam = 1;
                    $product[] = array('tenhh' =>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$giam,'gia'=>$cart_item['gia']);
                }
                $_SESSION['product'] = $product;
                $quantity = $giam;
                $price = $cart_item['gia']*$quantity;
                $sql_update=mysqli_query($conn,"UPDATE giohang set soluong = '$quantity',giaban = '$price' where giohang.mshh = '$id'");
            }
            
            header("location:index.php?xem=giohang");
        }
    }
    if(isset($_SESSION['product']) && isset($_GET['xoa'])){
        $id=$_GET['xoa'];
        foreach ($_SESSION['product'] as $cart_item) {
            if($cart_item['id'] != $id){
                $product[] = array('tenhh'=>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$cart_item['soluong'],'gia'=>$cart_item['gia']);                
            }
            $_SESSION['product']=$product;
            $sql_delete=mysqli_query($conn,"DELETE FROM  giohang where giohang.mshh = '$id'");
            header('location:index.php?xem=giohang');
        }
        
    }
    if(isset($_GET['xoatoanbo']) && $_GET['xoatoanbo'] == 1){
        session_destroy();
        header("location:index.php?xem=giohang");
    }
    if(isset($_POST['add_to_cart'])){
        $id=$_GET['id'];
        $soluong=$_POST['soluong'];
        $sql=mysqli_query($conn,"select * from hanghoa where mshh = '$id' limit 1");
        $dong=mysqli_fetch_array($sql);
        
        if($dong){
            if($dong['sale_off']==0){
                $dong['giaban']=$dong['giagoc'];
            }else{
                $dong['giaban']=($dong['giagoc']-($dong['giagoc']*$dong['sale_off'])/100);
            }
            $new_product = array(array('tenhh'=>$dong['tenhh'],'id'=>$id,'soluong'=>$soluong,'gia'=>$dong['giaban']));
            $sql_giohang=mysqli_query($conn,"select * from giohang");
            $count=mysqli_num_rows($sql_giohang);
            // $rows = mysqli_fetch_array($sql_giohang);
            $sql_insert=mysqli_query($conn,"INSERT INTO giohang(tenhh,mshh,soluong,giaban) values('$dong[tenhh]','$id','$soluong','$dong[giaban]')");
            if(isset($_SESSION['product'])){      
                $found = false;
                foreach($_SESSION['product'] as $cart_item){
                    if($cart_item['id'] == $id){
                        $soluong = $soluong + $cart_item['soluong'];
                        $price = $cart_item['gia']*$soluong;
                        $product[] = array('tenhh'=>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$soluong,'gia'=>$cart_item['gia']);
                        $sql_update = mysqli_query($conn,"UPDATE giohang set soluong = '$soluong',giaban = '$price' where mshh='$cart_item[id]'");
                        $found=true;
                    }
                    else{
                        $product[] = array('tenhh'=>$cart_item['tenhh'],'id'=>$cart_item['id'],'soluong'=>$cart_item['soluong'],'gia'=>$cart_item['gia']);
                        // $sql_insert=mysqli_query($conn,"INSERT INTO giohang(tenhh,mshh,soluong,giaban) values('$cart_item[tenhh]','$id','$cart_item[soluong]','$cart_item[gia]')");
                    }
                    
                }if($found==false){
                    $_SESSION['product']=array_merge($product,$new_product);

                }else{
                    $_SESSION['product']=$product;
                    // $sql_update = mysqli_query($conn,"UPDATE giohang set soluong = '$soluong',giaban = '$price' where mshh='$cart_item[id]'");
                }
            }else{
                $_SESSION['product']=$new_product;
                
                // $sql_insert=mysqli_query($conn,"INSERT INTO giohang(tenhh,mshh,soluong,giaban) values('$cart_item[tenhh]','$cart_item[id]','$cart_item[soluong]','$cart_item[gia]')");
            }
        }
        header('location:index.php?xem=giohang');
    }

?>