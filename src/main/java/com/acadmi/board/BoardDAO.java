package com.acadmi.board;

import java.util.List;

import com.acadmi.util.Pagination;

public interface BoardDAO {
	
	public Long getTotalCount(Pagination pagination) throws Exception;
	
	public List<BoardVO> getList(Pagination pagination) throws Exception;
	
	// 글 하나 조회
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
		
	// 글쓰기
	public int setInsert(BoardVO boardVO) throws Exception;
		
	// 글수정
	public int setUpdate(BoardVO boardVO) throws Exception;
		
	// 글삭제
	public int setDelete(BoardVO boardVO) throws Exception;
		
	// 파일 등록
	public int setBoardFileAdd(BoardFileVO boardFileVO) throws Exception;
		
	// 파일조회
	public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception;

}
