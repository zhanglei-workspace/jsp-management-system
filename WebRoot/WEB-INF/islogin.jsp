<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lyons.entity.User"%>

<%
	User user = (User)session.getAttribute("user");
	
	
	out.print(user.getUpassWd());
	if(user==null)
	{%>
		<jsp:forward page="index.jsp"></jsp:forward>
	<%}
%>