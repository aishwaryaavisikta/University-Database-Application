function loginvalidate() {
	
/*VALIDATION FOR REGISTRATION NUMBER*/
	var regdno = document.getElementById("regdno").value;
	var r = regdno.length;
	var r1 = document.login.regdno.value;
	if(regdno=="") {
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
	var p = password.length;
	var u = document.login.password.value;
	if(password=="") {
	alert("PLEASE ENTER YOUR PASSWORD");
	return false;
	}
	else if(p<4||p>16) {
		alert("PASSWORD SHOULD BE OF 4-16 CHARACTERS");
		return false;
	}
	/*VALIDATION FOR TYPE*/
	var type = document.getElementById("type").value;
	var t = type.length;
	var t1 = document.login.type.value;
	if(type=="") {
		alert("PLEASE SELECT YOUR TYPE");
		return false;} 
	else {
		return true;
	}
}