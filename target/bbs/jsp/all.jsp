<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>帖子列表</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsp/css/list.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsp/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsp/pager/pager.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jsp/js/topic/list.js'/>"></script>

</head>

<body>

<ul>

    <div class="inner">
        <c:forEach items="${allTopic}" var="topic">


            <a class="pic" href="<c:url value='/search/showAllTopic.action'/>"></a>
            <tr>
                <table width="300"height="20"border="10">
                <td width="200px">标题：<a href="<c:url value='/showDetial.action?tid=${topic.tid}'/>">${topic.title}</a></td></table>
                    <%--<td width="320px">标题：${topic.title}</td>--%>
                    <%--<td width="200px">内容：${topic.context}</td>--%>
                <td width="100px">作者：${topic.user.username}</td>
                <td width="100px">版块：${topic.block}</td>
            </tr>


        </c:forEach>
    </div>



</ul>

<%--
<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsp/pager/pager.jsp" %>
</div>
--%>

</body>

</html>

