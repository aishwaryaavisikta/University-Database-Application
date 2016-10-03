<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
    %>
    <script type="text/javascript" src="jquery.js"></script>
	<script type="text/javascript">
	function call()
	{
		var obj;
		var batch=document.getElementById("batch").value;
		var semester=document.getElementById("semester").value;
		var url="checksemester.jsp?batch="+batch+"&semester="+semester;
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
					document.getElementById("result").innerHTML=obj.responseText;
					
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
	<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>STUDENT LIST</h3>
                    <hr class="star-primary">
                </div>
            </div>
                   
				<div id="inner-page">
     
		<form name="viewbranch" id="viewbranch" method="post" action="">
		<center>
		
		<div class="row control-group">
    	<div class="form-group col-xs-12 ">
    		
    		<label>Batch:</label>
    			<select id="batch" style="width: 350px; height: 20px;">
    			<option value="">--SELECT--</option>
    			<option value="0">ALL</option>
    			<option value="2013">2013</option>
    			<option value="2014">2014</option>
    			<option value="2015">2015</option>
    			<option value="2016">2016</option>
    			<option value="2017">2017</option>
    			<option value="2018">2018</option>
    			<option value="2019">2019</option>
    			<option value="2020">2020</option>
    			</select>
    		<p class="help-block text-danger"></p>
    	</div>
    	
    	</div>
    	<div class="row control-group">
    	<div class="form-group col-xs-12 ">
    		<label>Semester:</label>
    			<select id="semester" onclick="call()" style="width: 350px; height: 20px;">
    			<option value="">--SELECT--</option>
    			<option value="0">ALL</option>
    			<option value="1">1st Semester</option>
				<option value="2">2nd Semester</option>
				<option value="3">3rd Semester</option>
				<option value="4">4th Semester</option>
				<option value="5">5th Semester</option>
				<option value="6">6th Semester</option>
				<option value="7">7th Semester</option>
				<option value="8">8th Semester</option>
    			</select>
    		<p class="help-block text-danger"></p>
    	</div>
    	</div>
		<div id="detail">
		
		<span id="result"></span>
		
		<p class="help-block text-danger"></p>
    	</div>
    	</div>
</div>

</center>
</form>
  </div>  
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/student.js"></script>

</body>

</html>
