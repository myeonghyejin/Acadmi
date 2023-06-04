package com.acadmi.chat;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageVO {
	
	private Long msgNum;
	private String sender;
	private String recipient;
	private String msgContents;
	private LocalDateTime msgDate;
	private Integer msgStatus;
	private Long chatNum;
	private List<ChatFilesVO> chatFilesVOs;

}
