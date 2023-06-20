/**
 * administrator_join 사이드바 active 표시
 */

 if(window.location.pathname == '/administrator/studentAdd'){
	 $('#administratorStudentAdd').addClass('active')
 } else if(window.location.pathname == '/administrator/professorAdd'){
	 $('#administratorProfessorAdd').addClass('active')
 } else if(window.location.pathname == '/administrator/administratorAdd'){
	 $('#administratorAdministratorAdd').addClass('active')
 }