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
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="userDelete" class="lyons.dao.UserDao"></jsp:useBean>
	<% 
		if(userDelete.deleteMember(Integer.parseInt(request.getParameter("id"))))
		{
			out.write("删除成功");
		}else
			{
				out.write("删除失败");
			}
	%>
</body>
</html>