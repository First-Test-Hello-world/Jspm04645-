<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
<%
//------------------------------------------------
String orderby = util.Request.get("order" , "id");  // 获取搜索框中的排序字段、默认为发布时间
String sort  = util.Request.get("sort" , "desc");   // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误



// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


         if(request.getParameter("goupiaoid") != null && !"".equals( request.getParameter("goupiaoid") )){
    where += " AND goupiaoid='"+request.getParameter("goupiaoid")+"' ";

    }


             if(request.getParameter("bianhao") != null && !"".equals( request.getParameter("bianhao") )){ where+=" AND bianhao LIKE '%"+request.getParameter("bianhao")+"%'"; }
                 if(request.getParameter("mingcheng") != null && !"".equals( request.getParameter("mingcheng") )){ where+=" AND mingcheng LIKE '%"+request.getParameter("mingcheng")+"%'"; }
                 if(request.getParameter("jiage_start") != null && !"".equals( request.getParameter("jiage_start") )){ where+= " AND jiage >='"+request.getParameter("jiage_start")+"' "; }
 if(request.getParameter("jiage_end") != null && !"".equals( request.getParameter("jiage_end") )){ where+= " AND jiage <='"+request.getParameter("jiage_end")+"' "; }                 if(request.getParameter("goumaipiaoshu_start") != null && !"".equals( request.getParameter("goumaipiaoshu_start") )){ where+= " AND goumaipiaoshu >='"+request.getParameter("goumaipiaoshu_start")+"' "; }
 if(request.getParameter("goumaipiaoshu_end") != null && !"".equals( request.getParameter("goumaipiaoshu_end") )){ where+= " AND goumaipiaoshu <='"+request.getParameter("goumaipiaoshu_end")+"' "; }                     if(request.getParameter("pingfen") != null && !"".equals( request.getParameter("pingfen") )){
where+=" AND pingfen ='"+request.getParameter("pingfen")+"'"; }
                 if(request.getParameter("pingyu") != null && !"".equals( request.getParameter("pingyu") )){ where+=" AND pingyu LIKE '%"+request.getParameter("pingyu")+"%'"; }
        List<HashMap> list = Query.make("pingjia").where(where).order(orderby+" "+sort).page(15);

        %>

        



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            评价        </span>
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
    
                            <input type="text" class="form-control" style="" name="bianhao" value="<%= request.getParameter("bianhao") !=null ? request.getParameter("bianhao") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    名称
    
                            <input type="text" class="form-control" style="" name="mingcheng" value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    价格
    
                            <input type="text" class="form-control" style="width:80px;" name="jiage_start" value="<%= request.getParameter("jiage_start") !=null ? request.getParameter("jiage_start") : "" %>"/>-<input type="text" class="form-control" style="width:80px;" name="jiage_end" value="<%= request.getParameter("jiage_end") !=null ? request.getParameter("jiage_end") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    购买票数
    
                            <input type="text" class="form-control" style="width:80px;" name="goumaipiaoshu_start" value="<%= request.getParameter("goumaipiaoshu_start") !=null ? request.getParameter("goumaipiaoshu_start") : "" %>"/>-
<input type="text" class="form-control" style="width:80px;" name="goumaipiaoshu_end" value="<%= request.getParameter("goumaipiaoshu_end") !=null ? request.getParameter("goumaipiaoshu_end") : "" %>"/>                        
</div>
                                                                                    <div class="form-group">
    评分
    
                            <select class="form-control class_pingfen19" data-value="<%= request.getParameter("pingfen") !=null ? request.getParameter("pingfen") : "" %>" id="pingfen" name="pingfen">
<option value="">请选择</option><option value="好评">好评</option>
<option value="中评">中评</option>
<option value="差评">差评</option>

</select>
<script>
$(".class_pingfen19").val($(".class_pingfen19").attr("data-value"))</script>
                        
</div>
                                                                <div class="form-group">
    评语
    
                            <input type="text" class="form-control" id="pingyu" name="pingyu" value="<%= request.getParameter("pingyu") !=null ? request.getParameter("pingyu") : "" %>"/>
</div>
                                                        <select class="form-control" name="order" id="orderby">

                    <option value="id">按发布时间</option>
                                                <option value="jiage">
                                按价格                            </option>
                                        
</select>
                <select class="form-control" name="sort" id="sort">

                    <option value="desc">倒序</option>
                    <option value="asc">升序</option>
                
</select>
                <script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
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
                        <th> 编号 </th>
<th> 名称 </th>
<th> 价格 </th>
<th> 购买票数 </th>
<th> 小计 </th>
<th> 评分 </th>
<th> 评语 </th>
<th> 评价人 </th>
                                                                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% 
                int i= 0;
                for(HashMap map:list){
                i++;
                 %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map.get("bianhao") %> </td>
<td> <%= map.get("mingcheng") %> </td>
<td> <%= map.get("jiage") %> </td>
<td> <%= map.get("goumaipiaoshu") %> </td>
<td> <%= map.get("xiaoji") %> </td>
<td> <%= map.get("pingfen") %> </td>
<td> <%= map.get("pingyu") %> </td>
<td> <%= map.get("pingjiaren") %> </td>
                                                                        <td align="center"><%= map.get("addtime") %></td>
                        <td align="center">
                            
                                                                                    <a href="pingjia_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="pingjia.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a>
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
