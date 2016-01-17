<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>main</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<jsp:include page="../islogin.jsp"></jsp:include>
<body>
	<a href="../members/userInfoPage.jsp" target="main_right">录入会员信息</a><br/> <!-- 相对路径 -->
	<a href="../members/displaymember.jsp" target="main_right">查看会员信息</a><br/>
	<a href="../exit.jsp" target="_top">退出</a>
</body>
</html>