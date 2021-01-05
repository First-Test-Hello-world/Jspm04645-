<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">

<% HashMap map = Query.make("huajuxinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                编号            </td>
            <td><%= map.get("bianhao") %></td>
            
                                    <td width="180">
                名称            </td>
            <td><%= map.get("mingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap maphuajufenlei4 = new CommDAO().find("SELECT fenleimingcheng FROM huajufenlei where id='"+map.get("fenlei")+"'"); 
 %><%= maphuajufenlei4.get("fenleimingcheng") %></td>
            
                                    <td width="180">
                海报            </td>
            <td><img src="<%= map.get("haibao") %>" style="width: 350px"/></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                主演            </td>
            <td><%= map.get("zhuyan") %></td>
            
                                    <td width="180">
                时长            </td>
            <td><%= map.get("shizhang") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                详情            </td>
            <td><%= map.get("xiangqing") %></td>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>
</div>
<%@ include file="foot.jsp" %>
