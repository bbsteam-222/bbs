<%--<!DOCTYPE type>--%>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--帖子管理界面--%>
    <meta charset="utf-8">
    <title>管理员界面</title>
    <%--<link rel="stylesheet" type="text/css" href="admin.css">--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admin.css'/>"/>

</head>
<body class="my" bgcolor="#FFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div class="header">
    <img class="logo"  height="60">
    <div id="pull-right" class="pull-right">
        <ul id="btns" class="btns">
            <%--<li class="search">
                <div class="icon on-search-icon">
                    <div class="wrap">
                        <form action=".../search" method="get" target="_blank">
                            <input type="hidden" value="toolbar" accesskey="2" name="ref">
                            <div class="border">
                                <input type="text" name="q" placeholder="搜索" accesskey="2">
                                <span class="icon-enter-sm"></span>
                            </div>
                        </form>
                    </div>
                </div>
            </li>
            <li class="ugc">
                <div class="icon on-ugc-icon">
                    <div class="wrap clearfix">
                        <dl>
                            <dt style="border:none;">
                                <a href=".../new_topic" target="_blank" class="p-doc clearfix">
                                    <em class="icon"></em>
                                    <span>发帖</span>
                                </a>
                            </dt>
                        </dl>
                    </div>
                </div>
            </li>--%>
            <li class="profile">
                <div class="icon on-profile-icon">
                    <img src="<c:url value='/images/person_unclick.png'/>" class="curr-icon-img">
                </div>
                <div class="wrap person">
                    <div class="bd">
                        <dl class="clearfix">
                            <dd class="info" style="border:none;">
									<span class="dec">
										<a href="./jsp/main.jsp" class="fill-dec" target="_blank">退出</a>
										<span class="write-icon"></span>
									</span>
                            </dd>
                        </dl>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        //nameSpace
        var VVG = {};
        VVG.DOM = {};
        //创建getElementsByClassName方法
        VVG.DOM.getElementsByClassName = function(str,parent,tag){
            //父节点存在
            if(parent){
                // 当父节点为string类型时，查找DOM节点，否则直接引用parent
                parent = typeof parent == "string" ? document.getElementById(parent):parent;
                // parent为空时提示错误信息
                if(!parent) alert("找不到标签，请检查参数是否正确");
            }else{
                // 未传值时，父节点为body
                parent = document.body;
            }
            // tagContent为节点类型，未传值时为all节点
            tag = tag || "*";
            // 在父节点查找子节点，建立空数组arr
            var els = parent.getElementsByTagName(tag),arr=[];
            for(var i=0,n=els.length;i<n;i++){
                // 查找每个节点下的classname，以空格分离为一个k数组
                for(var j=0,k=els[i].className.split(" "),l=k.length;j<1;j++){
                    // 当K数组中有一个值与str值相等时，记住这个标签并推入arr数组
                    if(k[j]==str){
                        arr.push(els[i]);
                        break;
                    }
                }
            }
            // 返回数组
            return arr;
        }
        //创建TabManager对象
        VVG.TabManager = function(oo){
            this.root = oo.root || "warp";
            this.tabUlId = oo.tabUlId||"tabUlId";
            this.tabConId = oo.tabConId||"tabConId";
            this.tabConClass = oo.tabConClass||"J_tabClass";
            this.trggle = oo.trggle || "click";
            this.currentCss = oo.currentCss || "current";
        }
        VVG.TabManager.prototype = {
            tabChange:function(){
                // 获取UL的id
                var ulid = document.getElementById(this.tabUlId);
                // 获取UL下的LI元素
                var ulli = ulid.getElementsByTagName("li");
                // 获取内容盒子DIV元素
                var tabConId = document.getElementById(this.tabConId);
                // 获取root下的div的class为特定值的对象数组
                var tabConClasses = VVG.DOM.getElementsByClassName(this.tabConClass,this.root,"div");
                // 初始化
                ulli[0].className = this.currentCss;
                tabConClasses[0].style.display = 'block';
                for (var i = ulli.length - 1; i >= 0; i--) {
                    // 赋值this 与 that,避免this混乱
                    var that = this;
                    // 设置对象index属性
                    ulli[i].index = i;
                    // 设置对象的事件
                    ulli[i]["on" + this.trggle] = function(){
                        for(var j = tabConClasses.length - 1; j >= 0; j--){
                            tabConClasses[j].style.display = "none";
                            ulli[j].className = "";
                        }
                        tabConClasses[this.index].style.display = "block";
                        this.className = that.currentCss;
                    }
                }
            }
        }
        // 新建对象实例
        var TabManager1 = new VVG.TabManager(
            {
                root:"pull-right",//包裹tab对象的div层的ID名称，必填
                tabUlId:"btns",//TAB标签LI元素的父亲UL元素的ID名称，必填
                tabConId:"btns",//内容元素的包裹盒子的ID名称，必填
                trggle:"mouseover",//切换方式，默认为click，可选
                currentCss:"on",//TAB标签liy元素的当前CSS名称，默认为current
                tabConClass:"wrap",//内容元素的CLASS名称，默认为J_tabClass
            }
        );
        // 调用对象方法
        TabManager1.tabChange();
    </script>
