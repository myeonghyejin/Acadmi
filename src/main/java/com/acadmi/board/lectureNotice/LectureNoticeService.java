package com.acadmi.board.lectureNotice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.acadmi.board.BoardService;
import com.acadmi.board.BoardVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.util.FileManager;
import com.acadmi.util.FileVO;
import com.acadmi.util.Pagination;

@Service
@Transactional(rollbackFor = Exception.class)
public class LectureNoticeService implements BoardService {

	@Autowired
	private LectureNoticeDAO lectureNoticeDAO;
	
	@Autowired
	private FileManager fileManager;

	@Value("${app.upload.lectureNotice}")
	private String path;
	
	@Override
	public List<BoardVO> getList(Pagination pagination) throws Exception {
		
		pagination.makeStartRow();
		
		pagination.makeNum(lectureNoticeDAO.getTotalCount(pagination));
		
		return lectureNoticeDAO.getList(pagination);
	}
	
	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		return lectureNoticeDAO.getDetail(boardVO);
	}

	@Override
	public int setInsert(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception {
		int result = lectureNoticeDAO.setInsert(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					FileVO fileVO = new FileVO();
					fileVO.setNum(boardVO.getNum());
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					
					result = lectureNoticeDAO.setBoardFileAdd(fileVO);
				}
			}
		}
		return result;
	}

	@Override
	public int setUpdate(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception {
		
		int result = lectureNoticeDAO.setUpdate(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					FileVO fileVO = new FileVO();
					fileVO.setNum(boardVO.getNum());
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					
					result = lectureNoticeDAO.setBoardFileAdd(fileVO);
				}
			}
		}
		return result;		
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		return lectureNoticeDAO.setDelete(boardVO);
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		return lectureNoticeDAO.getFileDetail(fileVO);
	}

	@Override
	public int setBoardFileDelete(FileVO fileVO) throws Exception {
		return lectureNoticeDAO.setBoardFileDelete(fileVO);
	}
	
	public int setLectureNoticeHit(LectureNoticeVO lectureNoticeVO) throws Exception {
		return lectureNoticeDAO.setLectureNoticeHit(lectureNoticeVO);
	}
	
	public List<ProfessorVO> getProfessor() throws Exception {
		return lectureNoticeDAO.getProfessor();
	}
}
