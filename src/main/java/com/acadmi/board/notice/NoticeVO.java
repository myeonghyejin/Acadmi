package com.acadmi.board.notice;

import java.sql.Date;
import java.util.List;

import com.acadmi.board.BoardVO;
import com.acadmi.util.FileVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO extends BoardVO {
	
	private Long hit;
	private Date modifyDate;
	private Long important;
}
