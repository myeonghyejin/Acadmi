/**
 * nofificationList에서 사용되는 JavaScript
 */

 $('#saveNotification').click(function(){
	let save = confirm('저장하시겠습니까?')
	if(save){
		$.ajax({
			type : "GET",
			url : "./notificationStatus",
			data : {
				notificationNum : $('#saveNotification').attr('data-notification-num'),
				notificationStatus : 2
			},
			success : function(result){
				alert(result)
				location.href = './list?notificationKind='+$('#saveNotification').attr('data-notification-kind')
			},
			error : function(){
				console.log('error')
			}
		})
	}
 })
 
 $('#cancleNotification').click(function(){
	 let cancle = confirm('취소하시겠습니까?')
	 if(cancle){
		 $.ajax({
			type : "GET",
			url : "./notificationStatus",
			data : {
				notificationNum : $('#cancleNotification').attr('data-notification-num'),
				notificationStatus : 1
			},
			success : function(result){
				alert(result)
				location.href = './list?notificationKind='+$('#cancleNotification').attr('data-notification-kind')
			},
			error : function(){
				console.log('error')
			}
		 })	 
	 }
 })