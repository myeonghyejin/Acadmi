package com.acadmi.board;

import java.util.List;

import com.acadmi.util.Pagination;

public interface BoardService {
	
	public List<BoardVO> getList(Pagination pagination) throws Exception;
}
