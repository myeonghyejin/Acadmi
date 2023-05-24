package com.acadmi.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.acadmi.board.BoardService;
import com.acadmi.board.BoardVO;
import com.acadmi.util.FileManager;
import com.acadmi.util.FileVO;
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
					FileVO fileVO = new FileVO();
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					fileVO.setNum(boardVO.getNum());
					
					result = qnaDAO.setBoardFileAdd(fileVO);
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
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		return qnaDAO.getFileDetail(fileVO);
	}
}
