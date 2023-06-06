/**
 * chat/detail에서 웹소켓 연결 및 자바스크립트 처리
 */


let websocket = new WebSocket("ws://localhost/chat")

// 웹소켓이 연결되었을때
websocket.onopen = function(event){
	console.log("웹소켓 연결 성공")
}

// 메세지를 받았을때 
websocket.onmessage = function(event){
	let msgContents = event.data
	let msgSender = getUrlParameter('roomRecipient')
	let msgRecipient = getUrlParameter('roomSender')
	let chatNum = $('#chatNum').val();
	console.log(chatNum)
	let date = new Date().toLocaleTimeString();
	let message = {
		msgContents : msgContents,
		msgRecipient : msgRecipient,
		msgSender : msgSender,
		chatNum : chatNum
	}
	let child = '<div class="direct-chat-msg">'
	child = child + '<span class="direct-chat-name float-left">'+msgSender+'</span>'
	child = child + '<span class="direct-chat-timestamp float-right">'+date+'</span></div>'
	child = child + '<img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="...">'
	child = child + '<div class="direct-chat-text">'+msgContents+'</div></div>'
	$('#messageList').append(child)
	sendMessage(JSON.stringify(message))
	scrollToBottom()
}

// 메세지를 보낼때
//send 버튼 클릭
$('#chatSend').click(function(event){
	event.preventDefault()
	let msgContents = $('#message').val()
	let msgSender = getUrlParameter('roomSender')
	let msgRecipient = getUrlParameter('roomRecipient')
	let chatNum = $('#chatNum').val();
	let date = new Date().toLocaleTimeString();
	console.log(chatNum)
	let message = {
		msgContents : msgContents,
		msgRecipient : msgRecipient,
		msgSender : msgSender,
		chatNum : chatNum
	}
	
	let child = '<div class="direct-chat-msg right">'
	child = child + '<div class="direct-chat-infos clearfix">'
	child = child + '<span class="direct-chat-name float-right">'+msgSender+'</span>'
	child = child + '<span class="direct-chat-timestamp float-left">'+date+'</span></div>'
	child = child + '<img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">'
	child = child + '<div class="direct-chat-text text-right">'+msgContents+'</div></div>'
	$('#messageList').append(child)
	sendMessage(JSON.stringify(message))
	scrollToBottom()
	$('#message').val('')
})

//enter키 눌렀을때
$('#message').keydown(function(event) {
  if (event.key === 'Enter') {
    event.preventDefault(); // 폼 제출 동작 막기

    let msgContents = $('#message').val();
    let msgSender = getUrlParameter('roomSender');
    let msgRecipient = getUrlParameter('roomRecipient');
    let chatNum = $('#chatNum').val();
    let date = new Date().toLocaleTimeString();
    console.log(chatNum);
    let message = {
      msgContents: msgContents,
      msgRecipient: msgRecipient,
      msgSender: msgSender,
      chatNum: chatNum
    };

    let child = '<div class="direct-chat-msg right">';
    child += '<div class="direct-chat-infos clearfix">';
    child += '<span class="direct-chat-name float-right">' + msgSender + '</span>';
    child += '<span class="direct-chat-timestamp float-left">' + date + '</span></div>';
    child += '<img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">';
    child += '<div class="direct-chat-text text-right">' + msgContents + '</div></div>';
    $('#messageList').append(child);
    sendMessage(JSON.stringify(message));
    scrollToBottom();
    $('#message').val('');
  }
});


//웹소켓 연결 해제
$(window).on('beforeunload', function() {
	websocket.close();
});

//스크롤 아래로 내리는 함수
function scrollToBottom(){
	let messageList = $('#messageList')
	messageList.scrollTop(messageList.prop("scrollHeight"))
}
scrollToBottom()

// url에서 파라미터 값을 뽑아오는 함수
function getUrlParameter(name){
	let urlParams = new URLSearchParams(window.location.search);
	return urlParams.get(name);
}

// 메세지를 보내는 함수
function sendMessage(message){
	websocket.send(message)
}
