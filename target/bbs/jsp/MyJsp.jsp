<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form>
	<%@ page contentType="text/html;charset=utf-8" %>
    <%@ page import="java.sql.*" %>
    <jsp:useBean id="database" class="com.db.DB" scope="page" />
    <% 
    ResultSet rs=null;
    String subsql=request.getParameter("u_name");//查询类型
    String subsqlvalue=request.getParameter("XXX");//查询条件
     %>
	<table height="150" class="changeTr" border="0px" >
	<div id="header" height="50">
		<tr> 
			<td class="head" rowspan="2" ><img src="#" id="head_portrait" ></td>
		</tr>
		<tr> 
			<td class="u_name" >first user（用户名）</td>
		</tr> 
			<td class="my_link" ><a href="#" >个人资料链接链接</a></td>
		</tr>
	</div>
	<div id="info" height="30" >
		<tr><td colspan="6" align="left">UID or uname</td></tr>
		<tr align="left">
			<td width="25%" >邮箱状态：</td>
			<td width="25%" >未认证</td>
			
			<td width="25%" >视频状态：</td>
			<td width="25%" >未认证</td>
		</tr>
		<%
		subsqlvalue=new String(subsqlvalue.getBytes("ISO-8859-1"));
		rs=db.getPartRs(subsql,subsqlvalue);//getPartRs()方法进行带参数的查询	
		while(rs.next){
		%>
		<tr align="left" >		
			<td width="33%" ><%="性别"+rs.getString("sex") %> </td>			
			<td width="33%" ><%="电话"+rs.getString("telephone") %></td>		
			<td><%="生日"+rs.getString("birth") %>></td>
		</tr>
	    <%}//while
	     %>
	</div>
	<div id="active_profile" height="50">
		<tr>
			<td align="left" colspan="4">活跃概况</td>
		</tr>
		<tr align="left" >
			<td width="25%" >在线时间：1 小时</td>
			<td width="25%" >注册时间：2017-09-09</td>			
			<td width="25%" >最后访问：</td>
			<td width="25%" >注册IP</td>
		</tr>
		<tr align="left">
			<td width="25%" >上次访问IP：1 小时</td>
			<td width="25%" >上次活动时间时间：2017-09-09</td>			
			<td width="25%" >上次发表时间：</td>
			<td width="25%" >所在时区：使用系统默认</td>
		</tr>
	</div>
	<div id="statistics" height="50">
		<tr>
			<td align="left" colspan="4">统计信息</td>
		</tr>
		<tr align="left">
			<td width="25%" >已用空间：0B</td>
			<td width="25%" >积分：0</td>			
			<td width="25%" >魅力值：0</td>
			<td width="25%" >贡献：0</td>
		</tr>
	</div>
		
	</table>
	<div>
		&nbsp&nbsp<input name="revise" type="button" value="修 改">&nbsp&nbsp
		<input name="submit" type="button" value="提 交">
	</div>
</form>
</body>
</html>
