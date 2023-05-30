package com.acadmi.board.lectureNotice;

import java.util.Date;

import com.acadmi.board.BoardVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LectureNoticeVO extends BoardVO {
	
	private Long lectureNum;
	private Integer hit;
	private Date modifiyDate;

}
