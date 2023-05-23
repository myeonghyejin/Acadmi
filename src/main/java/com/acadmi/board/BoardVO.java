package com.acadmi.board;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private Long num;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	
}
