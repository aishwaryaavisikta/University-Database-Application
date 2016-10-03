function signupvalidate() {
	
	/*VALIDATION FOR FIRST NAME*/
	var fname = document.getElementById("firstname").value;
	var f = fname.length;
	var f1 = document.signup.firstname.value;
	if(f1=="") {
		alert("PLEASE ENTER YOUR FIRST NAME");
		return false;} 
	else if(f>=25) {
		alert("FIRST NAME SHOULD NOT BE MORE THAN 25 CHARACTERS");
		return false;
	}
	
	/*VALIDATION FOR LAST NAME*/
	var lname = document.getElementById("lastname").value;
	var l = lname.length;
	var l1 = document.signup.lastname.value;
	if(l1=="") {
		alert("PLEASE ENTER YOUR LAST NAME");
		return false;} 
	else if(l>=25) {
		alert("LAST NAME SHOULD NOT BE MORE THAN 25 CHARACTERS");
		return false;
	}
	/*VALIDATION FOR EMAIL*/
	var x = document.signup.email.value;  
	var atposition = x.indexOf("@");  
	var dotposition = x.lastIndexOf(".");  
	if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
		alert("PLEASE ENTER A VALID EMAIL ADDRESS IN THE FORMAT OF very.common@example.com ");  
		return false; 
	}	
	/*VALIDATION FOR ANOTHER EMAIL*/
	var y = document.signup.email1.value;  
	var atposition = y.indexOf("@");  
	var dotposition = y.lastIndexOf(".");  
	if (atposition<1 || dotposition<atposition+2 || dotposition+2>=y.length){  
		alert("PLEASE ENTER AN ANOTHER VALID EMAIL ADDRESS IN THE FORMAT OF very.common@example.com IF YOU HAVE");  
		return false; 
	}	
	/*VALIDATION FOR REGISTRATION NUMBER*/
	var regdno = document.getElementById("regdno").value;
	var r = regdno.length;
	var r1 = document.signup.regdno.value;
	if(r1=="") {
		alert("PLEASE ENTER YOUR REGISTRATION NUMBER");
		return false;} 
	else if(r>=13) {
		alert("REGISTRATION NUMBER SHOULD NOT BE MORE THAN 13 CHARACTERS");
		return false;
	}
	var TCode=document.getElementById("regdno").value;
	if( (/[^a-zA-Z0-9]/.test( TCode ))){
		alert("PLEASE ENTER ALPHANUMERIC CHARACTERS");
		return false;
	}
	
	/*VALIDATION FOR PASSWORD*/
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var p = password.length;
	var n = confirmPassword.length;
	var u = document.signup.password.value;
	var w = document.signup.confirmPassword.value;
	if(password=="") {
	alert("PLEASE ENTER YOUR PASSWORD");
	return false;
	}
	else if(p<4||p>16) {
		alert("PASSWORD SHOULD BE OF 4-16 CHARACTERS");
		return false;
	}
	else if(confirmPassword=="") {
	alert("PLEASE ENTER YOUR CONFIRM PASSWORD");
	return false;
	}
	else if(n<4||n>16) {
		alert("CONFIRM PASSWORD SHOULD BE OF 4-16 CHARACTERS");
		return false;
	}
	else if (password != confirmPassword){
        alert("PASSWORDS DO NOT MMATCH");
		return false;
	}
	/*VALIDATION FOR BATCH*/
	var batch = document.getElementById("batch").value;
	var b = batch.length;
	var b1 = document.signup.batch.value;
	if(batch=="") {
		alert("PLEASE SELECT YOUR BATCH");
		return false;} 
	
	/*VALIDATION FOR DEPARTMENT*/
	var dept = document.getElementById("dept").value;
	var t = dept.length;
	var t1 = document.signup.dept.value;
	if(t1=="") {
		alert("PLEASE SELECT YOUR DEPARTMENT");
		return false;} 
	
	else {
		return true;
	}

		 
	
}