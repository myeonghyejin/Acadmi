package com.acadmi.chat;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatDAO {
	
	//채팅방을 불러오는 메서드
	public ChatRoomVO getChatRoomDetail(ChatRoomVO chatRoomVO) throws Exception;

}
