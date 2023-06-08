package com.acadmi.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;

import com.acadmi.util.Pagination;
import com.acadmi.webSocket.ChatWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	//채팅방 목록 list
	public List<ChatRoomVO> getChatRoomList(Pagination pagination, HttpSession session) throws Exception {
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication= contextImpl.getAuthentication();
		pagination.setUsername(authentication.getName());
		return chatDAO.getChatRoomList(pagination);
	}
	
	//채팅방 메세지 출력
	public ChatRoomVO getChatRoom(ChatRoomVO chatRoomVO) throws Exception {
		int result = 0;
		String sender = chatRoomVO.getRoomSender();
		String recipient = chatRoomVO.getRoomRecipient();
		chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
		
		//처음 채팅할때
		if(chatRoomVO == null) {
			chatRoomVO = new ChatRoomVO();
			chatRoomVO.setRoomSender(sender);
			chatRoomVO.setRoomRecipient(recipient);
			result = chatDAO.setSenderChatRoom(chatRoomVO);
			result = chatDAO.setRecipientChatRoom(chatRoomVO);
			chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
			log.info("chatNum {}: ",chatRoomVO.getChatNum());
		}
		
		//상대방이 채팅방을 나갔을때
		ChatRoomVO yourChatRoomVO = new ChatRoomVO();
		yourChatRoomVO.setRoomSender(recipient);
		yourChatRoomVO.setRoomRecipient(sender);
		yourChatRoomVO = chatDAO.getChatRoom(yourChatRoomVO);
		if(yourChatRoomVO==null) {
			return chatDAO.getChatRoom(chatRoomVO);
		}
		
		//정상적인 상황
		chatRoomVO.setChatStatus(1);
		result = chatDAO.setChatRoomUpdate(chatRoomVO);
		ChatMessageVO chatMessageVO = new ChatMessageVO();
		chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		result = chatDAO.setMyChatMessageUpdate(chatMessageVO);
		chatMessageVO.setChatNum(yourChatRoomVO.getChatNum());
		result = chatDAO.setYourChatMessageUpdate(chatMessageVO);
		
		return chatDAO.getChatRoom(chatRoomVO);
	}
	
	//메세지 저장
	public int setSaveMessage(ChatMessageVO chatMessageVO) throws Exception {
		return chatDAO.setSaveMessage(chatMessageVO);
	}
	
	//채팅방 나가기
	public int setChatRoomDelete(ChatRoomVO chatRoomVO) throws Exception {
		int result = chatDAO.setChatRoomDelete(chatRoomVO);
		String sender = chatRoomVO.getRoomSender();
		String recipient = chatRoomVO.getRoomRecipient();
		chatRoomVO.setRoomSender(recipient);
		chatRoomVO.setRoomRecipient(sender);
		chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
		if(chatRoomVO==null) {
			return result;
		}
		chatRoomVO.setChatStatus(2);
		result = chatDAO.setChatRoomUpdate(chatRoomVO);
		return result;
	}
	

}
