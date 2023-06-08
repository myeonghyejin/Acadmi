/**
 * 채팅리스트에서 쓰이는 JS
 */

$(document).ready(function(){
	$('.deleteButton').hide();
	
	$('.chatRoom').on('mouseenter',function(){
		$(this).find('.deleteButton').show();
	})
	
	$('.chatRoom').on('mouseleave',function(){
		$(this).find('.deleteButton').hide()
	})
	
	$('.deleteButton').on('click', function(e){
		e.preventDefault()
		let check = confirm('채팅방을 나가시겠습니까?')
		if(check){		
			let chatNum = $(this).data('chat-num')
			let roomSender = $(this).data('room-sender')
			let roomRecipient = $(this).data('room-recipient')
			$.ajax({
				type : "POST",
				url : "./chatRoomDelete",
				data : {
					chatNum : chatNum,
					roomSender : roomSender,
					roomRecipient : roomRecipient
				},
				success : function(result){
					if(result>=1){
						alert('채팅방에서 나왔습니다.')
						location.href='./list'
					} else {
						alert('나가지 못했습니다.')
						location.href='./list'
					}
				},
				error : function(){
					console.log('error')
				}
			})
		}
	})
})