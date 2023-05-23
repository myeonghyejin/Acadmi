package com.acadmi.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.acadmi.util.Pagination;

public interface BoardService {
	
	public List<BoardVO> getList(Pagination pagination) throws Exception;
		
	// 글 하나 조회
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
			
	// 글쓰기
	public int setInsert(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception;
			
	// 글수정
	public int setUpdate(BoardVO boardVO) throws Exception;
			
	// 글삭제
	public int setDelete(BoardVO boardVO) throws Exception;
		
	// 파일조회
	public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception;
}
