package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.login.pojo.LoginPojo;

public class LoginDao {
	String url ="jdbc:mysql://localhost/university";
	String username="root";
	String password="root";
	String driver="com.mysql.jdbc.Driver";
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

	public int loginStudent(LoginPojo pojo) {
		// TODO Auto-generated method stub
		int studentid=0;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("CONNECTED");
			st=con.createStatement();
			String qry1="select studentid from student where regdno='"+pojo.getRegdno()+"'";
			System.out.println(pojo.getRegdno());
			rs=st.executeQuery(qry1);
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

	public int checkdept(LoginPojo pojo) {
		// TODO Auto-generated method stub
		int deptid=0;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("CONNECTED");
			st=con.createStatement();
			String qry1="select deptid from student where regdno='"+pojo.getRegdno()+"'";
			rs=st.executeQuery(qry1);
			while(rs.next())
			{
				deptid=rs.getInt("deptid");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return deptid;
	}

	public int loginInstructor(LoginPojo pojo) {
		// TODO Auto-generated method stub
		int instructorid=0;
		int positionid=0;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("CONNECTED");
			st=con.createStatement();
			String qry2="select positionid from position where position='"+pojo.getType()+"'";
			rs=st.executeQuery(qry2);
			while(rs.next())
			{
				positionid=rs.getInt("positionid");
			}
			String qry1="select instructorid from instructor where regdno='"+pojo.getRegdno()+"' and positionid='"+positionid+"'";
			rs=st.executeQuery(qry1);
			while(rs.next())
			{
				instructorid=rs.getInt("instructorid");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return instructorid;
	}
	public int checkInstructorDept(LoginPojo pojo) {
		// TODO Auto-generated method stub
		int deptid=0;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("CONNECTED");
			st=con.createStatement();
			String qry1="select deptid from instructor where regdno='"+pojo.getRegdno()+"'";
			rs=st.executeQuery(qry1);
			while(rs.next())
			{
				deptid=rs.getInt("deptid");
				System.out.println(deptid+"hi");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return deptid;
	}

}
