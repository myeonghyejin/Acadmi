package com.acadmi.board.notice;

import java.sql.Date;
import java.util.List;

import com.acadmi.board.BoardVO;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO extends BoardVO {
	
	private Long hit;
	private Date modifyDate;
	private List<NoticeFileVO> noticeFileVOs;
}
