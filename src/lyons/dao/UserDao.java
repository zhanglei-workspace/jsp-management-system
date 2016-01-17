package lyons.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import lyons.db.DbClose;
import lyons.db.DbConn;
import lyons.entity.User;
import lyons.entity.UserInfo;

/**
 * 数据库操作类
 * /
public class UserDao
{
	Connection  	  conn = null;
	ResultSet		    rs = null;
	PreparedStatement pstmt = null;
	
	/*
	 * 验证用户登录
	 */
	public boolean login(User user)
	{
		boolean flagLogin = false;
		conn = DbConn.getConn();									
		String sql = "SELECT * FROM SALESMAN WHERE SNAME=? AND SPASSWORD=?";  //引用saleman表 数据库很离奇。当前创建表的就不行，不明原因！//可能是纯粹oracle的原因 
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user.getUserName());
			pstmt.setString(2,user.getUpassWd());
			
			 rs = pstmt.executeQuery();
			if (rs.next())
			{
				flagLogin = true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			DbClose.allClose(pstmt, rs, conn);
		}
		
		return flagLogin;
	}
	
	/*
	 * 录入会员信息
	 */
	public boolean addMember(UserInfo userInfo)
	{
		System.out.println(userInfo.getCourse());
		
		boolean flagAdd = false;
		conn = DbConn.getConn();
		String sql = "insert into memberInfo(nickName,trueName,gender,major,course,hobby,remarks) values(?,?,?,?,?,?,?)";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userInfo.getNickName());
			pstmt.setString(2, userInfo.getTrueName());
			pstmt.setString(3, userInfo.getGender());
			pstmt.setString(4, userInfo.getMajor());
			pstmt.setString(5, userInfo.getCourse());
			pstmt.setString(6, userInfo.getHobby());
			pstmt.setString(7, userInfo.getRemarks());
			
			int rs = pstmt.executeUpdate();
			if (rs > 0)
			{
				flagAdd = true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}finally
		{
			DbClose.close(pstmt, conn);
		}
	 return flagAdd;
	}
	
	/*
	 * 查看学生信息
	 */
	public ArrayList<UserInfo> queryMemberInfo()
	{
		ArrayList<UserInfo> memberInfo = new ArrayList<UserInfo>();
		conn = DbConn.getConn();
		String sql = "SELECT * FROM MEMBERINFO";
		try
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				int userId = rs.getInt(1);
				String nickName = rs.getString(2);
				String trueName = rs.getString(3);
				String gender = rs.getString(4);
				String major = rs.getString(5);
				
				String[] courses = {""};
					if (rs.getString(6) != null)
					{
						courses = rs.getString(6).split("&"); //将字符串分割盛到数组中去
					}
				String[] hobbys = {""};
					if (rs.getString(7) != null)
					{
						hobbys = rs.getString(7).split("&"); //将字符串分割盛到数组中去  取出的String转成String[]存储,显示时用string（在实体类中进行了转换）。
					}
				
				String remarks = rs.getString(8);
				
				UserInfo membershipInfo = new UserInfo(userId,nickName,trueName,gender,major,courses,hobbys,remarks);
				memberInfo.add(membershipInfo);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}finally
		{
			DbClose.allClose(pstmt, rs, conn);
		}
		
		return memberInfo;
	}
	
	/*
	 * 修改会员信息
	 */
	public boolean modifyMember(UserInfo userInfo)
	{
		boolean modifyFalg = false;
		conn = DbConn.getConn();
		String sql = "update memberInfo set nickName=?,gender=?,major=?,course=?,hobby=?,remarks=? where userid=?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userInfo.getNickName());
			pstmt.setString(2, userInfo.getGender());
			pstmt.setString(3, userInfo.getMajor());
			pstmt.setString(4, userInfo.getCourse());
			pstmt.setString(5, userInfo.getHobby());
			pstmt.setString(6, userInfo.getRemarks());
			pstmt.setInt(7, userInfo.getUserId());
			
			int rs = pstmt.executeUpdate();
			
			if (rs > 0)
			{
				modifyFalg = true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return modifyFalg;
	}
	
	/*
	 * 删除会员信息
	 */
	public boolean deleteMember(int userId)
	{
		boolean deleteFalg = false;
		conn = DbConn.getConn();
		String sql = "DELETE FROM MEMBERINFO WHERE USERID=?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			
			int rs = pstmt.executeUpdate();
			
			if (rs > 0)
			{
				deleteFalg =true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}finally
		{
			DbClose.close(pstmt, conn);
		}
		return deleteFalg;
	}
}
