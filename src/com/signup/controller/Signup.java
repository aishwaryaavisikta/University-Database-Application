package com.signup.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.signup.dao.SignupDao;
import com.signup.pojo.SignupPojo;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String firstname=request.getParameter("firstname") ;
		String lastname=request.getParameter("lastname") ;
		String email=request.getParameter("email") ;
		String email1=request.getParameter("email1");
		String regdno=request.getParameter("regdno") ;
		String password=request.getParameter("password") ;
		String phoneno=request.getParameter("phoneno") ;
		int batch=Integer.parseInt(request.getParameter("batch"));
		int dept=Integer.parseInt(request.getParameter("dept")) ;
		System.out.println(email);

		SignupPojo pojo=new SignupPojo();
		pojo.setFirstname(firstname);
		pojo.setLastname(lastname);
		pojo.setEmail(email);
		pojo.setPassword(password);
		pojo.setPhoneno(phoneno);
		pojo.setDept(dept);
		pojo.setRegdno(regdno);
		pojo.setEmail1(email1);
		pojo.setBatch(batch);
		SignupDao dao=new SignupDao();
		int status1=dao.check(pojo);
		if(status1==0)
		{
		int status=dao.save(pojo);
		
		if(status>0)
		{	
			response.sendRedirect("index.jsp?msg=Signup successful..!! Go for Login...");
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
			request.setAttribute("msg","Signup fails..!! Try again...");
			rd.forward(request, response);
		}

		}
		else
		{
			response.sendRedirect("signup.jsp?msg=Signup fails..!! Registration number is already exist...");
		}

	}

}
