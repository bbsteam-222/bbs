<script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<%--
  Created by IntelliJ IDEA.
  User: linpeng
  Date: 2017/12/10
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>

    <script type="text/javascript">
        function setActiveStyleSheet(title) {
            var i, a, main;
            for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
                if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
                    a.disabled = true;
                    if(a.getAttribute("title") == title) a.disabled = false;
                }
            }
        }

        function getActiveStyleSheet() {
            var i, a;
            for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
                if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title") && !a.disabled) return a.getAttribute("title");
            }
            return null;
        }

        function getPreferredStyleSheet() {
            var i, a;
            for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
                if(a.getAttribute("rel").indexOf("style") != -1
                    && a.getAttribute("rel").indexOf("alt") == -1
                    && a.getAttribute("title")
                ) return a.getAttribute("title");
            }
            return null;
        }

        function createCookie(name,value,days) {
            if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
            }
            else expires = "";
            documents.cookie = name+"="+value+expires+"; path=/";
        }

        function readCookie(name) {
            var nameEQ = name + "=";
            var ca = documents.cookie.split(';');
            for(var i=0;i < ca.length;i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1,c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
            }
            return null;
        }

        window.onload = function(e) {
            var cookie = readCookie("style");
            var title = cookie ? cookie : getPreferredStyleSheet();
            setActiveStyleSheet(title);
        }

        window.onunload = function(e) {
            var title = getActiveStyleSheet();
            createCookie("style", title, 365);
        }

        var cookie = readCookie("style");
        var title = cookie ? cookie : getPreferredStyleSheet();
        setActiveStyleSheet(title);
    </script>


</head>
<body bgcolor="#ddd" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="checkCookie()">
<form action="${pageContext.request.contextPath}/insertReply.action" methd="post">
    <input type="hidden" name="username" value="${sessionScope.sessionUser.username}" />
    <input type="hidden" name="tid" value="${sessionScope.sessionTopic.tid}" />

    <div id="middle" class="auto2">

        <div class="control_area" height="30">
                <div class="control">
                    <ul>

                    </ul>



                </div>
        </div>
        <br/>

        <br/>
        <div class="detailed">
            <table  border='0' cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td class="left">
                        <div class="user_head">
                            <img src="<c:url value='/images/people.png'/>">
                        </div>
                        <div class="user_name">

                            <label>${sessionScope.sessionTopic.user.username}</label>
                        </div>
                    </td>
                    <td class="right">
                        <div class="time">
                            <p>
                                <font>
                                    发表于：
                                    <fmt:formatDate value="${sessionScope.sessionTopic.time}" pattern="yyyy-MM-dd HH-mm"/>
                                </font></p>
                        </div>
                        <div class="post_body">
                            <br>
                            <strong>${sessionScope.sessionTopic.title}</strong>
                            <br>
                            ${sessionScope.sessionTopic.context}

                            <br>

                        </div>

                    </td>
                </tr>
                </tbody>
                <p class="c-666 f-mt30 f-mb50"><a href="<c:url value='/showReplyDetial.action'/>" class="c-blue">查看回复</a></p>
            </table>

            <c:forEach items="${replyList}" var="reply">
                <table  border='0' cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td class="left">
                            <div class="user_head">
                                <img src="<c:url value='/images/5.jpg'/>">
                            </div>
                            <div class="user_name">
                                <a  target="_blank" title="yonghuming">${reply.user.username}</a>
                            </div>
                        </td>
                        <td class="right">
                            <div class="time">
                                <p>
                                    <font>
                                        回复于： <fmt:formatDate value="${reply.rtime}" pattern="yyyy-MM-dd HH-mm"/>

                                    </font></p>
                            </div>
                            <div class="post_body_reply">
                                <br>
                                <font >&nbsp;&nbsp;${reply.context}</font>
                            </div>

                            <div class="reply">
                                <p>
                                    <font>
                                        <%--引用--%>
                                    </font></p>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </c:forEach>
        </div>
        <div class="control_area" height="30">

                <div class="page_nav">

                </div>
        </div>
        <div class="comt">

                <div class="editor">
                    <div id="markItUpPost_body" class="markItUp">
                        <div class="tab">
                            <ul>
                                <li class="hover">
                                    <span>编辑</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="markItUpContainer">
                        <%--<div class="markItUpHeader">
                            <label class="red"><span>${errors.context}</span></label>

                        </div>--%>
                        <script type="text/javascript">
                            //KindEditor脚本
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('#post_body', {
                                    items:[
                                        'fontname','fontsize','|','forecolor', 'hilitecolor','bold','italic',
                                        'underline', 'removeformat', '|', 'justifyleft', 'justifycenter'
                                    ]
                                });
                            });
                        </script>
                        <textarea class="markItUpEditor" cols="40" id="post_body" name="context" rows="20" style="width: 100%; height: 200px; word-break: break-all; word-wrap: break-word;; font-family: Helvetica"></textarea>

<c:choose>
    <c:when test="${empty sessionScope.sessionUser }">
        &nbsp;&nbsp;&nbsp;
        <label class="red"><span>登录后才能发表回复哦</span></label>
    </c:when>
    <c:otherwise>
                        <div class="pub">

                            <input class="btn_b"  type="submit" value="提交回复" style="margin-top: 10px">
                            <label class="red"><span>${errors.ReplyContext}</span></label>
                        </div>
    </c:otherwise>
</c:choose>
                    </div>
                    <ol class="notice">

                    </ol>

                </div>

        </div>
    </div>
</form>

</body>
</html>
