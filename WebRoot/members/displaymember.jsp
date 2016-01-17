<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lyons.entity.UserInfo"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="../islogin.jsp"></jsp:include>
<body bgcolor="	#FFBD9D">
	<jsp:useBean id="displayUserInfo" class="lyons.dao.UserDao"></jsp:useBean>
	<% 
		ArrayList<UserInfo> memberInfo = displayUserInfo.queryMemberInfo();
		Iterator<UserInfo> iterator = memberInfo.iterator();
	%>
	<table>
		<tr bgcolor="#9BCD9B">
			<td>ID</td><td>昵称</td><td>真实姓名</td><td>性别</td><td>所在专业</td><td>所选课程</td><td>兴趣</td><td>备注</td><td>Modify</td><td>Delete</td>
		</tr>
		<% 
			int i = 0; //打印时调节底色
			while(iterator.hasNext())
			{
				UserInfo userInfo = (UserInfo)iterator.next();
		%>
		<tr <% if(i%2 == 0){%> bgcolor="#FFE4B5" <%}else{%> bgcolor="#FFFACD" <%} i++; //换行换颜色%> >
			<td><%= userInfo.getUserId()%></td>
			<td><%= userInfo.getNickName()%></td>
			<td><%= userInfo.getTrueName()%></td>
			<td>
				<% if("1".equals(userInfo.getGender()))
					{
						out.print("男");
					}else
						{
							out.print("女");
						}%>
			</td>
			<td><%= userInfo.getMajor()%></td>
			<td><%= userInfo.getCourse()%></td>
			<td><%= userInfo.getHobby()%></td>
			<td><%= userInfo.getRemarks()%></td>
			<td bgcolor="#28FF28"><a href="userModifyPage.jsp?id=<%= userInfo.getUserId() %> ">修改</a></td>
			<td bgcolor="#FF9797"><a href="deleteResult.jsp?id=<%= userInfo.getUserId() %> ">删除</a></td>
						 <%-- href多个参数用?隔开,将 要修改会员的id传到modifymember.jsp --%>
		</tr>
		
	<%}
		%>
	</table>
		
</body>
</html>