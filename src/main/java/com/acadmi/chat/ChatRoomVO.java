package com.acadmi.chat;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomVO {
	
	private Long chatNum;
	private Integer chatStatus;
	private String sender;
	private String recipient;
	private List<ChatMessageVO> chatMessageVOs;

}
