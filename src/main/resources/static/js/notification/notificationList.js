/**
 * nofificationList에서 사용되는 JavaScript
 */

let notificationKind = getUrlParameter('notificationKind');

if(notificationKind == 1)	{
	$('#noticeButton').addClass('active')
} else if(notificationKind == 2) {
	$('#qnaButton').addClass('active')
} else if(notificationKind == 3) {
	$('#qnaReplyButton').addClass('active')
} else if(notificationKind == 4) {
	$('#lectureNoticeButton').addClass('active')
} else if(notificationKind == 5) {
	$('#lectureQnaButton').addClass('active')
} else if(notificationKind == 6) {
	$('#lectureQnaReplyButton').addClass('active')
} else if(notificationKind == 7) {
	$('#lectureButton').addClass('active')
} else {
	$('#notificationButton').addClass('active')
}

function getUrlParameter(name){
	let urlParams = new URLSearchParams(window.location.search);
	return urlParams.get(name);
}

$('.saveNotification').each(function(index,item){
	$(item).click(function(){
		console.log('click')
		let save = confirm('보관하시겠습니까?')
		if(save){
			$.ajax({
				type : "GET",
				url : "./notificationStatus",
				data : {
					notificationNum : $(item).attr('data-notification-num'),
					notificationStatus : 2
				},
				success : function(result){
					alert(result)
					location.href = './list?notificationKind='+$(item).attr('data-notification-kind')
				},
				error : function(){
					console.log('error')
				}
			})
		}
	})
})

$('.cancleNotification').each(function(index,item){
	$(item).click(function(){
		let cancle = confirm('취소하시겠습니까?')
		if(cancle){
			$.ajax({
				type : "GET",
				url : "./notificationStatus",
				data : {
					notificationNum : $(item).attr('data-notification-num'),
					notificationStatus : 1
				},
				success : function(result){
					alert(result)
					location.href = './list?notificationKind='+$(item).attr('data-notification-kind')
				},
				error : function(){
					console.log('error')
				}
			})	 
		}
	})
})

