<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>模糊查询</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style type="text/css">
        body {
            margin-top: 5px;
            margin-bottom: 0px;
            margin-left:200px;
            color: #404040;
        }
        textarea{
            font-size: 100px;
            font-weight: 300;
        }
        input {
            width: 300px;
            height: 30px;

            border-style:overflow-x:hidden;overflow-y: auto;
            margin:0px;
            border-color: #404040;
        }
        a {
            text-transform:none;
            text-decoration:none;
            border-width: 0px;
        }
        a:hover {
            text-decoration:underline;
            border-width: 0px;
        }
        span {
            margin: 0px;
        }
    </style>
</head>

<body>
<form action="<c:url value='/search/showByVague.action'/>" method="post" accept-charset="UTF-8" target="body" id="form1">
    <%--<input type="hidden" name="method" value="showByTitle"/>--%>
    <input type="text" name="context"/>
        <span>
    		<a href="javascript:document.getElementById('form1').submit();">
                <img align="top" border="0" src="<c:url value='/images/btn.jpg'/> "></a>

    		<a href="<c:url value='/jsp/gj.jsp'/>" style="font-size: 10pt; color: #404040;" target="body">高级搜索</a>
    	</span>
</form>

</body>
</html>