/**
 * nofificationList에서 사용되는 JavaScript
 */

$('.saveNotification').each(function(index,item){
	$(item).click(function(){
		console.log('click')
		let save = confirm('저장하시겠습니까?')
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

