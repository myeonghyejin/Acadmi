package com.acadmi.webSocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> sessions = new HashMap<>();
	
	// security에서 username을 뽑아오는 코드
	private String getUsernameFromSecurityContext() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}
	
	//메세지를 보내는 메서드
	private void sendMessage(String recipient, String message) throws IOException {
		WebSocketSession session = sessions.get(recipient);
		if(session != null && session.isOpen()) {
			session.sendMessage(new TextMessage(message));
		} //else {
			//채팅방에 저장하는 코드
		//}
	}
	
	//웹소켓에 클라이언트가 연결되었을때 실행되는 코드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String username = getUsernameFromSecurityContext();
		sessions.put(username, session);
		log.info("클라이언트가 연결되었습니다. 세션 ID : {}",username);
	}
	
	//클라이언트로부터 메세지를 수신하였을 때 실행되는 코드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String receicedmessage = message.getPayload();
	}
	
	

}
