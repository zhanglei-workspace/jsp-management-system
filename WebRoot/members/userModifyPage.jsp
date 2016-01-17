<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lyons.entity.UserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="../islogin.jsp"></jsp:include>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="queryById" class="lyons.tools.Query"></jsp:useBean>
	<%
		//将从userModifyPage获取的字符串id转换成int型id,并用userInfo接收UserInfo类型的以此id为查询函数参数获取到的会员信息。
		UserInfo userInfo = queryById.queryMemberById(Integer.parseInt(request.getParameter("id"))); 		
	%>
	
	<center>
 			<form name="" action="modifyResult.jsp" method="post">
		 		<table bgColor="#c0c0c0">
						<tr>
							<td align="center" bgcolor=green colspan=2><font color=white>修改会员信息</font></td>
						</tr>
						
						<tr>
							<td>真实姓名：</td> <td> <%= userInfo.getTrueName() %>&nbsp;<%= userInfo.getUserId() %>(ID) </td> 
						</tr>
						
						<tr>
							<td>昵称：</td> <td><input type="text" size=20 name="nickName" value="<%= userInfo.getNickName() %>"></td>
						</tr>
						
						<tr>
							<td>性别</td><td><input type="radio" name="gender" 
								<% if("1".equals( userInfo.getGender()))
								{%>
									checked
								<%}%>
								 value="1">男&nbsp;&nbsp;
							<input type="radio" name="gender"
								<% if("0".equals( userInfo.getGender()))
									{%>
										checked
									<%}%>
							 value="0">女</td>
						</tr>
						
						<tr>
							<td>所学专业：</td>
							<td><select name="major">
									<option <% if("计科".equals(userInfo.getMajor())) {%> selected <%}%> >计科</option>
									<option <% if("通信工程".equals(userInfo.getMajor())) {%> selected <%}%> >通信工程</option>
									<option <% if("电子商务".equals(userInfo.getMajor())) {%> selected <%}%> >电子商务</option>
							</select></td>
						</tr>
						
						<tr>
							<td>所学课程：</td>
							
							<td><select name="courses" size=4 multiple="multiple">
									<option <% String[] course = userInfo.getCourses();
												int length = course.length;//数组长度
												for(int i=0;i < length;i++)
												{
													if("计算机导论".equals(course[i])){%> selected <%break;}
												}%>>计算机导论</option>
									<option <% for(int i=0;i < length;i++)
												{
													if("数据结构".equals(course[i])){%> selected <%break;}
												} %> >数据结构</option>
									<option <% for(int i=0;i < length;i++)
												{
													if("数据库原理".equals(course[i])){%> selected <%break;}
												} %> >数据库原理</option>
									<option <% for(int i=0;i < length;i++)
												{
													if("操作系统".equals(course[i])){%> selected <%break;}
												} %> >操作系统</option>
									<option <% for(int i=0;i < length;i++)
												{
													if("计算机网络".equals(course[i])){%> selected <%break;}
												} %> >计算机网络</option>
									<option <% for(int i=0;i < length;i++)
												{
													if("软件工程".equals(course[i])){%> selected <%break;}
												} %> >软件工程</option>
							</select></td>
						</tr>
						
						<tr>
							<td>兴趣</td>
							<td><input type="checkbox" value="music" 
								<% String[] hobby = userInfo.getHobbys();
									int hobbyLength = hobby.length;//数组长度
									for(int i=0;i < hobbyLength;i++)
									{
										if("music".equals(hobby[i])){%> checked <%break;}
									}%>name="hobbys">听音乐&nbsp;
								<input type="checkbox" value="book" 
								<% 
									for(int i=0;i < hobbyLength;i++)
									{
										if("book".equals(hobby[i])){%> checked <%break;}
									}%>name="hobbys">看小说&nbsp; 
								<input type="checkbox" value="web" 
								<% 
									for(int i=0;i < hobbyLength;i++)
									{
										if("web".equals(hobby[i])){%> checked <%break;}
									}%>name="hobbys">上网&nbsp;</td>
						</tr>
						
						<tr valign="top">
							<td>备注</td>
							<td><textarea rows=3 cols=22 name="remarks"> <%= userInfo.getRemarks() %> </textarea></td>
						</tr>
						
						<tr >
							<td align="center" colspan="2" >
								<input type="hidden" value="<%= userInfo.getUserId() %>" name="userId">
								<input type="submit" value="提交">&nbsp;&nbsp;
								<input type="reset"  value="重置">
							</td>
						</tr>				
				</table>
			</form>
 		</center>

</body>
</html>