<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>






<!--Start Hedaer Section-->


    

<section id="header">
        <div class="header-area">
            <div class="top_header">

                <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


                    <div class="row">
    
                        <div class="col-xs-4 col-sm-4 col-lg-4 zero_mp hidden-xs">
    
                            <div class="address">
                                <p>欢迎进入剧场订票管理系统</p>
                            </div>
                        
</div>

                        <!--End of col-md-4-->
                        <div class="col-xs-12 col-md-8 text-right">
    
                            <% if( request.getSession().getAttribute("username") != null && !("".equals( request.getSession().getAttribute("username") )) ){ %>
                            欢迎<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>登录，
                            您得权限：<%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %>
                            <a class="btn btn-primary btn-xs" href="main.jsp"> 个人中心</a>
                            <a class="btn btn-default btn-xs" href="logout.jsp" onclick="return confirm('你确定退出？')"> 退出</a>
                            <% } else { %>
                            <button type="button" class="btn btn-default btn-xs" toggle="modal" data-toggle="modal" data-target="#loginModel">
    登录
</button>

                            
                            <% } %>
                        
</div>
                        <!--End of col-md-4-->
                    
</div>
                    <!--End of row-->
                
<!-- container定宽，并剧中结束 --></div>
                <!--End of container-->
            </div>
            <!--End of top header-->
            <div class="header_menu text-center">

                <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    <nav class="ls-navbar ls-navbar-default zero_mp clearfix">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="ls-navbar-header">
                            <a class="ls-navbar-brand custom_navbar-brand" href="#">剧场订票管理系统</a>
                        </div>
                        <!--End of navbar-header-->

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="ls-collapse ls-navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                            <ul class="ls-nav ls-navbar-nav ls-navbar-right main_menu" id="navbar-str">
                                <li>
<a href="./">首页
</a>
</li>
<li>
<a href="huiyuanadd.jsp">会员注册
</a>
</li>
<li>
<a href="huajuxinxilist.jsp">全部话剧
</a>

<div class="nav-sub">
                    <% 
 List<HashMap> maphuajufenlei8 = new CommDAO().select("SELECT id,fenleimingcheng FROM huajufenlei"); 
 %>
<%  for(HashMap m:maphuajufenlei8){  %>
<a href="huajuxinxilist.jsp?fenlei=<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></a>
<% } %>
</div>
</li>
<li>
<a href="login.jsp">后台
</a>
</li>                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </nav>
                    <!--End of nav-->
                
<!-- container定宽，并剧中结束 --></div>
                <!--End of container-->
            </div>
            <!--End of header menu-->
        </div>
        <!--end of header area-->

        <!-- Modal -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="0" id="loginModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="0">登录</h4>
            </div>
            <div class="modal-body">
                <div class="pa10">
                    
            <form action="login?ac=login&a=a" method="post"><!-- form 标签开始 -->
    
                <div class="form-group">
    
    
                    <input type="text" class="form-control" name="username" placeholder="输入帐号"/>
                
</div>
                <div class="form-group">
    
    
                    <input type="password" class="form-control" name="pwd" placeholder="密码"/>
                
</div>
                <div class="form-group">
    
    
                    <select class="form-control" name="cx">

                        <option value="会员">会员</option>                    
</select>
                
</div>
                <div class="form-group">
    
    
                    <div class="input-group">
    
                        <input type="text" class="form-control" name="pagerandom" placeholder="输入验证码"/>
                        
                    
    <span class="input-group-addon"><img src="image.jsp" style="width: 60px;height: 20px;max-width: none; max-height: none;" onclick="this.src='image.jsp?rand='+new Date().getTime()"/></span>
</div>
                
</div>
                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                    <button type="submit" class="btn btn-primary">
    登录
</button>
                
        </div>
    </div>
</div>
            
<!--form标签结束--></form>
        
                </div>
            </div>
        </div>
    </div>
</div>
        <script>
            $(function () {
                $('#bs-example-navbar-collapse-1 .ls-nav>li').hover(function () {
                    $(this).find('.nav-sub').stop().slideDown();
                },function () {
                    $(this).find('.nav-sub').stop().slideUp();
                })
            });
            (function () {
                var path =location.pathname.substr(1);
                var search = location.search;
                if(search!=''){
                    path += decodeURIComponent(search);
                }
                if(path == '')
                {
                    $('#navbar-str li:eq(0)').addClass('active');
                }else{
                    $('#navbar-str>li').each(function () {
                        var href = $(this).find('>a').attr('href');
                        if(href == path)
                        {
                            $(this).addClass('active');
                        }
                        if($(this).find('.nav-sub').length>0)
                        {
                            var that = this;
                            $(this).find('a').each(function () {
                                var href = $(this).attr('href');
                                if(href == path)
                                {
                                    $(this).addClass('active');
                                    $(that).addClass('active');
                                }
                            })
                        }
                    })
                }

            })();
        </script>


    </section>



