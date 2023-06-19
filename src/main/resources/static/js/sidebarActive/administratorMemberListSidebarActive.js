/**
 * administrator_join 사이드바 active 표시
 */

 if(window.location.pathname == '/administrator/studentList'){
	 $('#administratorStudentList').addClass('active')
 } else if(window.location.pathname == '/administrator/professorList'){
	 $('#administratorProfessorList').addClass('active')
 } else if(window.location.pathname == '/administrator/administratorList'){
	 $('#administratorAdministratorList').addClass('active')
 }