package com.acadmi.chat;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Chat_roomVO {
	
	private Long chatNum;
	private Integer chatStatus;
	private String sender;
	private String recipient;
	private List<Chat_messageVO> chat_messages;

}
