<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<!DOCTYPE HTML>
<html>
<head>
    <title> 剧场订票管理系统 管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="header">

    <div class="dl-title">
        <a href="./" title="文档库地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
            <span class="lp-title-port"></span><span class="dl-title-text">剧场订票管理系统</span>
        </a>
    </div>

    <div class="dl-log">欢迎您，
        <span class="dl-log-user"><%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %></span>
        <span class="dl-log-user"><%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %></span>
        <a href="./" title="文档库" class="dl-log-quit">[前台首页]</a>
        <a href="logout.jsp" title="退出系统" class="dl-log-quit" onclick="return confirm('你确定退出系统？')">[退出]</a>

    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform">
            <div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div>
        </div>
        <ul id="J_Nav" class="nav-list ks-clear">
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-home">首页</div>
            </li>

            <!--<li class="nav-item">
                <div class="nav-item-inner nav-order">表单页</div>
            </li>
            <li class="nav-item">
                <div class="nav-item-inner nav-inventory">搜索页</div>
            </li>
            <li class="nav-item">
                <div class="nav-item-inner nav-supplier">详情页</div>
            </li>
            <li class="nav-item">
                <div class="nav-item-inner nav-marketing">图表</div>
            </li>-->
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="./assets/js/bui.js"></script>
<script type="text/javascript" src="./assets/js/config.js"></script>

<% if( "管理员".equals( request.getSession().getAttribute("cx") ) ){ %>
<%@ include file="left_guanliyuan.jsp" %>
<% } %>
<% if( "会员".equals( request.getSession().getAttribute("cx") ) ){ %>
<%@ include file="left_huiyuan.jsp" %>
<% } %>


<script>
    BUI.use('common/main', function () {  // 加载common/main 模块
        new PageUtil.MainPage({   //   加载左侧页面折叠组件
            modulesConfig: config   // 这个是上面配置得菜单
        });
    });
</script>

</body>
</html>