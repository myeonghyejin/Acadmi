/**
 * professor 사이드바 active 표시
 */

if(window.location.pathname.startsWith('/lecture')){
	$('#professorLectureLink').addClass('active')
	if(window.location.pathname == '/lecture/list'){
		$('#professorLectureItem').addClass('menu-open')
		$('#professorLectureList').addClass('active')
	}
} else if (window.location.pathname.startsWith('/credit')){
	$('#creditItem').addClass('menu-open')
	$('#creditLink').addClass('active')
	$('#creditManagement').addClass('active')
} else if(window.location.pathname.startsWith('/notice')){
	$('#boardItem').addClass('menu-open')
	$('#boardLink').addClass('active')
	$('#noticeLink').addClass('active')
} else if(window.location.pathname.startsWith('/qna')){
	$('#boardItem').addClass('menu-open')
	$('#boardLink').addClass('active')
	$('#qnaLink').addClass('active')
}