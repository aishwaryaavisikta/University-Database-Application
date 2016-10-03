package com.course.dao;

import com.course.pojo.CourseAllocationPojo;
import java.sql.*;

public class CourseAllocationDao {

		Connection con=null;
		String url="jdbc:mysql://localhost/university";
		ResultSet rs=null;
		Statement st=null;
		int status=0;
		String coursename=null;
		int caid=0;
		String instructorname=null;
		
	
	public int check(CourseAllocationPojo pojo) {
		// TODO Auto-generated method stub
		try{
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(url,"root","root");
		st=con.createStatement();
		String qry="select * from course_alocation where courseid="+pojo.getCourseid()+" and instructorid="+pojo.getInstructorid();
		System.out.println(qry);
		rs=st.executeQuery(qry);
		while(rs.next())
		{
			status=rs.getInt("caid");
			coursename=rs.getString("coursename");
		}
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}return status;
	}


	public int save(CourseAllocationPojo pojo) {
		// TODO Auto-generated method stub
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,"root","root");
			st=con.createStatement();
			String qry="select * from course where courseid="+pojo.getCourseid();
			System.out.println(qry);
			rs=st.executeQuery(qry);
			while(rs.next())
			{
				status=rs.getInt("courseid");
				coursename=rs.getString("coursename");
			}
			//String qry1="select * from instructor where instructorid="+pojo.getInstructorid();
			String qry1=" SELECT CONCAT(firstname,' ',lastname) AS firstname FROM instructor where instructorid="+pojo.getInstructorid();
			System.out.println(qry1);
			rs=st.executeQuery(qry1);
			while(rs.next())
			{
				instructorname=rs.getString("firstname");
				
			}
			PreparedStatement pstmt = con.prepareStatement("{call course_allocation(?,?,?,?,?)}");
            pstmt.setInt(1,pojo.getCourseid() );
            pstmt.setInt(2,pojo.getInstructorid() );
            pstmt.setInt(3,pojo.getDeptid());           
            pstmt.setString(4, coursename);
            pstmt.setString(5,instructorname);
			pstmt.executeUpdate();	
			String qry3="select * from course_alocation where courseid="+pojo.getCourseid()+" and instructorid="+pojo.getInstructorid();
			System.out.println(qry3);
			rs=st.executeQuery(qry3);
			while(rs.next())
			{
				caid=rs.getInt("caid");
			}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		
		return caid;
	}

}
