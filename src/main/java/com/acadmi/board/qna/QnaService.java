package com.acadmi.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.acadmi.board.BoardService;
import com.acadmi.board.BoardVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
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
					fileVO.setNum(boardVO.getNum());
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					
					result = qnaDAO.setBoardFileAdd(fileVO);
				}
			}
		}
		return result;
	}
	
	@Override
	public int setUpdate(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception {
		
		int result = qnaDAO.setUpdate(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					FileVO fileVO = new FileVO();
					fileVO.setNum(boardVO.getNum());
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					
					result = qnaDAO.setBoardFileAdd(fileVO);
				}
			}
		}
		return result;		
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		return qnaDAO.setDelete(boardVO);
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		return qnaDAO.getFileDetail(fileVO);
	}

	@Override
	public int setBoardFileDelete(FileVO fileVO) throws Exception {
		return qnaDAO.setBoardFileDelete(fileVO);
	}
	
	public int setReplyAdd(QnaVO qnaVO) throws Exception {
		
		QnaVO parent = (QnaVO)qnaDAO.getDetail(qnaVO);
		
		qnaVO.setRef(parent.getRef());
				
		qnaVO.setStep(parent.getStep() + 1);
				
		qnaVO.setDepth(parent.getDepth() + 1);
				
		int result = qnaDAO.setStepUpdate(parent);
				
		result = qnaDAO.setReplyAdd(qnaVO);
			
		return result; 
		
	}
	
	public QnaVO getReplyDetail(QnaVO qnaVO) throws Exception {
		return qnaDAO.getReplyDetail(qnaVO);
	}
	
	public Long getQnaList(QnaVO qnaVO) throws Exception {	
		return qnaDAO.getQnaList(qnaVO);
	}
	
	public List<StudentVO> getStudent() throws Exception {
		return qnaDAO.getStudent();
	}
	
	public List<ProfessorVO> getProfessor() throws Exception {
		return qnaDAO.getProfessor();
	}
}
