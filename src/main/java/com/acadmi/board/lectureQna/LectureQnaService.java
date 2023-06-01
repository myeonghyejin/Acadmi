package com.acadmi.board.lectureQna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.acadmi.board.BoardService;
import com.acadmi.board.BoardVO;

import com.acadmi.board.qna.QnaVO;
import com.acadmi.util.FileManager;
import com.acadmi.util.FileVO;
import com.acadmi.util.Pagination;

@Service
public class LectureQnaService implements BoardService {

	@Autowired
	private LectureQnaDAO lectureQnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.lectureQna}")
	private String path;
	
	@Override
	public List<BoardVO> getList(Pagination pagination) throws Exception {
		
		pagination.makeStartRow();
		
		pagination.makeNum(lectureQnaDAO.getTotalCount(pagination));
		
		return lectureQnaDAO.getList(pagination);
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		return lectureQnaDAO.getDetail(boardVO);
	}
	
	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] multipartFiles) throws Exception {
		int result = lectureQnaDAO.setInsert(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					FileVO fileVO = new FileVO();
					fileVO.setNum(boardVO.getNum());
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					
					result = lectureQnaDAO.setBoardFileAdd(fileVO);
				}
			}
		}
		return result;
	}
	
	@Override
	public int setUpdate(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception {
		
		int result = lectureQnaDAO.setUpdate(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					FileVO fileVO = new FileVO();
					fileVO.setNum(boardVO.getNum());
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					
					result = lectureQnaDAO.setBoardFileAdd(fileVO);
				}
			}
		}
		return result;		
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		return lectureQnaDAO.setDelete(boardVO);
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		return lectureQnaDAO.getFileDetail(fileVO);
	}

	@Override
	public int setBoardFileDelete(FileVO fileVO) throws Exception {
		return lectureQnaDAO.setBoardFileDelete(fileVO);
	}
	
	public int setReplyAdd(LectureQnaVO lectureQnaVO) throws Exception {
		
		LectureQnaVO parent = (LectureQnaVO)lectureQnaDAO.getDetail(lectureQnaVO);
		
		lectureQnaVO.setRef(parent.getRef());
				
		lectureQnaVO.setStep(parent.getStep() + 1);
				
		lectureQnaVO.setDepth(parent.getDepth() + 1);
				
		int result = lectureQnaDAO.setStepUpdate(parent);
				
		result = lectureQnaDAO.setReplyAdd(lectureQnaVO);
			
		return result; 
		
	}
	
	public LectureQnaVO getReplyDetail(LectureQnaVO lectureQnaVO) throws Exception {
		return (LectureQnaVO) lectureQnaDAO.getReplyDetail(lectureQnaVO);
	}
	                      
	public Long getQnaList(LectureQnaVO lectureQnaVO) throws Exception {	
		return lectureQnaDAO.getQnaList(lectureQnaVO);
	}
	
}
