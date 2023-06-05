package com.acadmi.board;

import java.util.List;

import com.acadmi.board.lectureNotice.LectureNoticeVO;
import com.acadmi.board.notice.NoticeVO;
import com.acadmi.board.qna.QnaVO;
import com.acadmi.util.FileVO;
import com.acadmi.util.Pagination;

public interface BoardDAO {
	
	public Long getTotalCount(Pagination pagination) throws Exception;
	
	public List<BoardVO> getList(Pagination pagination) throws Exception;
	
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
		
	public int setInsert(BoardVO boardVO) throws Exception;
		
	public int setUpdate(BoardVO boardVO) throws Exception;
		
	public int setDelete(BoardVO boardVO) throws Exception;
		
	public int setBoardFileAdd(FileVO fileVO) throws Exception;

	public FileVO getFileDetail(FileVO fileVO) throws Exception;

	public int setBoardFileDelete(FileVO fileVO) throws Exception;
	
	public List<BoardVO> getImportantList(NoticeVO noticeVO) throws Exception;
	
	public int setNoticeHit(NoticeVO noticeVO) throws Exception;
	
	public int setLectureNoticeHit(LectureNoticeVO lectureNoticeVO) throws Exception;
	
	public int setStepUpdate(QnaVO qnaVO) throws Exception;
	
	public int setReplyAdd(QnaVO qnaVO) throws Exception;
	
	public QnaVO getReplyDetail(QnaVO qnaVO) throws Exception;
	
	public Long getQnaList(QnaVO qnaVO) throws Exception;
	
}
