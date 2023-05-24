package com.acadmi.board;

import java.util.List;

import com.acadmi.util.Pagination;

public interface BoardDAO {
	
	public Long getTotalCount(Pagination pagination) throws Exception;
	
	public List<BoardVO> getList(Pagination pagination) throws Exception;
	
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
		
	public int setInsert(BoardVO boardVO) throws Exception;
		
	public int setUpdate(BoardVO boardVO) throws Exception;
		
	public int setDelete(BoardVO boardVO) throws Exception;
		
	public int setBoardFileAdd(BoardFileVO boardFileVO) throws Exception;

	public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception;

}
