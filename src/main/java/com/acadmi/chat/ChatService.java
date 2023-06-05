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
	public List<ChatMessageVO> getChatMessage(ChatMessageVO chatMessageVO) throws Exception {
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setSender(chatMessageVO.getSender());
		chatRoomVO.setRecipient(chatMessageVO.getRecipient());
		chatRoomVO = chatDAO.getChatRoomDetail(chatRoomVO);
		if(chatRoomVO == null) {
			chatRoomVO.setSender(chatMessageVO.getSender());
			chatRoomVO.setRecipient(chatMessageVO.getRecipient());
			int result = chatDAO.setSenderChatRoom(chatRoomVO);
			result = chatDAO.setRecipientChatRoom(chatRoomVO);
		} else {
			chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		}
		return chatDAO.getChatMessage(chatMessageVO);
	}
	
	//메세지 저장
	public int setSaveMessage(ChatMessageVO chatMessageVO) throws Exception {
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setSender(chatMessageVO.getSender());
		chatRoomVO.setRecipient(chatMessageVO.getRecipient());
		chatRoomVO = chatDAO.getChatRoomDetail(chatRoomVO);
		chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		int result = chatDAO.setSaveMessage(chatMessageVO);
		return result;
	}
	

}
