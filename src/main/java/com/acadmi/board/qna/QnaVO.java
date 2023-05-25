package com.acadmi.board.qna;

import java.util.List;

import com.acadmi.board.BoardVO;
import com.acadmi.util.FileVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnaVO extends BoardVO {
	
	private Long ref;
	private Long step;
	private Long depth;
	private List<QnaFileVO> qnaFileVOs;
}
