<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  <body>
	    	<b>超级会员登陆</b><br/><br/>
	    	<form action="validate.jsp" name="login" method="post">
	    		username：<input type="text" name="userName"><br/>	<!-- name 的值应与实体类中的变量名相同 -->
	    		password：<input type="password" name="upassWd"><br/><br/>
	    		<input type="submit"> 
	    	</form>
  </body>
</html>
