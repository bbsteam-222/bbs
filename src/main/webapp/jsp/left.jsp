<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>left</title>
    <base target="body"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsp/css/left.css'/>">
    <script language="javascript">
        /*
         * 1. 对象名必须与第一个参数相同！
         2. 第二个参数是显示在菜单上的大标题
         */
        var bar = new Q6MenuBar("bar", "论坛");
        $(function() {
            bar.colorStyle = 2;//指定配色样式，一共0,1,2,3,4
            bar.config.imgDir = "<c:url value='/menu/img/'/>";//小工具所需图片的路径
            bar.config.radioButton=true;//是否排斥，多个一级分类是否排斥

            /*
             1. 程序设计：一级分类名称
             2. Java Javascript：二级分类名称
             3. /goods/jsp/book/list.jsp：点击二级分类后链接到的URL
             4. body:链接的内容在哪个框架页中显示
             */

            bar.add("总览", "体育", "/bbs/search/showByBlock.action?block=tiyu", "body");
            bar.add("总览", "新闻", "/bbs/search/showByBlock.action?block=xinwen", "body");
            bar.add("总览", "娱乐", "/bbs/search/showByBlock.action?block=yule", "body");
            bar.add("总览", "科技", "/bbs/search/showByBlock.action?block=keji", "body");
            bar.add("总览", "健身", "/bbs/search/showByBlock.action?block=jianshen", "body");
            bar.add("总览", "旅行", "/bbs/search/showByBlock.action?block=lvyou", "body");
            $("#menu").html(bar.toString());
        });
    </script>
</head>

<body>
<div id="menu"></div>
</body>
</html>
