<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ page import="com.alibaba.fastjson.JSON" %>

<%
    if ((String) request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) {
        out.print("<script>javascript:alert('对不起，您已超时或未登陆！');window.history.go(-1);</script>");
        return;
    }
%>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<script src="js/jquery.validate.js"></script>


<% if (null == request.getParameter("id") || "".equals(request.getParameter("id"))) { %>
<script>
    alert('非法操作');
    history.go(-1);
</script>
<% out.close(); %>
<% } %>        <% HashMap readMap = Query.make("changci").where("id", request.getParameter("id")).find(); %>

<style type="text/css">
    .demo {
        width: 100%;
        margin: 40px auto 0 auto;
        min-height: 450px;
    }

    @media screen and (max-width: 360px) {
        .demo {
            width: 340px
        }
    }

    .front {
        width: 190px;
        margin: 5px 32px 45px 80px;
        background-color: #f0f0f0;
        color: #666;
        text-align: center;
        padding: 3px;
        border-radius: 5px;
    }

    .booking-details {
        float: right;
        position: relative;
        width: 350px;
        height: 450px;
    }

    .booking-details h3 {
        margin: 5px 5px 0 0;
        font-size: 16px;
    }

    .booking-details p {
        line-height: 26px;
        font-size: 16px;
        color: #999
    }

    .booking-details p span {
        color: #666
    }

    div.seatCharts-cell {

        color: #182C4E;
        height: 25px;
        width: 25px;
        line-height: 25px;
        margin: 3px;
        float: left;
        text-align: center;
        outline: none;
        font-size: 13px;
    }

    div.seatCharts-seat {
        color: #fff;
        cursor: pointer;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    }

    div.seatCharts-row {
        height: 35px;
    }

    div.seatCharts-seat.available {
        background-color: #a7de52;
    }

    div.seatCharts-seat.available.economy-class {
        background-color: #daa134
    }

    div.seatCharts-seat.focused {
        background-color: #76B474;
        border: none;
    }

    div.seatCharts-seat.selected {
        background-color: #19ae12;
    }

    div.seatCharts-seat.unavailable {
        background-color: #ae2422;
        cursor: not-allowed;
    }


    div.seatCharts-container {
        border-right: 1px dotted #adadad;
        width: 700px;
        padding: 20px;
        float: left;
    }


    div.seatCharts-legend {
        padding-left: 0px;
        position: absolute;
        bottom: 16px;
    }

    ul.seatCharts-legendList {
        padding-left: 0px;
    }

    .seatCharts-legendItem {
        float: left;
        width: 90px;
        margin-top: 10px;
        line-height: 2;
    }

    span.seatCharts-legendDescription {
        margin-left: 5px;
        line-height: 30px;
    }

    .checkout-button {
        display: block;
        width: 80px;
        height: 24px;
        line-height: 20px;
        margin: 10px auto;
        border: 1px solid #999;
        font-size: 14px;
        cursor: pointer
    }

    #selected-seats {
        max-height: 150px;
        overflow-y: auto;
        overflow-x: none;
        width: 100%;
    }


    #selected-seats li {
        width: 140px;
        float: left;
        height: 26px;
        line-height: 26px;
        border: 1px solid #d3d3d3;
        background: #f7f7f7;
        margin: 6px;
        font-size: 14px;
        font-weight: bold;
        text-align: center
    }
