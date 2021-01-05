<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
    //------------------------------------------------
    String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

    String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


    if (request.getParameter("bianhao") != null && !"".equals(request.getParameter("bianhao"))) {
        where += " AND bianhao LIKE '%" + request.getParameter("bianhao") + "%'";
    }
    if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
        where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }
    List<HashMap> list = Query.make("huajuxinxi").where(where).order(orderby + " " + sort).page(15);

%>

<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">

                        </div>
                        <span>
                话剧列表            </span>
                    </div>
                    <div class="sn-content">
                        <div class="pa10 bg-warning">
                            <form class="form-inline" action="?"><!-- form 标签开始 -->

                                <div class="form-group">


                                    <i class="glyphicon glyphicon-search"></i>

                                </div>


                                <div class="form-group">
                                    编号

                                    <input type="text" class="form-control" style="" name="bianhao"
                                           value="<%= request.getParameter("bianhao") !=null ? request.getParameter("bianhao") : "" %>"/>
                                </div>
                                <div class="form-group">
                                    名称

                                    <input type="text" class="form-control" style="" name="mingcheng"
                                           value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>"/>
                                </div>
                                <div class="form-group">
                                    分类

                                    <select class="form-control class_fenlei6"
                                            data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"
                                            id="fenlei" name="fenlei">
                                        <option value="">请选择</option>
                                        <%
                                            List<HashMap> select = new CommDAO().select("SELECT * FROM huajufenlei ORDER BY id desc");
                                        %>
                                        <% for (HashMap m : select) { %>
                                        <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %>
                                        </option>
                                        <% } %>

                                    </select>
                                    <script>
                                        $(".class_fenlei6").val($(".class_fenlei6").attr("data-value"))</script>

                                </div>
                                <select class="form-control" name="order" id="orderby">

                                    <option value="id">按发布时间</option>

                                </select>
                                <select class="form-control" name="sort" id="sort">

                                    <option value="desc">倒序</option>
                                    <option value="asc">升序</option>

                                </select>
                                <script>$("#orderby").val("<%= orderby %>");
                                $("#sort").val("<%= sort %>");</script>
                                <button type="submit" class="btn btn-default">
                                    搜索
                                </button>


                                <!--form标签结束--></form>
                        </div>


                        <div class="module-products clearfix">


                            <div class="products clearfix">
                                <% for (HashMap r : list) { %>
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
                            ${page.info}
                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>