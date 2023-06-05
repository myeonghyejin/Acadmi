package com.acadmi.webSocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.acadmi.chat.ChatMessageVO;
import com.acadmi.chat.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> sessions = new HashMap<>();
	
	@Autowired
	private ChatService chatService;
	
	//메세지를 보내는 메서드
	private void sendMessage(ChatMessageVO chatMessageVO) throws Exception {
		int result = 0;
		WebSocketSession session = sessions.get(chatMessageVO.getRecipient());
		if(session != null && session.isOpen()) {
			chatMessageVO.setMsgStatus(1);
			result = chatService.setSaveMessage(chatMessageVO);
			session.sendMessage(new TextMessage(chatMessageVO.getMsgContents()));
		} else {
			log.info("msgContents : {}",chatMessageVO.getMsgContents());
			chatMessageVO.setMsgStatus(0);
			result = chatService.setSaveMessage(chatMessageVO);
			String sender = chatMessageVO.getRecipient();
			String recipient = chatMessageVO.getSender();
			chatMessageVO.setSender(sender);
			chatMessageVO.setRecipient(recipient);
			result = chatService.setSaveMessage(chatMessageVO);
		}
	}
	
	//메세지를 받는 메서드
	private void receiveMessage(ChatMessageVO chatMessageVO) throws Exception {
		int result = 0;
		WebSocketSession session = sessions.get(chatMessageVO.getSender());
		if(session != null && session.isOpen()) {
			chatMessageVO.setMsgStatus(1);
			result = chatService.setSaveMessage(chatMessageVO);
		} else {
			chatMessageVO.setMsgStatus(0);
			result = chatService.setSaveMessage(chatMessageVO);
		}
	}
	
	//JSON으로 온 메세지 처리
	private ChatMessageVO processMessage(String payload) throws Exception{
		ObjectMapper objectMapper = new ObjectMapper();
		ChatMessageVO chatMessageVO = objectMapper.readValue(payload, ChatMessageVO.class);
		return chatMessageVO;
	}
	
	//웹소켓에 클라이언트가 연결되었을때 실행되는 코드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String username=session.getPrincipal().getName();
		sessions.put(username, session);
		log.info("클라이언트가 연결되었습니다. 세션 ID : {}",username);
	}
	
	//클라이언트로부터 메세지를 수신하였을 때 실행되는 코드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payload = (String)message.getPayload();
		ChatMessageVO chatMessageVO = this.processMessage(payload);
		log.info("=====session의 sender : {}",session.getPrincipal().getName());
		log.info("=====chatVO의 sender : {}",chatMessageVO.getSender());
		if(session.getPrincipal().getName().equals(chatMessageVO.getSender())) {
			log.info("=======보내는 msgContents : {}",chatMessageVO.getMsgContents());
			log.info("=======보내는 recipient : {}",chatMessageVO.getRecipient());
			log.info("=======보내는 sender : {}",chatMessageVO.getSender());
			this.sendMessage(chatMessageVO);
		} else {
			log.info("=======받는 msgContents : {}",chatMessageVO.getMsgContents());
			log.info("=======받는 recipient : {}",chatMessageVO.getRecipient());
			log.info("=======받는 sender : {}",chatMessageVO.getSender());
			this.receiveMessage(chatMessageVO);
		}
	}
	
	//연결이 해제되었을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("WebSocket 연결이 해제되었습니다. 세션 ID: {}",session.getPrincipal().getName());
		sessions.remove(session.getPrincipal().getName());
	}

}
