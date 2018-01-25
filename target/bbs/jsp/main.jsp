<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>main</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsp/css/main.css'/>">
</head>

<body>

<table class="table" align="center">

    <tr class="trTop">
        <td colspan="2" class="tdTop">
            <iframe frameborder="0" src="<c:url value='/jsp/top.jsp'/>" name="top"></iframe>
        </td>
    </tr>
    <tr>
        <td class="tdLeft" rowspan="2">
            <iframe frameborder="0" src="<c:url value='/jsp/left.jsp'/>" name="left"></iframe>
        </td>
        <td class="tdSearch" style="border-bottom-width: 0px;">
            <iframe frameborder="0" src="<c:url value='/jsp/search.jsp'/>" name="search"></iframe>
        </td>



    </tr>
    <tr>
        <td style="border-top-width: 0px;">
            <% if((String)request.getAttribute("s") == "true") {%>
            <script type="text/javascript">
                alert('发表成功，请等待管理员审核');
            </script>
            <%}%>
            <iframe frameborder="0" src="<c:url value='/jsp/blank.jsp'/>" name="body"></iframe>
        </td>
    </tr>

</table>

</body>
</html>
