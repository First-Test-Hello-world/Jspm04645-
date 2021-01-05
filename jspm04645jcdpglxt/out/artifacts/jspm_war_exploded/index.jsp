<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner17">
        <div class="swiper-wrapper">
            <% for (HashMap bht : bhtList) { %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>"
                       style="background-image: url('<%= bht.get("image") %>'); height: 400px"></a>
                </div>
            </div>
            <% } %>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>


    <script>
        var mySwiper = new Swiper('#banner17', {
            loop: true, // 循环模式选项
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            },
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
            // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        })
    </script>


</div>
<div class="" style="margin:20px 0 20px 0">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title" style="box-shadow:0px 0px 10px 10px #B8B4B4">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="huajuxinxilist.jsp">
                               更多
                            </a>
                        </div>
                        <span>
                最新演出            </span>
                    </div>
                    <div class="sn-content">


                        <div class="module-products clearfix">
                            <% ArrayList<HashMap> huajuxinxilist21 = Query.make("huajuxinxi").limit(8).order("id desc").select(); %>

                            <div class="products clearfix">
                                <% for (HashMap r : huajuxinxilist21) { %>
                                <div class="products-col" style="width: 25%">
                                    <article>
                                        <a href="huajuxinxidetail.jsp?id=<%= r.get("id") %>"
                                           class="pro-btn pro-btn-add">
                                            查看
                                        </a>
                                        <div class="figure-grid">
                                            <div class="image">
                                                <div class="img-box pb130 img-scale">
                                                    <a class="img" href="huajuxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       style="background-image: url('<%= r.get("haibao") %>')"></a>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h2 class="title h4">
                                                    <a href="huajuxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("mingcheng") %>
                                                    </a>
                                                </h2>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>