package com.acadmi.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.util.Pagination;

@Mapper
public interface ChatDAO {
	
	//채팅방 목록 list
	public List<ChatRoomVO> getChatRoomList(Pagination pagination) throws Exception;
	
	//채팅방 메세지 출력
	public ChatRoomVO getChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	
	//채팅방 생성
	//내 채팅방
	public int setSenderChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	//상대 채팅방
	public int setRecipientChatRoom(ChatRoomVO chatRoomVO) throws Exception;

	//메세지 입력
	public int setSaveMessage(ChatMessageVO chatMessageVO) throws Exception;
	
	//채팅방 상태 변경
	public int setChatRoomUpdate(ChatRoomVO chatRoomVO) throws Exception;
	
	//내 채팅방 메세지 상태 변경
	public int setMyChatMessageUpdate(ChatMessageVO chatMessageVO) throws Exception;
	
	//상대 채팅방 메세지 상태 변경
	public int setYourChatMessageUpdate(ChatMessageVO chatMessageVO) throws Exception;
	
}
