package com.acadmi.board.notice;

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
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;

	@Value("${app.upload.notice}")
	private String path;
	
	@Override
	public List<BoardVO> getList(Pagination pagination) throws Exception {
		
		pagination.makeStartRow();
		
		pagination.makeNum(noticeDAO.getTotalCount(pagination));
		
		return noticeDAO.getList(pagination);
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		return noticeDAO.getDetail(boardVO);
	}

	@Override
	public int setInsert(BoardVO boardVO, MultipartFile [] multipartFiles) throws Exception {
		int result = noticeDAO.setInsert(boardVO);
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					FileVO fileVO = new FileVO();
					fileVO.setFileName(fileName);
					fileVO.setOriName(multipartFile.getOriginalFilename());
					fileVO.setNum(boardVO.getNum());
					
					result = noticeDAO.setBoardFileAdd(fileVO);
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
		return noticeDAO.setDelete(boardVO);
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		return noticeDAO.getFileDetail(fileVO);
	}
}
