<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/10
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js>
<head>

<meta charset="utf-8">
<title>diy论坛登陆</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<%--<meta http-equiv="pragma" content="no-cache">--%>
<%--<meta http-equiv="cache-control" content="no-cache">--%>
<%--<meta http-equiv="expires" content="0">--%>
<%--<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
<%--<meta http-equiv="description" content="This is my page">--%>
<%--<meta http-equiv="content-type" content="text/html;charset=utf-8">--%>
<%--<!----%>
<%--<link rel="stylesheet" type="text/css" href="styles.css">--%>
<%---->--%>
<%--<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>">--%>
<%--<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/jsps/js/user/login.js'/>"></script>--%>
<%--<script src="<c:url value='/js/common.js'/>"></script>--%>


<link rel="stylesheet" type="text/css" href="<c:url value="/jsp/css/supersized.css"/> ">
<link rel="stylesheet"type="text/css" href="<c:url value="/jsp/css/login.css"/> ">
<link href="<c:url value="/jsp/css/bootstrap.min.css"/> "type="text/css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/jsp/js/html5.js"></script>
<![endif]-->
<%--<script src="jsp/js/jquery-1.8.2.min.js"></script>--%>
<%--<script type="text/javascript" src="jsp/js/jquery.form.js"></script>--%>
<%--<script type="text/javascript" src="jsp/js/tooltips.js"></script>--%>
<%--<script type="text/javascript" src="jsp/js/login.js"></script>--%>
<script  type="text/javascript" src="<c:url value="/jsp/js/jquery-1.8.2.min.js"/> "></script>
<script type="text/javascript" src="<c:url value="/jsp/js/jquery.form.js"/> "></script>
<script type="text/javascript" src="<c:url value="/jsp/js/tooltips.js"/> "></script>
<script type="text/javascript" src="<c:url value="/jsp/js/login.js"/> "></script>

</head>


<body>

<div class="page-container">
    <div class="main_box">
        <div class="login_box">
            <div class="login_logo">
                <%--<img src="/images/logo.png" >--%>
                    DIY论坛

            </div>

            <div class="login_form">

                <form action="<c:url value="/login.action"/> " method="post">
                    <div class="form-group">
                        <label >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${msg}</label>
                    </div>
                    <div class="form-group">
                        <label for="loginname" class="t">用户名：</label>
                        <input id="loginname" value="" name="loginname" type="text"  value="${user.username}" class="input"
                               autocomplete="off">
                        <td >
                        <td height="20">&nbsp;</td>
                            <label id="loginnameError">${errors.username}</label>
                        </td>
                    </div>
                    <div class="form-group">
                        <label for="loginpass" class="t">密　码：</label>
                        <input id="loginpass" value="" name="loginpass" type="password"  value="${user.password}" class="input">
                        <td>
                        <td height="20">&nbsp;</td>
                            <label id="loginpassError">${errors.password}</label>
                        </td>
                    </div>
                    <div class="form-group">
                        <label for="verifyCode" class="t">验证码：</label>
                        <input id="verifyCode" name="verifyCode" type="text" class="input"  value="${user.verifyCode}">

                        <img id="vCode" src="${pageContext.request.contextPath}/captcha/getCaptchaImage.action"/>
                        <a id="hzt" href="javascript:_hzt()">换张图</a>
                        <tr>
                            <td height="20px">&nbsp;</td>
                            <td><label id="verifyCodeError" class="error">${errors.verifyCode}</label></td>
                        </tr>
                    </div>
                    <div class="form-group">
                        <label class="t"></label>
                        <label for="j_remember" class="m">
                            <input id="j_remember" type="checkbox" value="true">&nbsp;记住登陆账号</label>
                        <label class="t"></label>
                        <label for="" class="m">
                            <input id="" type="checkbox" value="true">&nbsp;注册</label>
                    </div>
                    <div class="form-group space">
                        <label class="t"></label>　　　
                        <button type="submit"  id="submit_btn"
                                class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp </button>
                        <input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
                    </div>
                </form>
            </div>
        </div>
        <div class="bottom">Copyright &copy; 2017 - 2018</div>
    </div>
</div>

<!-- Javascript -->

<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/scripts.js"></script>

</body>
</html>