</div>

<div id="top" class="auto" align="center">
    <div class="nav2">
        <div class="mainnav">
            <ul>
                <li><a href="./jsp/main.jsp">首页</a></li>
                <li class="a"><a href="">管理员界面</a></li>

            </ul>
        </div>
    </div>
</div>
<div class="auto4">
    <div class="person_info_con">
        <dl class="person_photo">
            <img src="<c:url value='/images/people.png'/>">
        </dl>
        <dl class="person_info">
            <dt class="username">
                <span>management:${sessionScope.sessionUser.username}</span>
            </dt>
            <dd class="person_Email">
                <span>邮箱地址：</span>${sessionScope.sessionUser.email}&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="<c:url value='/images/edit.png'/>">
            </dd>
            <%--<dd class="mod_password">
                <img src="<c:url value='/images/mod_password.png'/>">
                <a href="file:///G:/project/2202/2202/csdn/csdn/mod.html" target="_blank">修改密码</a>

            </dd>--%>
            <dd>
                <%--<form name="fm" id="fm" action="${pageContext.request.contextPath}/showAllPosts.action" method="post">
                    <a href=""><b>板块选择</b></a>
                    <select  onChange = "select()" id = "block1" name="block">  &lt;%&ndash;&ndash;%&gt;
                        <option value="0"></option>
                        <option value="体育">体育</option>
                        <option value="新闻">新闻</option>
                        <option value="娱乐">娱乐</option>
                        <option value="科技">科技</option>
                        <option value="健身">健身</option>
                        <option value="旅行">旅行</option>
                    </select>
                    &lt;%&ndash; <script>
                         window.onload = function(){
                             var param = document.getElementById("block1");
                             param.onChange = getParam(){
                                 var index = param.selectedIndex;
                                 var block = param.options[index].value;
                             }
                         }
                     </script>&ndash;%&gt;
                    &lt;%&ndash;<span><a href="<c:url value='/showBlockAllUser.action?block='/>" style="width:449px;margin-right:30px ">
                        确定</a><br/></span>&ndash;%&gt;
                    <input type="submit" name="btn3" value="确定"/>--%>
                    <span>(您是管理员，有以下权限）</span>
                <%--</form>--%>
            </dd>
        </dl>
    </div>
    <div class="persion_selection">
        <div id="warp" class="person_detail_tab">
            <ul id="tag">

                <li data-modal="tab"><a href="./jsp/admin.jsp">用户管理</a></li>
                <li data-modal="tab">帖子管理</li>

            </ul>
            <div id="tagContent">
                <div class="J_tabClass"><!--用户发的所有帖子，滚动条进行翻页-->
                    <div class="A">
                        <h2>用户名</h2>
                        <h2>用户类型</h2>
                    </div>
                    <div class="A">
                        <c:forEach items="${blockAllUser}" var="item">
                            <tr>
                                <td><input type="text" name="username" id="username" value="${item.username}" style="margin-right:240px "/><br/></td>
                                <td><input type="text" name="moderator" id="type" value="${item.moderator}" style="margin-right:240px "/><br/></td>
                                <td><a href="<c:url value='/modifyUserToMode.action?block=${blocks.block}&&moderator=${item.moderator}'/>" >设置版主</a><br/></td>
                                <span class="pipe">|</span>
                                <td><a href="<c:url value='/modifyUserToMode.action?block=${blocks.block}&&moderator=${item.moderator}'/>">撤销版主</a><br/></td>
                                <span class="pipe">|</span>
                                <td><a href="<c:url value='/deleteUser.action?block=${blocks.block}&&username=${item.username}'/>" >删除</a><br/></td>
                            </tr>
                        </c:forEach>
                    </div>
                </div>
                <div class="J_tabClass"> <!--用户发出的对某个帖子的评论，某某某应该是帖子的名字-->
                    <%--<div class="B">--%>
                    <div class="A">
                        <form name="fm" id="fm" action="${pageContext.request.contextPath}/showAllPosts.action" method="post">
                            <tr>
                                <%--<a href="<c:url value='/showAllPosts.action?button=allPosts'/>" >--%>
                                <input type="radio" name = "button" id ="radio1" value="所有帖子" style="margin-left: 200px">所有帖子
                                <%--</a>--%>
                                <input type="radio" name = "button" id ="radio2" value="待审核的帖子" style="margin-left: 200px">待审核的帖子
                                <input type="radio" name = "button" id ="radio3" value="已审核的帖子" style="margin-left: 200px">已审核的帖子
                                <input type="submit" name="btn3" value="确定"/>
                            </tr>
                        </form>
                        <%--</div>--%>

                        <tr>
                            <h2>帖子</h2>
                            <h2>版块</h2>
                            <c:if test="${button.equals('所有帖子')}"><h2>状态</h2></c:if>
                            <h2>操作</h2>
                        </tr>
                    </div>
                    <div class="A">

                        <c:forEach items="${allPosts}" var="item">
                            <tr>
                                <td><a href="<c:url value='/showDetails.action?title=${item.title}&&context=${item.context}'/>" >
                                    <input type="text" name="title" id="title" value="${item.title}" style="margin-right:240px ">
                                </a></td>
                                <td>
                                    <input type="text" name="block" id="block" value="${item.block}" style="margin-right:240px ">
                                </td>
                                <c:if test="${button.equals('所有帖子')}">
                                    <td>
                                        <input type="text" name="tstatus" id="tstatus"
                                               <c:if test="${item.tstatus==0}">value="未审核"</c:if>
                                               <c:if test="${item.tstatus==1}">value="已通过"</c:if>
                                               <c:if test="${item.tstatus==-1}">value="未通过"</c:if>
                                               style="margin-right:240px ">
                                    </td>
                                </c:if>

                                <td><input type="hidden" name="context" id="context" value="${item.context }"/></td>
                                <span class="pipe">|</span>
                                <td>
                                    <a href="<c:url value='/showDetails.action?title=${item.title}'/>"
                                       style="margin-left: 50px" >
                                        <input type="button" name="check" id="check"
                                        <c:if test="${item.tstatus!=0}">
                                               disabled="true" style="background: #5e5e5e"
                                        </c:if>
                                               value="审核">
                                    </a>
                                </td>

                                <span class="pipe">|</span>
                                    <%--<td><a href="<c:url value='/showNeedToModify.action?title=${item.title}'/>" style="margin-left: 50px">更改</a></td>--%>
                                <script type="text/javascript" language="JavaScript">
                                    function confirmAct() {
                                        if(confirm('确定要执行删除操作？')){
                                            var pass = prompt("请输入登录密码：");
                                            var tid = "${item.tid}";
                                            if(pass == null){
                                                alert('你取消了输入密码');
                                            }else if(pass == ''){
                                                alert('密码输入为空！');
                                            }else{
                                                alert('确认！');
                                                window.location.href="http://localhost:8080/bbs/deletePostById.action?pass="+pass+"&&tid="+tid;
                                                alert('${passError}');
                                            }
                                            return true;
                                        }
                                        alert("您已取消删除！");
                                        return false;

                                    }
                                </script>
                                <td>
                                    <input name ="delete" type="button" onclick="return confirmAct()" value="删除" />
                                </td>
                            </tr>
                        </c:forEach>
                    </div>
                    <script type="text/javascript">
                        //nameSpace
                        var VVG = {};
                        VVG.DOM = {};
                        //创建getElementsByClassName方法
                        VVG.DOM.getElementsByClassName = function(str,parent,tag){
                            //父节点存在
                            if(parent){
                                // 当父节点为string类型时，查找DOM节点，否则直接引用parent
                                parent = typeof parent == "string" ? document.getElementById(parent):parent;
                                // parent为空时提示错误信息
                                if(!parent) alert("找不到标签，请检查参数是否正确");
                            }else{
                                // 未传值时，父节点为body
                                parent = document.body;
                            }
                            // tagContent为节点类型，未传值时为all节点
                            tag = tag || "*";
                            // 在父节点查找子节点，建立空数组arr
                            var els = parent.getElementsByTagName(tag),arr=[];
                            for(var i=0,n=els.length;i<n;i++){
                                // 查找每个节点下的classname，以空格分离为一个k数组
                                for(var j=0,k=els[i].className.split(" "),l=k.length;j<1;j++){
                                    // 当K数组中有一个值与str值相等时，记住这个标签并推入arr数组
                                    if(k[j]==str){
                                        arr.push(els[i]);
                                        break;
                                    }
                                }
                            }
                            // 返回数组
                            return arr;
                        }
                        //创建TabManager对象
                        VVG.TabManager = function(oo){
                            this.root = oo.root || "warp";
                            this.tabUlId = oo.tabUlId||"tabUlId";
                            this.tabConId = oo.tabConId||"tabConId";
                            this.tabConClass = oo.tabConClass||"J_tabClass";
                            this.trggle = oo.trggle || "click";
                            this.currentCss = oo.currentCss || "current";
                        }
                        VVG.TabManager.prototype = {
                            tabChange:function(){
                                // 获取UL的id
                                var ulid = document.getElementById(this.tabUlId);
                                // 获取UL下的LI元素
                                var ulli = ulid.getElementsByTagName("li");
                                // 获取内容盒子DIV元素
                                var tabConId = document.getElementById(this.tabConId);
                                // 获取root下的div的class为特定值的对象数组
                                var tabConClasses = VVG.DOM.getElementsByClassName(this.tabConClass,this.root,"div");
                                // 初始化
                                ulli[0].className = this.currentCss;
                                tabConClasses[0].style.display = 'block';
                                for (var i = ulli.length - 1; i >= 0; i--) {
                                    // 赋值this 与 that,避免this混乱
                                    var that = this;
                                    // 设置对象index属性
                                    ulli[i].index = i;
                                    // 设置对象的事件
                                    ulli[i]["on" + this.trggle] = function(){
                                        for(var j = tabConClasses.length - 1; j >= 0; j--){
                                            tabConClasses[j].style.display = "none";
                                            ulli[j].className = "";
                                        }
                                        tabConClasses[this.index].style.display = "block";
                                        this.className = that.currentCss;
                                    }
                                }
                            }
                        }
                        // 新建对象实例
                        var TabManager1 = new VVG.TabManager(
                            {
                                root:"warp",//包裹tab对象的div层的ID名称，必填
                                tabUlId:"tag",//TAB标签LI元素的父亲UL元素的ID名称，必填
                                tabConId:"tagContent",//内容元素的包裹盒子的ID名称，必填
                                trggle:"click",//切换方式，默认为click，可选
                                currentCss:"current",//TAB标签liy元素的当前CSS名称，默认为current
                                tabConClass:"J_tabClass",//内容元素的CLASS名称，默认为J_tabClass
                            }
                        );
                        // 调用对象方法
                        TabManager1.tabChange();

                    </script>
                </div>
            </div>
            <!-- 父层 -->
        </div>
    </div>
</div>
</body>
</html>
<%--D:\workspace\IDEA\bbs\src\main\webapp\jsp\adminTopic.jsp--%>