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


        if (request.getParameter("huajuxinxiid") != null && !"".equals(request.getParameter("huajuxinxiid"))) {
            where += " AND huajuxinxiid='" + request.getParameter("huajuxinxiid") + "' ";

        }


        if (request.getParameter("bianhao") != null && !"".equals(request.getParameter("bianhao"))) {
            where += " AND bianhao LIKE '%" + request.getParameter("bianhao") + "%'";
        }
        if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
            where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
        }
        if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
            where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
        }
        if (request.getParameter("jiage_start") != null && !"".equals(request.getParameter("jiage_start"))) {
            where += " AND jiage >='" + request.getParameter("jiage_start") + "' ";
        }
        if (request.getParameter("jiage_end") != null && !"".equals(request.getParameter("jiage_end"))) {
            where += " AND jiage <='" + request.getParameter("jiage_end") + "' ";
        }
        if (request.getParameter("yanyichangsuo") != null && !"".equals(request.getParameter("yanyichangsuo"))) {
            where += " AND yanyichangsuo ='" + request.getParameter("yanyichangsuo") + "'";
        }
        List<HashMap> list = Query.make("changci").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            场次        </span>
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

                        <select class="form-control class_fenlei9"
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
                            $(".class_fenlei9").val($(".class_fenlei9").attr("data-value"))</script>

                    </div>
                    <div class="form-group">
                        价格

                        <input type="text" class="form-control" style="width:80px;" name="jiage_start"
                               value="<%= request.getParameter("jiage_start") !=null ? request.getParameter("jiage_start") : "" %>"/>-<input
                            type="text" class="form-control" style="width:80px;" name="jiage_end"
                            value="<%= request.getParameter("jiage_end") !=null ? request.getParameter("jiage_end") : "" %>"/>
                    </div>
                    <div class="form-group">
                        演艺场所

                        <select class="form-control class_yanyichangsuo10"
                                data-value="<%= request.getParameter("yanyichangsuo") !=null ? request.getParameter("yanyichangsuo") : "" %>"
                                id="yanyichangsuo" name="yanyichangsuo">
                            <option value="">请选择</option>
                            <%
                                select = new CommDAO().select("SELECT * FROM yanyiting ORDER BY id desc");
                            %>
                            <% for (HashMap m : select) { %>
                            <option value="<%= m.get("id") %>"><%= m.get("mingcheng") %>
                            </option>
                            <% } %>

                        </select>
                        <script>
                            $(".class_yanyichangsuo10").val($(".class_yanyichangsuo10").attr("data-value"))</script>

                    </div>
                    <select class="form-control" name="order" id="orderby">

                        <option value="id">按发布时间</option>
                        <option value="jiage">
                            按价格
                        </option>

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
                        <th> 价格</th>
                        <th> 演艺场所</th>
                        <th> 开场时间</th>
                        <th> 结束时间</th>
                        <th> 剩余票数</th>
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
                            HashMap maphuajufenlei8 = new CommDAO().find("SELECT fenleimingcheng FROM huajufenlei where id='" + map.get("fenlei") + "'");
                        %><%= maphuajufenlei8.get("fenleimingcheng") %>
                        </td>
                        <td><% if ("".equals(map.get("haibao"))) { %>-<% } else { %><img width="100"
                                                                                         src="<%= map.get("haibao") %>"/><% } %>
                        </td>
                        <td><%= map.get("jiage") %>
                        </td>
                        <td><%
                            HashMap mapyanyiting9 = new CommDAO().find("SELECT mingcheng FROM yanyiting where id='" + map.get("yanyichangsuo") + "'");
                        %><%= mapyanyiting9.get("mingcheng") %>
                        </td>
                        <td><%= map.get("kaichangshijian") %>
                        </td>
                        <td><%= map.get("jieshushijian") %>
                        </td>
                        <td><%= map.get("shengyupiaoshu") %>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">

                            <a href="changci_detail.jsp?id=<%= map.get("id") %>">
                                详细
                            </a>
                            <a href="changci_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="changci.jsp?a=delete&id=<%= map.get("id") %>"
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
