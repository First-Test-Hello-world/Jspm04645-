<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
                                        
<% HashMap map = Query.make("goupiao").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
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
                演艺场所            </td>
            <td><% 
 HashMap mapyanyiting4 = new CommDAO().find("SELECT mingcheng FROM yanyiting where id='"+map.get("yanyichangsuo")+"'"); 
 %><%= mapyanyiting4.get("mingcheng") %></td>
            
                                    <td width="180">
                开场时间            </td>
            <td><%= map.get("kaichangshijian") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                结束时间            </td>
            <td><%= map.get("jieshushijian") %></td>
            
                                    <td width="180">
                价格            </td>
            <td><%= map.get("jiage") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                剩余票数            </td>
            <td><%= map.get("shengyupiaoshu") %></td>
            
                                    <td width="180">
                购买票数            </td>
            <td><%= map.get("goumaipiaoshu") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                选座            </td>
            <td><%= map.get("xuanzuo") %></td>
            
                                    <td width="180">
                小计            </td>
            <td><%= map.get("xiaoji") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                状态            </td>
            <td><%= map.get("zhuangtai") %></td>
            
                                    <td width="180">
                购票人            </td>
            <td><%= map.get("goupiaoren") %></td>
                    </tr>
        <tr>
            
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
