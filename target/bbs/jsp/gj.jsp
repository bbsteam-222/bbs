<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>组合查询</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style type="text/css">
        table {
            color: #404040;
            font-size: 10pt;
        }
    </style>
</head>

<body>
<form action="<c:url value='/search/findTopicByMulity.action'/>" method="post" accept-charset="UTF-8">
    <input type="hidden" name="method" value="findByCombination"/>
    <table align="center">
        <tr>
            <td>帖子名：</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>作者：</td>
            <td><input type="text" name="uid"/></td>
        </tr>
        <tr>
            <td>版块：</td>
            <td><input type="text" name="block"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" value="搜　　索"/>
                <input type="reset" value="重新填写"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

