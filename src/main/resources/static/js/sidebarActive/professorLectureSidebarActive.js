/**
 * professor 사이드바 active 표시
 */

if(window.location.pathname == '/lecture/info'){
	$('#professorLectureDetail').addClass('active')
} else if(window.location.pathname == '/lecture/syllabusAdd' || window.location.pathname == '/lecture/syllabusDetail' || window.location.pathname == '/lecture/syllabusUpdate'){
	$('#professorSyllabus').addClass('active')
} else if(window.location.pathname == '/lecture/attendee'){
	$('#professorAttendee').addClass('active')
} else if(window.location.pathname.startsWith('/lectureNotice')){
	$('#lectureNoticeList').addClass('active')
} else if(window.location.pathname.startsWith('/lectureQna')){
	$('#lectureQnaList').addClass('active')
}