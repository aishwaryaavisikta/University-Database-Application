function registrationvalidate(){
/*VALIDATION FOR SEMESTER*/
	var semester = document.getElementById("semester").value;
	var t = semester.length;
	var t1 = document.sentMessage.semester.value;
	if(semester=="") {
		alert("PLEASE SELECT YOUR SEMESTER");
		return false;} 
	
	else {
		return true;
	}
	/*VALIDATION FOR COURSENAME*/
	var coursename = document.getElementById("coursename").value;
	var t = coursename.length;
	var t1 = document.sentMessage.coursename.value;
	if(coursename=="") {
		alert("SELECT COURSES");
		return false;} 
	
	else {
		return true;
	}
}

		 
	

