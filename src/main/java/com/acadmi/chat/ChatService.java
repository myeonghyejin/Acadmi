package com.acadmi.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	//채팅방을 불러오는 메서드
	public getChatRoomDetail(ChatRoomVO chatRoomVO) throws Exception;
	

}
