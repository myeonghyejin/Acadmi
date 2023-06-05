package com.acadmi.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.util.Pagination;

@Mapper
public interface ChatDAO {
	
	//채팅방 목록 list
	public List<ChatRoomVO> getChatRoomList(Pagination pagination) throws Exception;
	
	//채팅방 Detail
	public ChatRoomVO getChatRoomDetail(ChatRoomVO chatRoomVO) throws Exception;
	
	//채팅방 생성
	public int setSenderChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	
	public int setRecipientChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	
	//채팅방 메세지 출력
	public List<ChatMessageVO> getChatMessage(ChatMessageVO chatMessageVO) throws Exception;
	
	//메세지 입력
	public int setSaveMessage(ChatMessageVO chatMessageVO) throws Exception;
	
}
