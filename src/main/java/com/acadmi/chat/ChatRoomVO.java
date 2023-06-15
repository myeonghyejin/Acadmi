package com.acadmi.chat;

import java.util.List;

import com.acadmi.member.MemberFilesVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomVO {
	
	private Long chatNum;
	private Integer chatStatus;
	private String roomSender;
	private String roomRecipient;
	private String senderName;
	private String recipientName;
	private List<ChatMessageVO> chatMessageVOs;
	private MemberFilesVO memberFilesVO;

}
