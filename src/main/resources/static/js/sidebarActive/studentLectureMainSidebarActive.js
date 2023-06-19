/**
 * student 사이드바 active 표시
 */

if(window.location.pathname == '/student/lecture/syllabusDetail'){
	$('#studentSyllabusDetail').addClass('active')
} else if (window.location.pathname == '/student/lecture/attendee'){
	$('#studentAttendeeList').addClass('active')
} else if(window.location.pathname.startsWith('/lectureNotice')){
	$('#lectureNoticeList').addClass('active')
} else if(window.location.pathname.startsWith('/lectureQna')){
	$('#lectureQnaList').addClass('active')
}