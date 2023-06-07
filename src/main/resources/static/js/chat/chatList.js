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
		let chatNum = $(this).data('chat-num')
		let roomSender = $(this).data('room-sender')
		let roomRecipient = $(this).data('room-recipient')
		console.log(chatNum)
		console.log(roomSender)
		console.log(roomRecipient)
	})
})