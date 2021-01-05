<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>

<div style="padding: 10px">
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


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            话剧信息        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
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


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 编号</th>
                        <th> 名称</th>
                        <th> 分类</th>
                        <th> 海报</th>
                        <th> 主演</th>
                        <th> 时长</th>
                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                <%= i %>
                            </label>
                        </td>
                        <td><%= map.get("bianhao") %>
                        </td>
                        <td><%= map.get("mingcheng") %>
                        </td>
                        <td><%
                            HashMap maphuajufenlei2 = new CommDAO().find("SELECT fenleimingcheng FROM huajufenlei where id='" + map.get("fenlei") + "'");
                        %><%= maphuajufenlei2.get("fenleimingcheng") %>
                        </td>
                        <td><% if ("".equals(map.get("haibao"))) { %>-<% } else { %><img width="100"
                                                                                         src="<%= map.get("haibao") %>"/><% } %>
                        </td>
                        <td><%= map.get("zhuyan") %>
                        </td>
                        <td><%= map.get("shizhang") %>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">

                            <a href="changci_add.jsp?id=<%= map.get("id") %>">场次添加</a>

                            <a href="huajuxinxi_detail.jsp?id=<%= map.get("id") %>">
                                详细
                            </a>
                            <a href="huajuxinxi_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="huajuxinxi.jsp?a=delete&id=<%= map.get("id") %>"
                               onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            ${page.info}


        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
