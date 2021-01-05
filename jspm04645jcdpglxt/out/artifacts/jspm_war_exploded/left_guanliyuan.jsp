<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


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
            text: '账号管理',
            items: [
                                        {id: 'a00', text: '管理员账号管理', href: 'admins_list.jsp'},
                                        {id: 'a01', text: '管理员账号添加', href: 'admins_add.jsp'},
                                        {id: 'a02', text: '注册用户管理', href: 'huiyuan_list.jsp'},
                                        {id: 'a03', text: '添加新用户', href: 'huiyuan_add.jsp'},
                                        {id: 'a04', text: '密码修改', href: 'mod.jsp'},
                        ]
        },
                {
            text: '话剧信息管理',
            items: [
                                        {id: 'a10', text: '话剧分类添加', href: 'huajufenlei_add.jsp'},
                                        {id: 'a11', text: '话剧分类查询', href: 'huajufenlei_list.jsp'},
                                        {id: 'a12', text: '话剧信息添加', href: 'huajuxinxi_add.jsp'},
                                        {id: 'a13', text: '话剧信息查询', href: 'huajuxinxi_list.jsp'},
                        ]
        },
                {
            text: '场次管理',
            items: [
                                        {id: 'a20', text: '场次查询', href: 'changci_list.jsp'},
                        ]
        },
                {
            text: '演艺厅管理',
            items: [
                {id: 'a30', text: '演艺厅添加', href: 'yanyiting_add.jsp'},
                                        {id: 'a30', text: '演艺厅查询', href: 'yanyiting_list.jsp'},


                        ]
        },
                {
            text: '购票管理',
            items: [
                                        {id: 'a40', text: '购票查询', href: 'goupiao_list.jsp'},
                                        {id: 'a41', text: '退票查询', href: 'tuipiao_list.jsp'},
                        ]
        },
                {
            text: '评价管理',
            items: [
                                        {id: 'a50', text: '评价查询', href: 'pingjia_list.jsp'},
                        ]
        },
                {
            text: '系统管理',
            items: [
                                        {id: 'a60', text: '轮播图添加', href: 'lunbotu_add.jsp'},
                                        {id: 'a61', text: '轮播图查询', href: 'lunbotu_list.jsp'},
                        ]
        },


    ]}];
</script>
