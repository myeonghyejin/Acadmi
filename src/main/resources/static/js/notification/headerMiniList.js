/**
 * 헤더에 있는 알림창의 숫자 변경을 위한 JS
 */
function notification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationList",
		success : function(result){
			if(result != 0){
				$('#notification').html(result)				
			}
			$('#allNotification').html(result+'개의 알림')
		},
		error : function(){
			console.log('error')
		}
	})
}

notification()

function noticeNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 1
		},
		success : function(result){
			$('#noticeNotification').html(result+'개의 공지사항')
		},
		error : function(){
			console.log('error')
		}
	})
}

noticeNotification()

function qnaNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 2
		},
		success : function(result){
			$('#qnaNotification').html(result+'개의 질의응답')
		},
		error : function(){
			console.log('error')
		}
	})
}

qnaNotification()

function qnaReplyNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 3
		},
		success : function(result){
			$('#qnaReplyNotification').html(result+'개의 질의응답 답글')
		},
		error : function(){
			console.log('error')
		}
	})
}

qnaReplyNotification()

function lectureNoticeNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 4
		},
		success : function(result){
			$('#lectureNoticeNotification').html(result+'개의 강의 공지사항')
		},
		error : function(){
			console.log('error')
		}
	})
}

lectureNoticeNotification()

function lectureQnaNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 5
		},
		success : function(result){
			$('#lectureQnaNotification').html(result+'개의 강의 질의응답')
		},
		error : function(){
			console.log('error')
		}
	})
}

lectureQnaNotification()

function lectureQnaReplyNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 6
		},
		success : function(result){
			$('#lectureQnaReplyNotification').html(result+'개의 강의 질의응답 답글')
		},
		error : function(){
			console.log('error')
		}
	})
}

lectureQnaReplyNotification()

function lectureNotification(){
	$.ajax({
		type : "GET",
		url : "/notification/notificationKind",
		data : {
			notificationKind : 7
		},
		success : function(result){
			$('#lectureNotification').html(result+'개의 강의등록')
		},
		error : function(){
			console.log('error')
		}
	})
}

lectureNotification()