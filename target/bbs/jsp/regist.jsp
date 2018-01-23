<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linpeng
  Date: 2017/12/5
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>注册</title>
    <%--<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="<%=request.getContextPath()%>/css/gloab.css" rel="stylesheet">--%>
    <%--<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet">--%>
    <%--<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>--%>
    <%--<script src="<%=request.getContextPath()%>/js/register.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/gloab.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>"/>
    <script type="text/javascript" src="<c:url value='/js/jquery-1.11.1.min.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/js/register.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/js/regist.js'/> "></script>

</head>
<body class="bgf4">
<form id="formid" action="${pageContext.request.contextPath}/registSubmit.action" method="post">
    <input type="hidden" value="${state}" id="state" name="state" />
    <div class="login-box f-mt10 f-pb50">
        <div class="main bgf">
            <div class="reg-box-pan display-inline">
                <div class="step">
                    <ul>
                        <li class="col-xs-4 on">
                            <span class="num"><em class="f-r5"></em><i>1</i></span>
                            <span class="line_bg lbg-r"></span>
                            <p class="lbg-txt">填写账户信息</p>
                        </li>
                        <li class="col-xs-4">
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

                <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                    <div class="part1">
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>
                            <div class="f-fl item-ifo">
                                <input type="text" name="username" value="${user.username}" maxlength="20" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头"/>
                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <%--<label class="focus"><span>3-20位，字母、数字、下划线的组合，以字母开头</span></label>--%>
                                <label class="focus"><span>${errors.username}</span></label>
                                <label class="focus valid"></label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号：</span>
                            <div class="f-fl item-ifo">
                                <input type="text" name="phone" value="${user.phone}" class="txt03 f-r3 required" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11"/>
                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus">${errors.phone}</label>
                                <label class="focus valid"></label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>出生年月：</span>
                            <div class="f-fl item-ifo">
                                <div id="reg_testdate">
                                    <select name="YYYY" id="YYYY" onChange="YYYYDD(this.value)">
                                        <option value="">请选择 年</option>
                                    </select>
                                    <select name="MM" id="MM" onChange="MMDD(this.value)">
                                        <option value="">选择 月</option>
                                    </select>
                                    <select name="DD" id="DD">
                                        <option value="">选择 日</option>
                                    </select>
                                </div>


                                <script type="text/javascript">
                                  //  var reg_testdate=document.getElementById();
                                    function YYYYMMDDstart(){
                                        MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

                                        //先给年下拉框赋内容
                                        var y  = new Date().getFullYear();
                                        for (var i = (y-30); i<(y+30); i++) //以今年为准，前30年，后30年
                                            document.getElementById("YYYY").options.add(new Option(" "+ i +" 年", i));

                                        //赋月份的下拉框
                                        for (var i = 1; i < 13; i++)
                                            document.getElementById("MM").options.add(new Option(" " + i + " 月", i));

                                        document.getElementById("YYYY").value = y;
                                        document.getElementById("MM").value = new Date().getMonth() + 1;
                                        var n = MonHead[new Date().getMonth()];
                                        if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;
                                        writeDay(n); //赋日期下拉框Author:meizz
                                        document.getElementById("DD").value = new Date().getDate();
                                    }
                                    if(document.attachEvent)
                                        window.attachEvent("onload", YYYYMMDDstart);
                                    else
                                        window.addEventListener('load', YYYYMMDDstart, false);
                                    function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)
                                    {
                                        var MMvalue = document.reg_testdate.MM.options[document.getElementById("MM").selectedIndex].value;
                                        if (MMvalue == ""){ var e = document.getElementById("DD"); optionsClear(e); return;}
                                        var n = MonHead[MMvalue - 1];
                                        if (MMvalue ==2 && IsPinYear(str)) n++;
                                        writeDay(n)
                                    }
                                    function MMDD(str)   //月发生变化时日期联动
                                    {
                                        var YYYYvalue = document.getElementById("YYYY").options[document.getElementById("YYYY").selectedIndex].value;
                                        if (YYYYvalue == ""){ var e = document.getElementById("DD"); optionsClear(e); return;}
                                        var n = MonHead[str - 1];
                                        if (str ==2 && IsPinYear(YYYYvalue)) n++;
                                        writeDay(n)
                                    }
                                    function writeDay(n)   //据条件写日期的下拉框
                                    {
                                        var e = document.getElementById("DD"); optionsClear(e);
                                        for (var i=1; i<(n+1); i++)
                                            e.options.add(new Option(" "+ i + " 日", i));
                                    }
                                    function IsPinYear(year)//判断是否闰平年
                                    {
                                        return(0 == year%4 && (year%100 !=0 || year%400 == 0));
                                    }
                                    function optionsClear(e)
                                    {
                                        e.options.length = 1;
                                    }
                                </script>

                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>

                                <label class="focus valid"></label>
                            </div>
                        </div>

                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>性别：</span>
                            <div class="f-fl item-ifo">
                                <input id="man" type="radio" name="sec" value="男" checked="checked"/>男<input id="woman" type="radio" name="sec" value="女"/>女
                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>

                                <label class="focus valid"></label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>邮箱号：</span>
                            <div class="f-fl item-ifo">
                                <input type="text" name="email" value="${user.email}" class="inputClass" keycodes="ema" tabindex="2" data-valid="isNonEmpty||isEmail" data-error="邮箱号码不能为空||邮箱号码格式不正确" maxlength="20" id="email" />

                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <c:choose>
                                    <c:when test="${empty errors.password}">
                                        <label class="focus">请填写QQ邮箱</label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="focus">${errors.email}</label>
                                    </c:otherwise>
                                </c:choose>
                                <label class="focus valid"></label>
                            </div>
                        </div>

                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
                            <div class="f-fl item-ifo">
                                <input type="password" name="password" value="${user.password}" id="password" maxlength="20" class="inputClass" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                                <span class="ie8 icon-close close hide" style="right:55px"></span>
                                <span class="showpwd" data-eye="password"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <c:choose>
                                    <c:when test="${empty errors.password}">
                                        <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="focus">${errors.password}</label>
                                    </c:otherwise>
                                </c:choose>
                                <label class="focus valid"></label>
                                <span class="clearfix"></span>
                                <label class="strength">
                                    <span class="f-fl f-size12">安全程度：</span>
                                    <b><i>弱</i><i>中</i><i>强</i></b>
                                </label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
                            <div class="f-fl item-ifo">
                                <input type="password" name="repassword" value="${user.repassword}" maxlength="20" class="input" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                                <span class="ie8 icon-close close hide" style="right:55px"></span>
                                <span class="showpwd" data-eye="rePassword"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <c:choose>
                                    <c:when test="${empty errors.repassword}">
                                        <label class="focus">请再输入一遍上面的密码</label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="focus">${errors.repassword}</label>
                                    </c:otherwise>
                                </c:choose>
                                <label class="focus valid"></label>
                            </div>
                        </div>
                        <%--<div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
                            <div class="f-fl item-ifo">
                                <input type="text" maxlength="4" class="inputClass" tabindex="4" style="width:167px" id="verifyCode" data-valid="isNonEmpty" data-error="验证码不能为空" name="verifyCode" value="${user.verifyCode}" />
                                <span class="ie8 icon-close close hide"></span>
                                &lt;%&ndash;<label class="f-size12 c-999 f-fl f-pl10">
                                    <img src="images/yzm.jpg" />
                                </label>&ndash;%&gt;
                                <div id="divVerifyCode"><img id="imgVerifyCode" src="${pageContext.request.contextPath}/captcha/getCaptchaImage.action"/>
                                    <input id="timestamp" name="timestamp" value="${timestamp}" type="hidden" >
                                </div>
                                <label class="icon-sucessfill blank hide" style="left:380px"></label>
                                <label class="focusa"><a href="javascript:_hyz()">换一张</a></label>
                                <label class="focus valid" style="left:370px"></label>

                                    <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>

                            </div>
                        </div>--%>
                        <div class="item col-xs-12" style="height:auto">
                            <span class="intelligent-label f-fl">&nbsp;</span>
                            <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款">
                                <input type="checkbox" checked /><a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
                            </p>
                            <label class="focus valid"></label>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl">&nbsp;</span>
                            <div class="f-fl item-ifo">
                                <input type="submit" class="btn btn-blue f-r3" id="btn_part1" value="下一步"/>
                                <a href="<c:url value='/jsp/main.jsp'/>" id="btn_part9">返回</a>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="m-sPopBg" style="z-index:998;"></div>
            <div class="m-sPopCon regcon">
                <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
                <div class="apply_up_content">
    	<pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
                </div>
                <center><a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a></center>
            </div>
        </div>
    </div>
    </div>
</form>
</body>
</html>
