<%--
  Created by IntelliJ IDEA.
  User: linpeng
  Date: 2017/12/22
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>注册完成</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/gloab.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/register.js"></script>
</head>
<body class="bgf4">
<div class="login-box f-mt10 f-pb50">
    <div class="main bgf">
        <div class="reg-box-pan display-inline">
            <div class="step">
                <ul>
                    <li class="col-xs-4 ">
                        <span class="num"><em class="f-r5"></em><i>1</i></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">填写账户信息</p>
                    </li>
                    <li class="col-xs-4 ">
                        <span class="num"><em class="f-r5"></em><i>2</i></span>
                        <span class="line_bg lbg-l"></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">验证账户信息</p>
                    </li>
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>3</i></span>
                        <span class="line_bg lbg-l"></span>
                        <p class="lbg-txt">注册成功</p>
                    </li>
                </ul>
            </div>
            <div class="item col-xs-12 f-mb10" style="height:auto">

                <h3>恭喜，您已注册成功，去登录吧！</h3>
                <%--<p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="" class="c-blue">用户中心</a></p>--%>
                <p class="c-666 f-mt30 f-mb50"><a href="<c:url value='/jsp/login.jsp'/>" class="c-blue">登录</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    $(function(){

        //第三页的确定按钮
        $("#btn_part3").click(function(){
            if(!verifyCheck._click()) return;
            $(".part3").hide();
            $(".part4").show();
            $(".step li").eq(2).addClass("on");
            countdown({
                maxTime:10,
                ing:function(c){
                    $("#times").text(c);
                },
                after:function(){
                    window.location.href="my.html";
                }
            });
        });
    });
    function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
    function closeClause(){
        $(".m-sPopBg,.m-sPopCon").hide();
    }
</script>
</body>
</html>
