package com.signup.dao;
import java.sql.*;

import com.signup.pojo.SignupPojo;

public class SignupDao {
	String url ="jdbc:mysql://localhost/university";
	String username="root";
	String password="root";
	String driver="com.mysql.jdbc.Driver";
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
		
	public int save(SignupPojo pojo)
	{
		// TODO Auto-generated method stub
		int studentid=0;
		int emailid=0;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("CONNECTED");
			st=con.createStatement();
			//String qry="insert into email (emailid,emailid2) values ('"+pojo.getEmail()+"','"+pojo.getEmail1()+"')";
			PreparedStatement pstmt = con.prepareStatement("{call email(?,?)}");
            pstmt.setString(1, pojo.getEmail());
            pstmt.setString(2, pojo.getEmail1());
            pstmt.executeUpdate();
           	rs = pstmt.executeQuery(); 
			
			String query="select eid from email where emailid='"+pojo.getEmail()+"'";
			System.out.println(query);
			rs=st.executeQuery(query);
			while(rs.next())
			{
				emailid=rs.getInt("eid");
			}
			String qry2="insert into student (firstname,lastname,eid,regdno,deptid,password,batch) values ('"+pojo.getFirstname()+"','"+pojo.getLastname()+"',"+emailid+",'"+pojo.getRegdno()+"',"+pojo.getDept()+",'"+pojo.getPassword()+"',"+pojo.getBatch()+")";
			st.executeUpdate(qry2);
			String qry3="select * from student where eid='"+emailid+"' and regdno='"+pojo.getRegdno()+"'";
			rs=st.executeQuery(qry3);
			while(rs.next())
			{
				studentid=rs.getInt("studentid");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
			return studentid;
		}

	public int check(SignupPojo pojo) {
		// TODO Auto-generated method stub
		int studentid=0;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("CONNECTED");
			st=con.createStatement();
			String qry="select studentid from student where regdno='"+pojo.getRegdno()+"'";
			rs=st.executeQuery(qry);
			while(rs.next())
			{
				studentid=rs.getInt("studentid");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return studentid;
		}

}
