function coursevalidate() {
	
	/*VALIDATION FOR SELECT COURSE NAME*/
	var courseid = document.getElementById("courseid").value;
	var c = courseid.length;
	var c1 = document.sentMessage.courseid.value;
	if(courseid=="") {
		alert("PLEASE SELECT COURSE NAME");
		return false;} 
	
	/*VALIDATION FOR SELECT INSTRUCTOR NAME */
	var instructorid = document.getElementById("instructorid").value;
	var i = instructorid.length;
	var i1 = document.sentMessage.instructorid.value;
	if(instructorid=="") {
		alert("PLEASE SELECT INSTRUCTOR NAME");
		return false;} 
	else{
		return true;
	}
	
}