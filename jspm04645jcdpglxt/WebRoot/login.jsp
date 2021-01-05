<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>剧场订票管理系统</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <style>
        select>option{
            color: #000000;
            padding: 8px 0;
        }
    </style>
</head>

<body class="login-page sidebar-collapse">

    <!-- End Navbar -->
    <div class="page-header" filter-color="orange">
        <div class="page-header-image" style="background-image:url(assets/img/login.jpg)"></div>
        <div class="container">

            <div class="col-md-12 content-center">
                <div class="col-md-12">
                    <h3>剧场订票管理系统后台管理系统</h3>
                </div>
                <div class="card card-login card-plain">
                    <form class="form" method="post" action="login?ac=adminlogin&a=a">
                        <div class="header header-primary text-center">
                            <div class="logo-container" style="margin-bottom: 20px">
                                <img src="assets/img/now-logo.png" alt="">
                            </div>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input type="text" class="form-control" name="username" placeholder="用户名">
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <input type="password" name="pwd" placeholder="密码" class="form-control" />
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                                <input type="text" name="pagerandom" placeholder="验证码" class="form-control" />
                                <span class="input-group-addon">
                                    <img alt="刷新验证码" onClick="this.src='image.jsp?time='+new Date().getTime();"
                                         src="image.jsp" style="cursor:pointer; padding-top:10px;">
                                </span>
                            </div>
                            <div class="input-group form-group-no-border input-lg">

                                <select name="cx" class="form-control" style="height: 50px;line-height: 30px; padding: 5px 22px;">
                                    <option value="管理员">管理员</option>                                </select>
                            </div>
                        </div>
                        <div class="footer text-center">
                            <button type="submit" class="btn btn-primary btn-round btn-lg btn-block">登录</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>


    </div>
</body>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Share Library etc -->
<script src="assets/js/plugins/jquery.sharrre.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>

</html>