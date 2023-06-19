/**
 * professor 사이드바 active 표시
 */

if(window.location.pathname == '/lecture/info'){
	$('#professorLectureDetail').addClass('active')
} else if(window.location.pathname == '/lecture/syllabusAdd' || window.location.pathname == '/lecture/syllabusDetail' || window.location.pathname == '/lecture/syllabusUpdate'){
	console.log('check')
	$('#professorSyllabus').addClass('active')
} else if(window.location.pathname == '/lecture/attendee'){
	$('#professorAttendee').addClass('active')
}