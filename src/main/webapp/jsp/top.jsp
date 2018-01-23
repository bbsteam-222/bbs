<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>top</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style type="text/css">
        body {

            background: #404040;
            margin: 0px;
            color: #ffffff;
        }
        a {
            text-decoration:none;
            color: #ffffff;
            font-weight: 900;

        }
        a:hover {
            text-decoration: underline;
            color: #ffffff;
            font-weight: 900;
        }
    </style>
</head>

<body>
<h1 style="text-align: center;">论坛</h1>
<div style="font-size: 10pt; line-height: 10px;">

    <%-- 根据用户是否登录，显示不同的链接 --%>

        <c:choose>
            <c:when test="${empty sessionScope.sessionUser }">
                <a href="<c:url value='/jsp/login.jsp'/>" target="_parent">会员登录</a> |&nbsp;
                <a href="<c:url value='/showAllTopic.action'/>" target="body">全部帖子</a>|&nbsp;
                <a href="<c:url value='/jsp/regist.jsp'/>" target="_parent">会员注册</a>
                <%--<a href="<c:url value='/jsp/topic.jsp'/>" target="_parent">用户发帖</a>--%>
            </c:when>
            <c:otherwise>
                会员：${sessionScope.sessionUser.username}&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="<c:url value='/search/myTopic.action'/>" target="body">我的帖子</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="<c:url value='/showAllTopic.action'/>" target="body">全部帖子</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="<c:url value='/jsp/topic.jsp'/>" target="body">发帖</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <%--<a href="<c:url value=''/>" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;--%>
                <a href="<c:url value='/quick.action'/>" target="_parent">退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <%--<a href="" target="_top">联系我们</a>--%>
            </c:otherwise>
        </c:choose>
</div>
</body>
</html>
