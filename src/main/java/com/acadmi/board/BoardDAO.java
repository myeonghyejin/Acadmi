package com.acadmi.board;

import java.util.List;

import com.acadmi.util.Pagination;

public interface BoardDAO {
	
	public Long getTotalCount(Pagination pagination) throws Exception;
	
	public List<BoardVO> getList(Pagination pagination) throws Exception;
}
