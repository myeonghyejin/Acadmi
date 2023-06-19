/**
 * administrator 사이드바 active 표시
 */

if(window.location.pathname.startsWith('/notice')){
	$('#boardItem').addClass('menu-open')
	$('#boardLink').addClass('active')
	$('#noticeLink').addClass('active')
} else if(window.location.pathname.startsWith('/qna')){
	$('#boardItem').addClass('menu-open')
	$('#boardLink').addClass('active')
	$('#qnaLink').addClass('active')
} else if(window.location.pathname == '/administrator/lectureList'){
	$('#administratorLectureItem').addClass('menu-open')
	$('#administratorLectureLink').addClass('active')
	$('#administratorLectureList').addClass('active')
} else if(window.location.pathname == '/administrator/studentAdd' || window.location.pathname == '/administrator/professorAdd' || window.location.pathname == '/administrator/administratorAdd'){
	$('#memberItem').addClass('menu-open')
	$('#memberLink').addClass('active')
	$('#acountLink').addClass('active')
} else if(window.location.pathname == '/administrator/studentList' || window.location.pathname == '/administrator/professorList' || window.location.pathname == '/administrator/administratorList'){
	$('#memberItem').addClass('menu-open')
	$('#memberLink').addClass('active')
	$('#acountList').addClass('active')
} else if(window.location.pathname == '/administrator/periodAdd'){
	$('#periodItem').addClass('menu-open')
	$('#periodLink').addClass('active')
	$('#periodAddLink').addClass('active')
} else if(window.location.pathname == '/administrator/lectureRoomList'){
	$('#lectureRoomItem').addClass('menu-open')
	$('#lectureRoomLink').addClass('active')
	$('#lectureRoomList').addClass('active')
} else if(window.location.pathname == '/administrator/departmentList' || window.location.pathname == '/administrator/departmentAdd'){
	$('#departmentItem').addClass('menu-open')
	$('#departmentLink').addClass('active')
	$('#departmentList').addClass('active')
}
