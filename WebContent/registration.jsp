<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="java.sql.*,javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <script src="js/registration.js"></script>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<%	int studentid=Integer.parseInt(session.getAttribute("studentid").toString()); 
    	session.setAttribute("studentid", studentid);
    	int deptid=Integer.parseInt(session.getAttribute("deptid").toString()); 
    	session.setAttribute("deptid", deptid);
    %>
    <script type="text/javascript" src="jquery.js"></script>
	<script type="text/javascript">
	function call()
	{
		var obj;
		var semester=document.getElementById("semester").value;
		var url="check.jsp?semester="+semester;
		//alert(url);
	    if(window.XMLHttpRequest)	//except IE
			{
				obj=new XMLHttpRequest();
			}
		else	//IE	
			{
				obj=new ActiveXObject("Microsoft.XMLHTTP");
			}
		obj.open("get",url,true);	//get/post,target(jsp,html,txt,servlet),false-asyncronus
		obj.send();
		obj.onreadystatechange=function()
		{
			if (obj.readyState==4 && obj.status==200)
				{
					document.getElementById("coursename").innerHTML=obj.responseText;
					//document.getElementById("credit").innerHTML=obj.responseText;
				}
		}  
	}
	function count()
	{
		var sem=document.getElementById("semester").value;
		if(sem==0 ||sem==null)
			{
				alert("SELECT SEMESTER")
				return false;
			}
	}
	</script>
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
                        <a href="studenthome.jsp">HOME</a>
                    </li>
                    <li class="page-scroll">
                        <a href="registration.jsp">REGISTRATION HERE</a>
                    </li>
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
    	<h3>START REGISTRATION</h3>
   	<hr class="star-primary">
    </div>
    </div>
    <div class="row">
   	<div class="col-lg-8 col-lg-offset-2">
    
    <form name="sentMessage" id="sentMessage" action="Registration" method="post" onsubmit="return registrationvalidate()">
    ${param.msg}
    
    <%	
    	session.setAttribute("studentid", studentid);
        Connection con=null;
    	String url="jdbc:mysql://localhost/university";
    	ResultSet rs=null;
    	Statement st=null;
    	int emailid=0;
    			
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		con=DriverManager.getConnection(url,"root","root");
    		st=con.createStatement();
    		String qry="select * from student where studentid="+studentid;
    		System.out.println(qry);
    		rs=st.executeQuery(qry);  
    		while(rs.next())
    		{
    %> 
    
    <div class="row control-group">
    	<div class="form-group col-xs-12 ">
    		<label>Name</label>
    			<input type="text" class="form-control"  id="name" value="<%=rs.getString("firstname") %> <%=rs.getString("lastname") %>" readonly>
    		<p class="help-block text-danger"></p>
    	</div>
    </div>
    <div class="row control-group">
    	<div class="form-group col-xs-12 ">
    		<label>Registration Number</label>
    			<input type="text" class="form-control"  id="name" value="<%=rs.getString("regdno") %>" readonly>
    		<p class="help-block text-danger"></p>
    	</div>
    </div>
    <%	
    		emailid=rs.getInt("eid");
    	}
    		String qry1="select * from email where eid="+emailid;
    		System.out.println(qry1);
    		rs=st.executeQuery(qry1);  
    		while(rs.next())
    		{
    %>
   	<div class="row control-group">
    	<div class="form-group col-xs-12 ">
        	<label>Email</label>
            	<input type="text" class="form-control"  id="name" value="<%=rs.getString("emailid") %>" readonly>	         	
          	<p class="help-block text-danger"></p>
      	</div>
    </div>
						
	<%}	%>
    				
		<div class="input-container">
				 <div class="row control-group">
                            <div class="form-group col-xs-12 ">
                <label for="semister">Semester
				
				<select name="semester" id="semester" onchange="call()" class="form-control">
				<option value="">--Select Semester--</option>
				<option value="1">1st</option>
				<option value="2">2nd</option>
				<option value="3">3rd</option>
				<option value="4">4th</option>
				<option value="5">5th</option>
				<option value="6">6th</option>
				<option value="7">7th</option>
				<option value="8">8th</option>
				
				
				</select></label>
				</div></div>
				
            </div>
            <% }
    				catch(Exception e)
    				{
    					e.printStackTrace();
    				} %>
			<span id="coursename"></span><br>
			<span id="credit"></span>
			<span id="credit"></span><br>
                        <div id="success"></div>
                        <div class="row" align="center">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg" onclick="">Submit</button>
                            </div>
                        </div>
                       
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
