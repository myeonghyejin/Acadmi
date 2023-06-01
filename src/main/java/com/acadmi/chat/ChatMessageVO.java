package com.acadmi.chat;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageVO {
	
	private Long msgNum;
	private String username;
	private String msgContents;
	private Date msgDate;
	private Integer msgStatus;
	private Long chatNum;
	private List<ChatFilesVO> chatFilesVOs;

}
