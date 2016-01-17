<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lyons.entity.User"%>

<%
	User user = (User)session.getAttribute("userlogin"); //强制转换为User类型
	
	if(user==null)
	{%>
		<jsp:forward page="index.jsp"></jsp:forward>
	<%}
%>