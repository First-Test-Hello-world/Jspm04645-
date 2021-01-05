<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<script>
    var config = [{
        id: 'menu',
        homePage: 'sy',
        menu: [
            {
                text: '后台主页',
                items: [
                    {id: 'sy', text: '后台主页', href: 'sy.jsp', closeable: false},
                ]
            },
            {
                text: '个人中心',
                items: [
                    {id: 'a00', text: '修改个人资料', href: 'huiyuan_updtself.jsp'},
                    {id: 'a01', text: '修改密码', href: 'mod.jsp'},
                    {id: 'a01', text: '个人信息', href: 'huiyuan_list.jsp'},
                ]
            },
            {
                text: '购票管理',
                items: [
                    {id: 'a10', text: '购票查询', href: 'goupiao_list_goupiaoren.jsp'},
                    {id: 'a11', text: '退票查询', href: 'tuipiao_list_tuipiaoren.jsp'},
                    {id: 'a12', text: '评价管理', href: 'pingjia_list_pingjiaren.jsp'},
                ]
            },


        ]
    }];
</script>
