package com.course.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Course
 */
@WebServlet("/Course")
public class Course extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int instructorid=Integer.parseInt(request.getParameter("instructorid"));
		int courseid=Integer.parseInt(request.getParameter("courseid"));
		
		Connection con=null;
		String url="jdbc:mysql://localhost/university";
		ResultSet rs=null;
		Statement st=null;
		String coursename=null;
		int caid=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,"root","root");
			st=con.createStatement();
			String qry="select * from course where courseid="+courseid;
			System.out.println(qry);
			rs=st.executeQuery(qry);
			while(rs.next())
			{	
				coursename=rs.getString("coursename");
			}
			String qry2="UPDATE course_alocation SET coursename='"+coursename+"', courseid="+courseid+" where instructorid= "+instructorid;
			System.out.println(qry2);
			st.executeUpdate(qry2);	
			String qry3="select * from course_alocation where courseid="+courseid+" and instructorid="+instructorid;
			System.out.println(qry3);
			rs=st.executeQuery(qry3);
			while(rs.next())
			{
				caid=rs.getInt("caid");
			}
			if(caid!=0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("instructorprofile.jsp?instructorid="+instructorid);
				request.setAttribute("msg","Updated Successfully..!!");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("instructorprofile.jsp?instructorid="+instructorid);
				request.setAttribute("msg","Updation Failed..!!");
				rd.forward(request, response);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
			}

	}

}
