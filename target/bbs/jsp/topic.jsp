<%--
  Created by IntelliJ IDEA.
  User: linpeng
  Date: 2017/12/9
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<c:url value='/kindeditor/kindeditor-all.js'/> "></script>
<script type="text/javascript" src="<c:url value='/kindeditor/lang/zh-CN.js'/> "></script>
<script type="text/javascript">
    //KindEditor脚本
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('#content1', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageRemote : false,
            allowImageUpload : true,//允许上传图片
            allowFileManager:true, //允许对上传图片进行管理
            uploadJson : "<c:url value='/kindeditor/fileUpload.action'/> ",
            /*fileManagerJson : 'controller/KindEditionController/fileManager',*/
            afterUpload: function(){this.sync();}, //图片上传后，将上传内容同步到textarea中
            afterBlur:  function(){this.sync();},   ////失去焦点时，将上传内容同步到textarea中
            items:[
                'fontname','fontsize','|','forecolor', 'hilitecolor','bold','italic',
                'underline', 'removeformat', '|', 'justifyleft', 'justifycenter','|','image'
            ]
        });
    });
</script>

<html>
<head>
    <meta charset="utf-8">
    <title>发表新话题</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/send.css'/>"/>
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


<body bgcolor="#ddd" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="${pageContext.request.contextPath}/topicSubmit.action" method="post">
    <input type="hidden" name="username" value=${sessionScope.sessionUser.username} />

    <div id="middle" class="auto3">
        <div class="bread_nav">
            <%--<a href="/" target="_blank">发帖</a>--%>

        </div>
        <br/>

        <br/>
            <div class="detailed">
                <table  border='0' cellspacing="0" cellpadding="0" width="100%">
                    <tbody>
                    <tr>
                        <th class="left">文章标题</th>
                        <td class="right">
                            <label>
                                <input type="text" name="title" value="${topic.title}" autocomplete="off" class="required" id="topic_title" maxlength="80" size="60">
                                <span id="title_count_notice" class="red">${errors.title}</span>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th class="left" valign="top">
                            文章内容
                        </th>
                        <td>
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



                                    <textarea class="markItUpEditor" cols="40" id="content1" name="context" rows="20" style="width: 100%; height: 300px; word-break: break-all; word-wrap: break-word;; font-family: Helvetica">

                                    </textarea>
                                    <%--<label class="red"><span>${errors.context}</span></label>--%>

                                </div>


                            </div>
                        </td>
                    </tr>
<%--

                    <tr>
                        <th class="left">标签</th>
                        <td class="right">
                            <input type="hidden" name="topic[cached_tag_list]" id="topic_cached_tag_list">
                            <div id="tags" class="tag_input tag">
                                <input type="text" value size="1">
                                <div class="tag tag_reco" style="display: none;">
                                    <table>
                                        <tbody>
                                        <tr>
                                            <th>推荐标签：</th>
                                            <td class="tagWrap tracking-ad" data-mod="popu_73"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <em class="content"></em>
                            </div>
                            <span class="red">最多添加五个标签，多个标签之间用“,”（英文逗号）分隔</span>
                        </td>
                        <script id="countTemplate" type="text/x-jquery-tmpl">
									你还可以输入 $(count) 个字符
								</script>
                    </tr>
--%>

                    <tr>
                        <th class="left">选择板块</th>
                        <td class="right">
                            <select name="block">
                                <option value="0"></option>
                                <option value="体育">体育</option>
                                <option value="新闻">新闻</option>
                                <option value="娱乐">娱乐</option>
                                <option value="科技">科技</option>
                                <option value="健身">健身</option>
                                <option value="旅行">旅行</option>

                            </select>

                            <label class="red">请选择所要发帖的版块</label>


                        </td>
                    </tr>
                    <%--<script id="selectForumTemplate" type="text/x-jquery-tmpl">
								<option value="">${notice}</option>
								{{each forums}}
									<option data-tech-forum="${$value.tech_forum}" value="${${value.urlname}" data-max-point="${$value.name"></option>
        {{/each}}
                </script>--%>

<%--

                    <tr>
                        <th class="left">验证码</th>
                        <td class="right">
                            <span class="captcha">
                                <input type="text" name="captcha" autocomplete="off" id="captcha">
                                <input type="hidden" name="captcha_key" id="captcha_key" value="2fb7ae6e84164df817d8f5062342feab31f7078a">
                                <img alt="captcha" src="captcha.jpg">
                            </span>
                            <span>
                                <button class="refresh-captcha" name="button" type="submit">刷新校验码</button>
                            </span>
                        </td>
                    </tr>
--%>

                    <tr>
                        <th class="left">&nbsp;</th>
                        <td class="right">
                            <div class="pub">
                                <input class="btn_b" id="dubmit_new_post_form" name="commit" type="submit" value="发表帖子" style="margin-top: 10px">
                            </div>

                        </td>
                    </tr>

        </tbody>
        </table>
            </div>
        </div>

    </div>

</form>


</body>
</html>
