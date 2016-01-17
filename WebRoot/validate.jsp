<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>已登录</title>
</head>

<body>
	    <jsp:useBean id="user" class="lyons.entity.User"></jsp:useBean>
	    <jsp:useBean id="userDao" class="lyons.dao.UserDao"></jsp:useBean>
	    <jsp:setProperty property="*" name="user" />
	
	    <%
	    	//out.println(user.getUserName()); //能正确打印出来
	    	//out.println(user.getUpassWd());	//能正确打印出来
	    	
	
	    	
	    	if(userDao.login(user))
	    	{
	    		session.setAttribute("userlogin",user);
	    	%>
	    		<jsp:forward page="main/main.jsp"></jsp:forward>
	    	<%}else
	    		{%>
	    			<jsp:forward page="index.jsp"></jsp:forward>
	    		<%}
	    %>
</body>
</html>