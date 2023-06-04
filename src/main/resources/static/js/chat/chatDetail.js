/**
 * chat/detail에서 웹소켓 연결 및 자바스크립트 처리
 */
let sender = '20200002'

let websocket = new WebSocket("ws://localhost/chat")

// 웹소켓이 연결되었을때
websocket.onopen = function(event){
	console.log("웹소켓 연결 성공")
}

// 메세지를 받았을때 
websocket.onmessage = function(event){
	
}

// 메세지를 보낼때
$('#chatSend').click(function(){
	let message = $('#message').val()
	console.log(message)
	sendMessage(message)
}) 

// 메세지를 보내는 함수
function sendMessage(message){
	websocket.send(message)
}
