<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
%>
<% HashMap map = Query.make("huajuxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">

                        </div>
                        <span>
                详情            </span>
                    </div>
                    <div class="sn-content">


                        <div class="">
                            <div class="goods-info clearfix">
                                <div class="gallery-list">
                                    <div class="swiper-container gallery-top" id="shangpin-galler">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>

                                </div>
                                <div class="goods-right-content">
                                    <h3 class="title"><%= map.get("mingcheng") %>
                                    </h3>
                                    <div class="descount">
                                        <div>
                        <span class="name">
                            分类：
                        </span>
                                            <span class="val">
                            <%
                                HashMap maphuajufenlei5 = new CommDAO().find("SELECT fenleimingcheng FROM huajufenlei where id='" + map.get("fenlei") + "'");
                            %><%= maphuajufenlei5.get("fenleimingcheng") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            主演：
                        </span>
                                            <span class="val">
                            <%= map.get("zhuyan") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            时长：
                        </span>
                                            <span class="val">
                            <%= map.get("shizhang") %>                        </span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="goods-content">
                                <%= map.get("xiangqing") %>
                            </div>

                            <script>
                                (function () {
                                    var images = "<%= map.get("haibao") %>".split(",");
                                    if (images.length > 0) {
                                        for (var i = 0; i < images.length; i++) {
                                            var path = images[i]
                                            var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                            $('#shangpin-galler .swiper-wrapper').append(src);
                                            $('#shangpin-thumb .swiper-wrapper').append(src);
                                        }

                                        var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                            spaceBetween: 10,
                                            slidesPerView: 4,
                                            watchSlidesVisibility: true,//防止不可点击
                                        })
                                        var gallerySwiper = new Swiper('#shangpin-galler', {
                                            spaceBetween: 10,
                                            thumbs: {
                                                swiper: thumbsSwiper,
                                            }
                                        })
                                    }

                                })();

                            </script>

                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">

                        </div>
                        <span>
                场次            </span>
                    </div>
                    <div class="sn-content">


                        <div class="list-table">
                            <% ArrayList<HashMap> changcilist14 = Query.make("changci").where("bianhao", map.get("bianhao")).limit(10).order("id desc").select(); %>


                            <table width="100%" border="1" class="table table-list table-bordered table-hover">
                                <thead>
                                <tr align="center">
                                    <th style="display: none"> 编号</th>
                                    <th style="text-align: center"> 名称</th>
                                    <th style="display: none"> 分类</th>
                                    <th style="display: none"> 海报</th>
                                    <th> 价格</th>
                                    <th> 演艺场所</th>
                                    <th> 开场时间</th>
                                    <th> 结束时间</th>
                                    <th> 剩余票数</th>
                                    <th style="text-align: center"> 操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    int i = 0;
                                    for (HashMap r : changcilist14) {
                                        i++;
                                %>
                                <tr>
                                    <td style="display: none"><%= r.get("bianhao") %>
                                    </td>
                                    <td><%= r.get("mingcheng") %>
                                    </td>
                                    <td style="display: none"><%
                                        HashMap maphuajufenlei6 = new CommDAO().find("SELECT fenleimingcheng FROM huajufenlei where id='" + r.get("fenlei") + "'");
                                    %><%= maphuajufenlei6.get("fenleimingcheng") %>
                                    </td>
                                    <td style="display: none"><% if ("".equals(r.get("haibao"))) { %>-<% } else { %><img
                                            width="100"
                                            src="<%= r.get("haibao") %>"/><% } %>
                                    </td>
                                    <td><%= r.get("jiage") %>
                                    </td>
                                    <td><%
                                        HashMap mapyanyiting7 = new CommDAO().find("SELECT mingcheng FROM yanyiting where id='" + r.get("yanyichangsuo") + "'");
                                    %><%= mapyanyiting7.get("mingcheng") %>
                                    </td>
                                    <td><%= r.get("kaichangshijian") %>
                                    </td>
                                    <td><%= r.get("jieshushijian") %>
                                    </td>
                                    <td><%= r.get("shengyupiaoshu") %>
                                    </td>
                                    <td style="text-align: center">
                                        <%
                                            if (Double.valueOf(r.get("shengyupiaoshu").toString()) >= 1) {
                                        %>
                                        <a href="goupiaoadd.jsp?id=<%= r.get("id") %>">购 票</a>


                                        <%
                                            }
                                        %>


                                    </td>


                                </tr>
                                <% } %>

                                </tbody>
                            </table>
                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>