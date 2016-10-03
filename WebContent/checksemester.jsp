<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<% 
	
	int semester=Integer.parseInt(request.getParameter("semester")); 
	System.out.println(semester);
	int batch=Integer.parseInt(request.getParameter("batch")); 
	System.out.println(batch);
	int deptid=Integer.parseInt(session.getAttribute("deptid").toString()); 
	session.setAttribute("deptid", deptid);
	if(batch!=0 && semester!=0)
	{
	try
	{
		String Driver="com.mysql.jdbc.Driver";
		String user="root";
		String password="root";
		String url="jdbc:mysql://localhost/university";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String qry="SELECT * FROM student,student_select WHERE student.studentid=student_select.studentid AND (batch="+batch+" AND student_select.semester="+semester+" AND deptid="+deptid+") GROUP BY student.studentid";
		Class.forName(Driver);
		con=DriverManager.getConnection(url,user,password);
		st=con.createStatement();
		System.out.println(qry);
		rs=st.executeQuery(qry);
		System.out.println(qry);
		System.out.println("CONNECTED");
		int count=1;
		out.print("<table class='table table-striped' id='tbldata' width='100%' height='100%'><tr id='border'><td align='left' valign='middle'><u><b>SL.NO</b></u></td><td align='left' valign='middle'><u><b>STUDENT NAME</b></u></td><td align='left' valign='middle'><u><b>REGD NO</b></u></td><td></td></tr>");
		while(rs.next())
		{	
			System.out.println(rs.getString("firstname"));
			out.print("<tr><td>"+count++ +"</td><td>"+rs.getString("firstname")+rs.getString("lastname")+"</td><td>"
							+rs.getString("regdno")+"</td><td><a href='studentprofile.jsp?studentid="+rs.getInt("studentid")+"'>VIEW PROFILE</td></tr>");
		}
		out.print("</table>");
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}
	else if(batch==0 && semester!=0)
	{
	try
	{
		String Driver="com.mysql.jdbc.Driver";
		String user="root";
		String password="root";
		String url="jdbc:mysql://localhost/university";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String qry=" SELECT * FROM student,student_select WHERE student.studentid=student_select.studentid AND student_select.semester="+semester+" AND deptid="+deptid+" GROUP BY student.studentid";
		Class.forName(Driver);
		con=DriverManager.getConnection(url,user,password);
		st=con.createStatement();
		System.out.println(qry);
		rs=st.executeQuery(qry);
		System.out.println(qry);
		System.out.println("CONNECTED");
		int count=1;
		out.print("<table class='table table-striped' id='tbldata' width='100%' height='100%'><tr id='border'><td align='left' valign='middle'><u><b>SL.NO</b></u></td><td align='left' valign='middle'><u><b>STUDENT NAME</b></u></td><td align='left' valign='middle'><u><b>REGD NO</b></u></td><td></td></tr>");
		while(rs.next())
		{	
			System.out.println(rs.getString("firstname"));
			out.print("<tr><td>"+count++ +"</td><td>"+rs.getString("firstname")+rs.getString("lastname")+"</td><td>"
							+rs.getString("regdno")+"</td><td><a href='studentprofile.jsp?studentid="+rs.getInt("studentid")+"'>VIEW PROFILE</td></tr>");
		}
		out.print("</table>");
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}
	else if(batch!=0 && semester==0)
	{
	try
	{
		String Driver="com.mysql.jdbc.Driver";
		String user="root";
		String password="root";
		String url="jdbc:mysql://localhost/university";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String qry=" SELECT * FROM student,student_select WHERE student.studentid=student_select.studentid AND student.batch="+batch+" AND deptid="+deptid+" GROUP BY student.studentid";
		Class.forName(Driver);
		con=DriverManager.getConnection(url,user,password);
		st=con.createStatement();
		System.out.println(qry);
		rs=st.executeQuery(qry);
		System.out.println(qry);
		System.out.println("CONNECTED");
		int count=1;
		out.print("<table class='table table-striped' id='tbldata' width='100%' height='100%'><tr id='border'><td align='left' valign='middle'><u><b>SL.NO</b></u></td><td align='left' valign='middle'><u><b>STUDENT NAME</b></u></td><td align='left' valign='middle'><u><b>REGD NO</b></u></td><td></td></tr>");
		while(rs.next())
		{	
			System.out.println(rs.getString("firstname"));
			out.print("<tr><td>"+count++ +"</td><td>"+rs.getString("firstname")+rs.getString("lastname")+"</td><td>"
							+rs.getString("regdno")+"</td><td><a href='studentprofile.jsp?studentid="+rs.getInt("studentid")+"'>VIEW PROFILE</td></tr>");
		}
		out.print("</table>");
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}
	else
	{
		try
		{
			String Driver="com.mysql.jdbc.Driver";
			String user="root";
			String password="root";
			String url="jdbc:mysql://localhost/university";
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			String qry=" SELECT * FROM student,student_select WHERE student.studentid=student_select.studentid  AND deptid="+deptid+" GROUP BY student.studentid";
			Class.forName(Driver);
			con=DriverManager.getConnection(url,user,password);
			st=con.createStatement();
			System.out.println(qry);
			rs=st.executeQuery(qry);
			System.out.println(qry);
			System.out.println("CONNECTED");
			int count=1;
			out.print("<table class='table table-striped' id='tbldata' width='100%' height='100%'><tr id='border'><td align='left' valign='middle'><u><b>SL.NO</b></u></td><td align='left' valign='middle'><u><b>STUDENT NAME</b></u></td><td align='left' valign='middle'><u><b>REGD NO</b></u></td><td></td></tr>");
			while(rs.next())
			{	
				System.out.println(rs.getString("firstname"));
				out.print("<tr><td>"+count++ +"</td><td>"+rs.getString("firstname")+rs.getString("lastname")+"</td><td>"
								+rs.getString("regdno")+"</td><td><a href='studentprofile.jsp?studentid="+rs.getInt("studentid")+"'>VIEW PROFILE</td></tr>");
			}
			out.print("</table>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


%>