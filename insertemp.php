<?php 
    
    session_start();
    if(!isset($_SESSION{'username'})){

        $_SESSION['message']= "กรุณาล็อกอินก่อนใช้งานระบบ";
        header('location:login.php');
    }
    if(isset($_GET['logout'])){
        session_destroy();
        unset($_SESSION['usermane']);
        header('location:login.php');
    }
  ?>
