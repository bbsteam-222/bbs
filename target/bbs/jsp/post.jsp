<!DOCTYPE type>
<html>
<head>
	<meta charset="utf-8">
	<title>修改帖子</title>
	<%--<link rel="stylesheet" type="text/css" href="send.css">
	<link rel="stylesheet" type="text/css" href="main.css" title="main"/>--%>
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
<body bgcolor="#FFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


	<div id="middle" class="auto3">	
		<div class="bread_nav">
			<font size="3" color="black"><b>发帖</b></font>


		</div>
 		<br/>

		<br/>
		<form accept="utf-8" action="/topics" class="publish" id="new_topic" method="post" novalidate="novalidate">
			<div class="detailed">
				<table cellspacing="0" cellpadding="0" width="100%">
						<tbody>
							<tr>
								<th class="left">文章标题</th> 
								<td class="right">
									<label>
										<input type="text" name="topic[title]" autocomplete="off" class="required" id="topic_title" maxlength="80" size="60">
										<span id="title_count_notice" class="red">你还可以输入80个字符</span>
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
											<div class="markItUpHeader">
												<ul>
													<li class="bbtn_bold">
														<a href="粗体">粗体</a>
													</li>
													<li class="bbtn_italic">
														<a href="斜体">斜体</a>
													</li>
													<li class="bbtn_underline">
														<a href="下划线">下划线</a>
													</li>
													<li class="bbtn_size">
														<a href="字体大小">字体大小</a>
													</li>
													<li class="bbtn_color">
														<a href="字体颜色">字体颜色</a>
													</li>
													<li class="bbtn_pictur">
														<a href="图片">图片</a>
													</li>
													<li class="bbtn_left">
														<a href="左对齐">左对齐</a>
													</li>
													<li class="bbtn_center">
														<a href="居中对齐">居中对齐</a>
													</li>
													<li class="bbtn_pictur">
														<a href="右对齐">右对齐</a>
													</li>
												</ul>
											</div>
											<textarea class="markItUpEditor" cols="40" id="post_body" name="post[body]" rows="20" style="width: 100%; height: 200px; word-break: break-all; word-wrap: break-word;; font-family: Helvetica"></textarea>
											
										</div>
								
								
							</div>
								</td>
							</tr>
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
							<tr>
								<th class="left">选择板块</th> 
								<td class="right">
									<select name="板块">
										<option value="0"></option>
										<option value="1">体育</option>
										<option value="2">新闻</option>
										<option value="3">娱乐</option>
										<option value="4">科技</option>
										<option value="5">健身</option>
										<option value="6">旅行</option>

									</select>

									<label class="red">请选择所要发帖的版块</label>


								</td>
							</tr>
							<script id="selectForumTemplate" type="text/x-jquery-tmpl">
								<option value="">${notice}</option>
								{{each forums}}
									<option data-tech-forum="${$value.tech_forum}" value="${${value.urlname}" data-max-point="${$value.name"></option>
									{{/each}}
							</script>


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
							<tr>
								<th class="left">&nbsp;</th> 
								<td class="right">
									<div class="pub">
										<input class="btn_b" id="revise_submit" name=" btn_submit" type="submit" value="修改" style="margin-top: 10px">
										&nbsp;&nbsp;
										<input class="btn_b" id="revise_reset" name=" btn_reset" type="reset" value="重置" style="margin-top: 10px">
									</div>

								</td>
							</tr>
								
						</tbody>
				</table>
			</div>

		</form>
	</div>		
<!-- 父层 -->  

</body>
</html>