package com.acadmi.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.acadmi.board.BoardFileVO;
import com.acadmi.board.BoardService;
import com.acadmi.board.BoardVO;
import com.acadmi.util.FileManager;
import com.acadmi.util.Pagination;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.qna}")
	private String path;
	
	@Override
	public List<BoardVO> getList(Pagination pagination) throws Exception {
		pagination.makeStartRow();
		
		pagination.makeNum(qnaDAO.getTotalCount(pagination));
		
		return qnaDAO.getList(pagination);
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		return qnaDAO.getDetail(boardVO);
	}
	
	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] multipartFiles) throws Exception {
		int result = qnaDAO.setInsert(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					BoardFileVO boardFileVO = new BoardFileVO();
					boardFileVO.setFileName(fileName);
					boardFileVO.setOriName(multipartFile.getOriginalFilename());
					boardFileVO.setNum(boardVO.getNum());
					
					result = qnaDAO.setBoardFileAdd(boardFileVO);
				}
			}
		}
		return result;
	}
	
	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		return 0;
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		return 0;
	}

	@Override
	public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception {
		return qnaDAO.getFileDetail(boardFileVO);
	}
}