</style>
<script src="js/jquery.seat-charts.min.js"></script>


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
                                HashMap mapyanyiting7 = new CommDAO().find("SELECT mingcheng FROM yanyiting where id='" + readMap.get("yanyichangsuo") + "'");
                            %><%= mapyanyiting7.get("mingcheng") %><input type="hidden" id="yanyichangsuo"
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
                                   data-msg-number="输入一个有效数字" readonly="readonly"
                                   id="goumaipiaoshu" name="goumaipiaoshu" value=""/>
                        </div>
                    </div>
                </div>


                <tr>
                    <td width="200"></td>
                    <td>
                        <div align="center" id="seat-map">
                            <div class="front">屏幕</div>
                        </div>
                        <div class="booking-details">
                            <h3>已选中的座位 (<span id="counter">0</span>):</h3>
                            <ul id="selected-seats">
                            </ul>
                            <p>总价: <b>$<span id="total">0</span></b></p>
                            <div id="legend"></div>
                        </div>
                        <%
                            HashMap yanyiting = Query.make("yanyiting").where("id", readMap.get("yanyichangsuo")).find();
                        %>
                        <script>
                            $(document).ready(function () {
                                var $cart = $('#selected-seats'), //座位区
                                    $counter = $('#counter'), //票数
                                    $number = $('#goumaipiaoshu'),
                                    $total = $('#total'); //总计金额
                                var row =
                                <%=yanyiting.get("jipai") %>
                                var col =
                                <%=yanyiting.get("jilie") %>

                                var map = [];
                                for (var i = 0; i < row; i++) {
                                    var str = "";
                                    for (var j = 0; j < col; j++) {
                                        str += "a";
                                    }
                                    map.push(str);
                                }

                                var sc = $('#seat-map').seatCharts({
                                    map: map,
                                    seats: {
                                        a: {
                                            price: <%=readMap.get("jiage")%>,
                                            classes: 'first-class', //your custom CSS class
                                            category: '座位'
                                        }
                                    },
                                    naming: {
                                        top: false,
                                        getLabel: function (character, row, column) {
                                            return column;
                                        }
                                    },
                                    legend: { //定义图例
                                        node: $('#legend'),
                                        items: [
                                            ['a', 'available', '可选'],
                                            ['a', 'selected', '已选'],
                                            ['a', 'unavailable', '已售'],
                                        ]
                                    },
                                    click: function () { //点击事件
                                        if (this.status() == 'available') { //可选座


                                            $('<li><input type="hidden" name="xuanzuo" value="' + (this.settings.row + 1) + '_' + this.settings.label + '">' + (this.settings.row + 1) + '排' + this.settings.label + '号' + ' <a href="javascript:;" class="cancel-cart-item">[删除]</a></li>')
                                                .attr('id', 'cart-item-' + this.settings.id)
                                                .data('seatId', this.settings.id)
                                                .appendTo($cart);

                                            //$cart.html((this.settings.row + 1) + '排' + this.settings.label + '号');

                                            $counter.text(sc.find('selected').length + 1);
                                            $number.val(sc.find('selected').length + 1);
                                            //$total.text(recalculateTotal(this));
                                            $total.text(recalculateTotal(sc) + this.data().price);
                                            return 'selected';
                                        } else if (this.status() == 'selected') { //已选中
                                            $counter.text(sc.find('selected').length - 1);
                                            $number.val(sc.find('selected').length - 1);
                                            //and total
                                            $total.text(recalculateTotal(sc) - this.data().price);

                                            //remove the item from our cart
                                            $('#cart-item-' + this.settings.id).remove();

                                            //seat has been vacated
                                            return 'available';

                                        } else if (this.status() == 'unavailable') { //已售出
                                            return 'unavailable';
                                        } else {
                                            return this.style();
                                        }
                                    }
                                });
                                $('#selected-seats').on('click', '.cancel-cart-item', function () {
                                    //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                                    sc.get($(this).parents('li:first').data('seatId')).click();
                                });

                                //已售出的座位
                                <% List<String> lis = Query.make("goupiao")
                                .where("changciid" ,readMap.get("id"))
                               /*.where("dingpiaozhuangtai","in","已退票")*/
                                .getCol("xuanzuo");
                                String[] xxs = StringUtil.join("," , lis).split(",");
                                %>
                                <% if(lis.size()>0){ %>
                                sc.get(<%=JSON.toJSONString(xxs)%>).status('unavailable');
                                <% } %>

                                function recalculateTotal(sc) {
                                    var total = 0;
                                    //basically find every selected seat and sum its price
                                    sc.find('selected').each(function () {
                                        total += this.data().price;
                                    });
                                    return total;
                                }

                                //window.sc = sc;
                                //updateKaichangshijian();
                            });

                        </script>


                    </td>
                </tr>

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


<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>