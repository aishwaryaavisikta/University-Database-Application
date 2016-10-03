<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UNIVERSITY DATABASE APPLICATION</title>

    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/student.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
     <%	int instructorid=Integer.parseInt(session.getAttribute("instructorid").toString()); 
    	session.setAttribute("instructorid", instructorid);
    	int deptid=Integer.parseInt(session.getAttribute("deptid").toString()); 
    	session.setAttribute("deptid", deptid);
    	System.out.println(deptid);
    	int instructorid1=Integer.parseInt(request.getParameter("instructorid"));
    	
    %>
	

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">UNIVERSITY DATABASE APPLICATION</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="hodhome.jsp">HOME</a>
                    </li>
                    <li class="page-scroll">
                        <a href="hodstudentlist.jsp">STUDENT LIST</a>
                    </li>
                    <li class="page-scroll">
                        <a href="instructorlist.jsp">INSTRUCTOR LIST</a>
                    </li>
                   <!-- dropdown -->
                    
                    <li class="drop-down">
                    <a id="drop2" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">COURSE<span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledy="drop2">
                        <li><a href="courselist.jsp">COURSE LIST</a></li>
                        <li><a href="courseallocation.jsp">COURSE ALLOCATION</a></li>
                    </ul>
                    </li>
                    
                    <!-- dropdown end -->
					<li class="page-scroll">
                        <a href="index.jsp">LOGOUT</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->


   
    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>PROFILE</h3>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                     <form name="sentMessage" method="post" id="contactForm" action="Course">
 <%		
    				try
    				{
    					
    					Connection con=null;
    					String url="jdbc:mysql://localhost/university";
    					ResultSet rs=null;
    					Statement st=null;
    					Class.forName("com.mysql.jdbc.Driver");
    					con=DriverManager.getConnection(url,"root","root");
    					st=con.createStatement();
    					String qry="select * from instructor where instructorid="+instructorid1;
    					System.out.println(qry);
    					rs=st.executeQuery(qry);  
    					while(rs.next())
    					{
    				%> 
    			
                  	 <div class="row control-group">
                           <div class="form-group col-xs-12 ">
                           <label>Name:</label>
                               <b><input type="text" class="form-control" name="instructorname" value="<%=rs.getString("firstname") %><%=rs.getString("lastname") %>" readonly></b>
                                <input type="hidden" class="form-control" name="instructorid" value="<%=rs.getInt("instructorid") %>" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                       <% }
    					String qry1="select * from course where deptid="+deptid+" GROUP BY coursename";
    					System.out.println(qry1);
    					rs=st.executeQuery(qry1); %>
    					<div class="row control-group">
                           <div class="form-group col-xs-12 ">
                           <font color="red"><label>Select Course:</label></font>
                           <select name="courseid" class="form-control">
                           					
    					<% 
    					while(rs.next())
    					{
    					
                       %> 
                       <option value="<%=rs.getInt("courseid")%>"><%=rs.getString("coursename") %></option>
                       <%} %>
                      
                       </select>
                        <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                           <div class="form-group col-xs-12 ">

                               <b><input type="submit" class="form-control"  value="UPDATE" ></b>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <% }
 catch(Exception e)
 {
	   e.printStackTrace();
 }%>
                  	 </div>
                        <br>
                       
                    </form>
        </div>
    </section>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <!--<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <!--<script src="js/jqBootstrapValidation.js"></script>->
    <!--<script src="js/contact_me.js"></script>-->

    <!-- Custom Theme JavaScript -->
    <script src="js/student.js"></script>

</body>

</html>
    