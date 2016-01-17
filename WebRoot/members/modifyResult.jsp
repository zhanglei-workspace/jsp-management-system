<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="../islogin.jsp"></jsp:include>
<body>
	<% request.setCharacterEncoding("UTF-8"); //处理乱码问题。另外，未将汉字此处理会因乱码造成字符过大 %>
	<jsp:useBean id="userInfo" class="lyons.entity.UserInfo" ></jsp:useBean>
	<jsp:setProperty property="*" name="userInfo"/>
	<jsp:useBean id="modifyInfo" class="lyons.dao.UserDao"></jsp:useBean>
	<% 
		if(modifyInfo.modifyMember(userInfo))
		{
			out.write("success");
		}else
			{
				out.print("error");
			}
	%>
</body>
</html>