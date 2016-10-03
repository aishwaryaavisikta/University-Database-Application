<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>CUTM</title>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style1.css">
<script src="js/signup.js"></script>
	<script type="text/javascript">
	function call()
	{
		var firstname=document.getElementById("firstname").value;
		
		if (firstname == null ||firstname == "") 
		{
	        document.getElementById("result").innerHTML="ENTER YOUR FIRST NAME";
	        
		}
	}
	function call1()
	{
		var lastname=document.getElementById("lastname").value;
		if (lastname == null ||lastname == "") 
		{
	        document.getElementById("result1").innerHTML="ENTER YOUR LAST NAME";
	       
		}
		
	}
	function call2()
	{
		var email=document.getElementById("email").value;
		if (email == null ||email == "") 
		{
	        document.getElementById("result2").innerHTML="ENTER YOUR EMAIL";
	        
		}
	}
	function call3()
	{
		var regdno=document.getElementById("regdno").value;
		if (regdno == null ||regdno == "") 
		{
	        document.getElementById("result3").innerHTML="ENTER YOUR REGISTRATION NUMBER";
	       
		}
	}
	function call4()
	{
		var password=document.getElementById("password").value;
		if (password == null ||password == "") 
		{
	        document.getElementById("result4").innerHTML="ENTER YOUR PASSWORD";
	       
		}
	}
	function call5()
	{	
		var confirmpassword=document.getElementById("confirmPassword").value;
		if (confirmpassword == null ||confirmpassword == "") 
		{
	        document.getElementById("result5").innerHTML="ENTER YOUR CONFIRM PASSWORD";
	        
		}
	}
	function call6()
	{
		var dept=document.getElementById("dept").value;
		if (dept == null ||dept == "") 
		{
	        document.getElementById("result6").innerHTML="SELECT YOUR DEPARTMENT";
	       
		}
		
		
		
		return false;
	
	
	}
	</script>

</head>
<body>
<div class="pen-title" style="height:10%;width:100%;background:;border-radius: 10pt;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom:0px;text-align: center;letter-spacing: 
2px;"><h1>UNIVERSITY DATABASE APPLICATION</h1>
 </div>
 
 <div style="height:70%;width:100%;background:0;border-radius: 10pt;">
 <div style="height:100%;width:100%;background:;border-radius: 10pt;">
 <div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">Signup</h1>
    
    <form   name="signup" id="signup" method="post" action="Signup" onsubmit="return signupvalidate()">  
    <div class="input-container"><font color="blue"><% String msg=request.getParameter("msg");
    if(msg!=null)
    {%>
    <%=msg %>
    <%} %></font>
    </div>
      <div class="input-container">
        <input type="text" id="firstname" name="firstname"/>
        <label for="firstname">Firstname</label>
        <div class="bar"></div>
      </div>
	   <div class="input-container">
        <input type="text" id="lastname" name="lastname" onkeyup="call()"/>
        <label for="lastname">Lastname</label>
        <div class="bar"></div>
      </div>
	  <div class="input-container">
        <input type="text" id="email" name="email" onkeyup="call1()"/>
        <label for="text">Email</label>
        <div class="bar"></div>
      </div>
	  <div class="input-container">
        <input type="text" id="email1" name="email1" />
        <label for="text">Another Email If You Have</label>
        <div class="bar"></div>
      </div>
	  <div class="input-container">
        <input type="text" id="regdno" name="regdno" onkeyup="call2()"/>
        <label for="text">Registration Number</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id="password" name="password" onkeyup="call3()"/>
        <label for="Password">Password</label>
        <div class="bar"></div>
      </div>
	  <div class="input-container">
        <input type="password" id="confirmPassword" name="confirmPassword" onkeyup="call4()"/>
        <label for="Confirm Password">Confirm Password</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
         <select id="batch" name="batch"  style="width: 350px; height: 20px;">
        	<option value="">--SELECT--</option>
        	<option value="2013">2013</option>
        	<option value="2014">2014</option>
        	<option value="2015">2015</option>
        	<option value="2016">2016</option>
        	<option value="2017">2017</option>
        	<option value="2018">2018</option>
        	<option value="2019">2019</option>
        	<option value="2020">2020</option>
        	</select>
      <div class="bar"></div>
      </div>
   	  <div class="input-container">
			  
			<select class="form-control" id="dept" name="dept" style="width: 350px; height: 20px;" onclick="call5()">
			<option value="">--SELECT DEPARTMENT--</option>
			<%
			 	Connection con=null;
			 	String url="jdbc:mysql://localhost/university";
				ResultSet rs=null;
				Statement st=null;
			
				try
				{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection(url,"root","root");
				st=con.createStatement();
				String qry="select * from dept";
				System.out.println(qry);
				rs=st.executeQuery(qry);  
				while(rs.next())
				{
					int deptid=rs.getInt("deptid");
					String deptname=rs.getString("deptname");
				%>
									<option value="<%=deptid%>"><%=deptname%></option>
				<%
				}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
	           %>
</select>
 
                
            </div>
			
      <div class="button-container">
        <button><font color="white">SIGNUP</font></button>
      </div>
     </form>
	
	 <div class="footer"><a href="index.jsp">LOGIN</a></div>

	
	 </div>
  </div>
  
    
</div>


    
</div>
 <div style="height:20%;width:100%;background:;border-radius: 10pt;"></div>
</body>
</html>