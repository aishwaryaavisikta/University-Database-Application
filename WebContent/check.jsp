<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*"%>

<% 
	int semester=Integer.parseInt(request.getParameter("semester")); 
	System.out.println(semester);
	try
	{
		String Driver="com.mysql.jdbc.Driver";
		String user="root";
		String password="root";
		String url="jdbc:mysql://localhost/university";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String qry="SELECT coursename,credit FROM course WHERE semester="+semester+" GROUP BY coursename";
		Class.forName(Driver);
		con=DriverManager.getConnection(url,user,password);
		st=con.createStatement();
		rs=st.executeQuery(qry);
		System.out.println(qry);
		out.print("<div class='input-container'><div class='row control-group'><div class='form-group col-xs-12'><label>Course</label><br>");
		out.print("<table>");
		System.out.println("CONNECTED");
		while(rs.next())
		{	
			out.print("<tr><td><input type='checkbox' class='row control-group' id='coursename' name='coursename' value='"+rs.getString("coursename")+"'>"+rs.getString("coursename")+"</td><td>"
							+"Credit="+rs.getInt("credit")+"</td></tr>");
			out.print("<tr><td><input type='hidden' id='credit' name='credit' value='"+rs.getInt("credit")+"'>"+"</td><td>"+"</td></tr>");
			System.out.println(rs.getString("coursename"));
		}
		out.print("</table>");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}


%>