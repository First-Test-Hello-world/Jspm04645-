<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">


    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
    <script>
        alert('对不起,请您先登陆!');
        location.href = 'login.jsp';
    </script>
    <%
            return;
        } %>


    <% if (null == request.getParameter("id") || "".equals(request.getParameter("id"))) { %>
    <script>
        alert('非法操作');
        history.go(-1);
    </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("changci").where("id", request.getParameter("id")).find(); %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                添加购票:
            </div>
            <div class="panel-body">
                <form action="goupiao.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">编号</label>
                            <div class="col-sm-8">

                                <%= readMap.get("bianhao") %><input type="hidden" id="bianhao" name="bianhao"
                                                                    value="<%= Info.html(readMap.get("bianhao")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">名称</label>
                            <div class="col-sm-8">

                                <%= readMap.get("mingcheng") %><input type="hidden" id="mingcheng" name="mingcheng"
                                                                      value="<%= Info.html(readMap.get("mingcheng")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">演艺场所</label>
                            <div class="col-sm-8">

                                <%
                                    HashMap mapyanyiting5 = new CommDAO().find("SELECT mingcheng FROM yanyiting where id='" + readMap.get("yanyichangsuo") + "'");
                                %><%= mapyanyiting5.get("mingcheng") %><input type="hidden" id="yanyichangsuo"
                                                                              name="yanyichangsuo"
                                                                              value="<%= Info.html(readMap.get("yanyichangsuo")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">开场时间</label>
                            <div class="col-sm-8">

                                <%= readMap.get("kaichangshijian") %><input type="hidden" id="kaichangshijian"
                                                                            name="kaichangshijian"
                                                                            value="<%= Info.html(readMap.get("kaichangshijian")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">结束时间</label>
                            <div class="col-sm-8">

                                <%= readMap.get("jieshushijian") %><input type="hidden" id="jieshushijian"
                                                                          name="jieshushijian"
                                                                          value="<%= Info.html(readMap.get("jieshushijian")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">价格</label>
                            <div class="col-sm-8">

                                <%= readMap.get("jiage") %><input type="hidden" id="jiage" name="jiage"
                                                                  value="<%= Info.html(readMap.get("jiage")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">剩余票数</label>
                            <div class="col-sm-8">

                                <%= readMap.get("shengyupiaoshu") %><input type="hidden" id="shengyupiaoshu"
                                                                           name="shengyupiaoshu"
                                                                           value="<%= Info.html(readMap.get("shengyupiaoshu")) %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购买票数</label>
                            <div class="col-sm-8">

                                <input type="number" class="form-control" style="width:150px;" number="true"
                                       data-msg-number="输入一个有效数字" min="1" max="<%= readMap.get("shengyupiaoshu") %>"
                                       id="goumaipiaoshu" name="goumaipiaoshu" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">选座</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" id="xuanzuo" name="xuanzuo"
                                       value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购票人</label>
                            <div class="col-sm-8">

                                <input type="text" class="form-control" style="width:150px;" readonly="readonly"
                                       id="goupiaoren" name="goupiaoren"
                                       value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
                            <div class="col-sm-8">

                                <input type="hidden" name="changciid"
                                       value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>

                                <input type="hidden" name="zhuangtai" id="zhuangtai" value="待支付"/>
                                <input type="hidden" name="iszf" value="否"/>

                                <button type="submit" class="btn btn-primary" name="Submit">
                                    提交
                                </button>
                                <button type="reset" class="btn btn-default" name="Submit2">
                                    重置
                                </button>


                            </div>
                        </div>
                    </div>

                    <!--form标签结束--></form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 --></div>


    <script>
        $(function () {
            $('#form1').validate();
        });
    </script>


</div>
<%@ include file="foot.jsp" %>
