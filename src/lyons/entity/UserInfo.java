package lyons.entity;

public class UserInfo
{
	private int userId;
	private String nickName;
	private String trueName;
	private String gender;
	private String major;
	private String[] courses = {""}; //获取的用户信息存储于数组中
	private String course = "";	//从上述数组中取值后，用字符串的形式存于数据库中
	private String[] hobbys = {""};	//
	private String hobby ="";
	private String remarks = "";

	/*
	 * 查询信息构造函数
	 */
	public UserInfo(int userId, String nickName, String trueName,String gender, String major, String[] courses, String[] hobbys,String remarks)
	{
		this.userId = userId;
		this.nickName = nickName;
		this.trueName = trueName;
		this.gender = gender;
		this.major = major;
		this.courses = courses;
		this.hobbys = hobbys;
		this.remarks = remarks;
	}
	/*
	 * 无参的构造函数
	 * jsp中无参的构造函数很重要，重载方法后，必须再写一个形式的无参构造函数
	 */
	public UserInfo()
	{
	}
	/*
	 * 共有get、set
	 * 注意，get set 后面都要大写
	 */
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getTrueName()
	{
		return trueName;
	}
	public void setTrueName(String trueName)
	{
		this.trueName = trueName;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getMajor()
	{
		return major;
	}
	public void setMajor(String major)
	{
		this.major = major;
	}
	public String[] getCourses()
	{
		return courses;
	}
	public void setCourses(String[] courses)
	{
		this.courses = courses;
	}
	public String getCourse()
	{
		if (courses != null)	
		{
			course = ""; //初始化，防止多次调用时累加
			for (int i = 0,length = courses.length; i < length; i++)
				course += courses[i] + "&"; //将数组中的值存储于字符串中，并加上用于分割的符号&，方便以后取值
		}
		course = course.substring(0,course.length()-1); //将最后的一个分隔符剔除掉
		return course;
	}
	public void setCourse(String course)
	{
		this.course = course;
	}
	public String[] getHobbys()
	{
		return hobbys;
	}
	public void setHobbys(String[] hobbys)
	{
		this.hobbys = hobbys;
	}
	public String getHobby()
	{
		if (hobbys != null)	
		{
			hobby = ""; //初始化，防止多次调用时累加
			for (int i = 0,length = hobbys.length; i < length; i++)
				hobby += hobbys[i] + "&"; //将数组中的值存储于字符串中，并加上用于分割的符号&，方便以后取值
		}
		hobby = hobby.substring(0,hobby.length()-1); //将最后的一个分隔符剔除掉
		return hobby;
	}
	public void setHobby(String hobby)
	{
		this.hobby = hobby;
	}
	public String getRemarks()
	{
		return remarks;
	}
	public void setRemarks(String remarks)
	{
		this.remarks = remarks;
	}
}
