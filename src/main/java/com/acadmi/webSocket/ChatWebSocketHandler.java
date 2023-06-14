package com.acadmi.webSocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.acadmi.chat.ChatDAO;
import com.acadmi.chat.ChatFilesVO;
import com.acadmi.chat.ChatMessageVO;
import com.acadmi.chat.ChatRoomVO;
import com.acadmi.chat.ChatService;
import com.acadmi.util.FileManager;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> sessions = new HashMap<>();
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ChatDAO chatDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.chat}")
	private String path;
	
	//메세지를 보내는 메서드
	private void sendMessage(ChatMessageVO chatMessageVO) throws Exception {
		int result = 0;
		WebSocketSession session = sessions.get(chatMessageVO.getMsgRecipient());
		if(session != null && session.isOpen()) {
			chatMessageVO.setMsgStatus(1);
			result = chatService.setSaveMessage(chatMessageVO);
			session.sendMessage(new TextMessage(chatMessageVO.getMsgContents()));
		} else {
			chatMessageVO.setMsgStatus(0);
			result = chatService.setSaveMessage(chatMessageVO);
			ChatRoomVO yourChatRoomVO = new ChatRoomVO();
			yourChatRoomVO.setRoomSender(chatMessageVO.getMsgRecipient());
			yourChatRoomVO.setRoomRecipient(chatMessageVO.getMsgSender());
			yourChatRoomVO = chatDAO.getChatRoom(yourChatRoomVO);
			if(yourChatRoomVO == null) {
				return ;
			}
			yourChatRoomVO.setChatStatus(0);
			result = chatDAO.setChatRoomUpdate(yourChatRoomVO);
			chatMessageVO.setChatNum(yourChatRoomVO.getChatNum());
			result = chatService.setSaveMessage(chatMessageVO);
		}
		
	}
	
	//메세지를 받는 메서드
	private void receiveMessage(ChatMessageVO chatMessageVO) throws Exception {
		chatMessageVO.setMsgStatus(1);
		int result = chatService.setSaveMessage(chatMessageVO);
//		WebSocketSession session = sessions.get(chatMessageVO.getMsgSender());
//		if(session != null && session.isOpen()) {
//			chatMessageVO.setMsgStatus(1);
//			result = chatService.setSaveMessage(chatMessageVO);
//		} else {
//			chatMessageVO.setMsgStatus(0);
//			result = chatService.setSaveMessage(chatMessageVO);
//			ChatRoomVO yourChatRoom = new ChatRoomVO();
//			yourChatRoom = 
//		}
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
		log.info("message : {}", message.getClass().getName());
		if(message instanceof BinaryMessage) {
			String sessionId = session.getPrincipal().getName();
			String oriName = (String)session.getAttributes().get(sessionId+"_fileName");
			Long msgNum = (Long)session.getAttributes().get(sessionId+"_msgNum");
			BinaryMessage binaryMessage = (BinaryMessage) message;
			byte[] payload = binaryMessage.getPayload().array();
			String fileName = fileManager.saveFile(path, payload, oriName);
			ChatFilesVO chatFilesVO = new ChatFilesVO();
			chatFilesVO.setMsgNum(msgNum);
			chatFilesVO.setFileName(fileName);
			chatFilesVO.setOriName(oriName);
			int result = chatDAO.setChatFileAdd(chatFilesVO);
			session.getAttributes().remove(sessionId+"_msgNum");
			session.getAttributes().remove(sessionId+"_fileName");
		} else if (message instanceof TextMessage) {
			String payload = (String)message.getPayload();
			ObjectMapper mapper = new ObjectMapper();
			String type = mapper.readValue(payload, Map.class).get("type").toString();
			Long chatNum = Long.parseLong(mapper.readValue(payload, Map.class).get("chatNum").toString());
			if(type.equals("file")) {
				String fileName = mapper.readValue(payload, Map.class).get("fileName").toString();
				String sessionId = session.getPrincipal().getName();
				session.getAttributes().put(sessionId+"_fileName", fileName);
			}
			ChatMessageVO chatMessageVO = this.processMessage(payload);
			if(session.getPrincipal().getName().equals(chatMessageVO.getMsgSender())) {
				log.info("=======보내는 msgContents : {}",chatMessageVO.getMsgContents());
				log.info("=======보내는 recipient : {}",chatMessageVO.getMsgRecipient());
				log.info("=======보내는 sender : {}",chatMessageVO.getMsgSender());
				log.info("=======보내는 chatNum : {}",chatMessageVO.getChatNum());
				this.sendMessage(chatMessageVO);
				if(type.equals("file")) {
					Long msgNum = chatDAO.getMsgNum(chatNum);
					session.getAttributes().put(session.getPrincipal().getName()+"_msgNum", msgNum);
				}
			} else {
				log.info("=======받는 msgContents : {}",chatMessageVO.getMsgContents());
				log.info("=======받는 recipient : {}",chatMessageVO.getMsgRecipient());
				log.info("=======받는 sender : {}",chatMessageVO.getMsgSender());
				log.info("=======받는 chatNum : {}",chatMessageVO.getChatNum());
				this.receiveMessage(chatMessageVO);
			}
		}
	}
	
	
	//연결이 해제되었을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("WebSocket 연결이 해제되었습니다. 세션 ID: {}",session.getPrincipal().getName());
		sessions.remove(session.getPrincipal().getName());
	}

}
