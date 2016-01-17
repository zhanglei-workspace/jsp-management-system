<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="../islogin.jsp"></jsp:include>
<body bgcolor="#D7FFEE">
 		<center>
 			<form name="" action="addResult.jsp" method="post">
		 		<table bgColor="#c0c0c0">
						<tr>
							<td align="center" bgcolor=green colspan=2><font color=white>会员信息录入</font></td>
						</tr>
						
						<tr>
							<td>昵称：</td> <td><input type="text" size=20 name="nickName"></td>
						</tr>
						
						<tr>
							<td>真实姓名：</td> <td><input type="text" size=20 name="trueName"></td>
						</tr>
						
						<tr>
							<td>性别</td><td><input type="radio" name="gender" checked value="1">男&nbsp;&nbsp;<input type="radio" name="gender" value="0">女</td>
						</tr>
						
						<tr>
							<td>所学专业：</td>
							<td><select name="major">
									<option>计科</option>
									<option>通信工程</option>
									<option selected>电子商务</option>
							</select></td>
						</tr>
						
						<tr>
							<td>所学课程：</td>
							<td><select name="courses" size=3 multiple="multiple">
									<option>计算机导论</option>
									<option>数据结构</option>
									<option>数据库原理</option>
									<option>操作系统</option>
									<option>计算机网络</option>
									<option>软件工程</option>
							</select></td>
						</tr>
						
						<tr>
							<td>兴趣</td>
							<td><input type="checkbox" value="music" name="hobbys">听音乐&nbsp;
								<input type="checkbox" value="book" name="hobbys">看小说&nbsp; 
								<input type="checkbox" value="web" name="hobbys">上网&nbsp;</td>
						</tr>
						
						<tr valign="top">
							<td>备注</td>
							<td><textarea rows=3 cols=22 name="remarks"></textarea></td>
						</tr>
						
						<tr ><td align="center" colspan="2" ><input type="submit" value="提交">&nbsp;&nbsp;<input type="reset"  value="重置"></td></tr>				
				</table>
			</form>
 		</center>
 		
 		
</body>
</html>