<html>
<title>CUTM</title>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/login.css">
<script src="js/Login.js"></script>
	<script type="text/javascript">
	function call()
	{
		var type=document.getElementById("type").value();
		if(type=="")
			{
				document.getElementById("result").innerHTML="Select Type";
			}
		else
			{
				document.getElementById("result").innerHTML="";
			}
	}</script>
</head>
<body>
<div class="pen-title" style="height:10%;width:100%;background:;border-radius: 10pt;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom:0px;text-align: center;letter-spacing: 
2px;"><h1>UNIVERSITY DATABASE APPLICATION</h1>
 </div>
 
<div style="height:70%;width:100%;background:0;border-radius: 10pt;">
<div class="container" ">
  <div class="card"></div>
  <div class="card">
     <h1 class="title">Login</h1>
	 <h3 >${param.msg}</h3><br>
     <form class="login-form"  name="login" id="login" method="post" action="Login" onsubmit="return loginvalidate()">
        <div class="input-container">
         <input type="text" id="regdno" name="regdno">
         <label for="">Registration Number</label>
         <div class="bar"></div>
        </div>
      <div class="input-container">
        <input type="password" id="password" name="password">
        <label for="Password">Password</label>
        <div class="bar"></div>
      </div>
	  <div class="input-container">
                <select class="form-control" name="type" id="type" style="width:100%;height:;" onselect="call()">
                         <option value="">---SELECT---</option>				
                         <option value="student">STUDENT</option>
                         <option value="instructor">INSTRUCTOR</option>
                         <option value="hod">HOD</option>
                </select>
                
       </div>
      <div class="button-container">
        <button><span>LOGIN</span></button>
      </div>
	  </form>
	  <div class="footer"><a href="signup.jsp">SIGNUP</a></div>
    
  </div>
</div></div>
<div style="height:20%;width:100%;background:;border-radius: 10pt;"></div>
</body>
</html>