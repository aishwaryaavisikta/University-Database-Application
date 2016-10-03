package com.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.dao.CourseAllocationDao;
import com.course.pojo.CourseAllocationPojo;

/**
 * Servlet implementation class CourseAllocation
 */
@WebServlet("/CourseAllocation")
public class CourseAllocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int courseid=Integer.parseInt(request.getParameter("courseid"));
		int instructorid=Integer.parseInt(request.getParameter("instructorid"));
		int deptid=Integer.parseInt(request.getParameter("deptid"));
		System.out.println(deptid+"DEPTID");
		
		CourseAllocationPojo pojo=new CourseAllocationPojo();
		pojo.setCourseid(courseid);
		pojo.setInstructorid(instructorid);
		pojo.setDeptid(deptid);
		
		CourseAllocationDao dao=new CourseAllocationDao();
		int status=0;
		status=dao.check(pojo);
		System.out.println("status"+status);
		if(status==0)
		{
			int caid=dao.save(pojo);
			System.out.println(caid+"caid");
			if(caid!=0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("courseallocation.jsp");
				request.setAttribute("msg", "Inserted..!!");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("courseallocation.jsp");
				request.setAttribute("msg", "Failed..!!Course already allocated to that Instructor..!!");
				rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("courseallocation.jsp");
			request.setAttribute("msg", "Failed..!!Course already allocated to that Instructor..!!");
			rd.forward(request, response);
		}
		
	}

}
