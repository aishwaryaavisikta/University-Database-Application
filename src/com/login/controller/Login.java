package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;
import com.login.pojo.LoginPojo;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
			
		String regdno=request.getParameter("regdno");
		String password=request.getParameter("password");
		String type=request.getParameter("type");
		System.out.println(type);
		
		LoginPojo pojo=new LoginPojo();
		pojo.setRegdno(regdno);
		System.out.println(regdno+"hi");
		pojo.setPassword(password);
		pojo.setType(type);
		
		LoginDao dao=new LoginDao();
		if(type.equals("student"))
		{
			int studentid=dao.loginStudent(pojo);
			System.out.println(studentid);
			if(studentid!=0)
			{
				int deptid=dao.checkdept(pojo);
				session.setAttribute("studentid", studentid);
				session.setAttribute("deptid", deptid);
				response.sendRedirect("studenthome.jsp");
				
			}
			else
			{
				System.out.println(studentid);
				response.sendRedirect("index.jsp?msg=login fails..!! check registration number...");
				
			}
		}
		else if(type.equals("instructor"))
		{
			int instructorid=dao.loginInstructor(pojo);
			if(instructorid!=0)
			{	
				int deptid=dao.checkInstructorDept(pojo);
				System.out.println(deptid);
				session.setAttribute("instructorid", instructorid);
				session.setAttribute("deptid", deptid);
				response.sendRedirect("instructorhome.jsp");
			}		
			else
			{
				session.setAttribute("instructorid", instructorid);
				response.sendRedirect("index.jsp?msg=login fails..!! check registration number...");	
			}
		}
		else
		{
			int instructorid=dao.loginInstructor(pojo);
			if(instructorid!=0)
			{
				int deptid=dao.checkInstructorDept(pojo);
				session.setAttribute("instructorid", instructorid);
				session.setAttribute("deptid", deptid);
				response.sendRedirect("hodhome.jsp");
			}		
			else
			{
				session.setAttribute("instructorid", instructorid);
				response.sendRedirect("index.jsp?msg=login fails..!! check registration number...");	
			}
		}
	}

}
