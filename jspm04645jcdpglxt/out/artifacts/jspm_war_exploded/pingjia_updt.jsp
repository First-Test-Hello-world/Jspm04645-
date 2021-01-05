<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>


<%
        // 获取需要编辑的数据
    String updtself="0"; // 设置更新
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "pingjia");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑评价:
        </div>
        <div class="panel-body">
            <form action="pingjia.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">编号</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("bianhao") %><input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(mmm.get("bianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">名称</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("mingcheng") %><input type="hidden" id="mingcheng" name="mingcheng" value="<%= Info.html(mmm.get("mingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">价格</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("jiage") %><input type="hidden" id="jiage" name="jiage" value="<%= Info.html(mmm.get("jiage")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购买票数</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("goumaipiaoshu") %><input type="hidden" id="goumaipiaoshu" name="goumaipiaoshu" value="<%= Info.html(mmm.get("goumaipiaoshu")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">小计</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("xiaoji") %><input type="hidden" id="xiaoji" name="xiaoji" value="<%= Info.html(mmm.get("xiaoji")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">评分</label>
        <div class="col-sm-8">
            
                                                    <select class="form-control class_pingfen22" data-value="<%= Info.html(mmm.get("pingfen")) %>" id="pingfen" name="pingfen" style="width:250px">
<option value="好评">好评</option>
<option value="中评">中评</option>
<option value="差评">差评</option>

</select>
<script>
$(".class_pingfen22").val($(".class_pingfen22").attr("data-value"))</script>
                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">评语</label>
        <div class="col-sm-8">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" id="pingyu" name="pingyu"><%= Info.html(mmm.get("pingyu")) %></textarea>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">评价人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="pingjiaren" name="pingjiaren" value="<%= mmm.get("pingjiaren") %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= mmm.get("id") %>" type="hidden"/>
                                                <input name="goupiaoid" value="<%= mmm.get("goupiaoid") %>" type="hidden"/>
                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="<%= updtself %>" type="hidden"/>
                                        
                    
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
