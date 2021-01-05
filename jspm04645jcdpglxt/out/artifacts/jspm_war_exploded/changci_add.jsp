<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>



    
    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("huajuxinxi").where("id", request.getParameter("id")).find(); %>





<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加场次:
        </div>
        <div class="panel-body">
            <form action="changci.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">编号</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("bianhao") %><input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(readMap.get("bianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">名称</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("mingcheng") %><input type="hidden" id="mingcheng" name="mingcheng" value="<%= Info.html(readMap.get("mingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">分类</label>
        <div class="col-sm-8">
            
                                                    <% 
 HashMap maphuajufenlei14 = new CommDAO().find("SELECT fenleimingcheng FROM huajufenlei where id='"+readMap.get("fenlei")+"'"); 
 %><%= maphuajufenlei14.get("fenleimingcheng") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(readMap.get("fenlei")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">海报</label>
        <div class="col-sm-8">
            
                                                    <% if( "".equals( readMap.get("haibao") ) ){ %>-<% } else { %><img width="100" src="<%= readMap.get("haibao") %>"/><% } %><input type="hidden" id="haibao" name="haibao" value="<%= Info.html(readMap.get("haibao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">价格<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写价格" number="true" data-msg-number="输入一个有效数字" id="jiage" name="jiage" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">演艺场所</label>
        <div class="col-sm-8">
            
                                                    <select class="form-control class_yanyichangsuo11" data-value="" id="yanyichangsuo" name="yanyichangsuo" style="width:250px">
<% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM yanyiting ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("mingcheng") %></option>
<% } %>

</select>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">开场时间</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" style="width:120px;" id="kaichangshijian" name="kaichangshijian" readonly="readonly" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">结束时间</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" style="width:120px;" id="jieshushijian" name="jieshushijian" readonly="readonly" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">剩余票数</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="shengyupiaoshu" name="shengyupiaoshu" value=""/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                                                <input type="hidden" name="huajuxinxiid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                    
                                                                                                                
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
