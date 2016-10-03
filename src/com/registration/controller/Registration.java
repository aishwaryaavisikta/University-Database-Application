package com.registration.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			response.setContentType("text/html");
			HttpSession session=request.getSession();
			PrintWriter out=response.getWriter();
			int semester=Integer.parseInt(request.getParameter("semester"));
			int studentid=Integer.parseInt(session.getAttribute("studentid").toString());
			if(request.getParameter("coursename")!=null)
			{
			String coursename="";
			String studentname=null;
			String arr[]=request.getParameterValues("coursename");
			
			for(int i=0;i<arr.length;i++)
			{
				coursename+=arr[i]+"\t";
				
			}
			
			String Driver="com.mysql.jdbc.Driver";
			String user="root";
			String password="root";
			String url="jdbc:mysql://localhost/university";
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;  
			Class.forName(Driver);
		    con=DriverManager.getConnection(url, user, password);
		    st = con.createStatement();
		    String qry = "insert into student_select(coursename,studentid,semester) values('"+coursename+"',"+studentid+","+semester+")";
		    int i=st.executeUpdate(qry);
		    System.out.println(qry);
		    String qry1="SELECT CONCAT(firstname,' ',lastname) AS firstname FROM student where studentid="+studentid;
		    rs=st.executeQuery(qry1);
		    while(rs.next())
		    {
		    
		    	studentname=rs.getString("firstname");
		    	System.out.println(studentname);
		    }
		    if(i>0)
		    {
		    	RequestDispatcher rd=request.getRequestDispatcher("thankyou.jsp?studentname="+studentname);
		    	System.out.println(studentname);
		    	request.setAttribute("msg", " saved successfully....!!");
		    	rd.forward(request, response);
		    }
		    else
		    {
		    	RequestDispatcher rd=request.getRequestDispatcher("registration.jsp?studentid="+studentid);
		    	System.out.println(studentname);
		    	request.setAttribute("msg", " Try again....!!");
		    	rd.forward(request, response);
		    }
		    
		    }
			
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("registration.jsp?studentid="+studentid);
		    	request.setAttribute("msg", " Try again....!!");
		    	rd.forward(request, response);
			}
		}
		
	    catch (Exception e) 
	    {
	    	e.printStackTrace();
	    }
		
	}
}
