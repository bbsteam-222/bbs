<%--
  Created by IntelliJ IDEA.
  User: linpeng
  Date: 2017/12/22
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>注册</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/gloab.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/register.js"></script>
    </head>
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
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>2</i></span>
                        <span class="line_bg lbg-l"></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">验证账户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>3</i></span>
                        <span class="line_bg lbg-l"></span>
                        <p class="lbg-txt">注册成功</p>
                    </li>
                </ul>
            </div>

            <div class="alert alert-info" style="width:700px">需要去邮箱验证该用户。</div>
            <div class="item col-xs-12 f-mb10" style="height:auto">
                <span class="intelligent-label f-fl">已将信息发送给该用户，请到邮箱激活账号</span>
                <div class="f-fl item-ifo c-blue">
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <div class="f-fl item-ifo">
                            <a href="http://mail.qq.com/" class="btn btn-blue f-r3" id="btn_part2">去激活</a>
                            <a href="<c:url value='/jsp/login.jsp'/>" class="btn btn-blue f-r3" id="btn_part3">已激活，去登陆</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){

        //第二页的确定按钮
        $("#btn_part2").click(function(){
            if(!verifyCheck._click()) return;
            $(".part2").hide();
            $(".part3").show();
        });

    });
    function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
    function closeClause(){
        $(".m-sPopBg,.m-sPopCon").hide();
    }
</script>
</body>
</html>
