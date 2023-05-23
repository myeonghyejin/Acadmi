package com.acadmi.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.board.BoardService;
import com.acadmi.board.BoardVO;
import com.acadmi.util.Pagination;

@Service
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<BoardVO> getList(Pagination pagination) throws Exception {
		
		pagination.makeStartRow();
		
		pagination.makeNum(noticeDAO.getTotalCount(pagination));
		
		return noticeDAO.getList(pagination);
	}
}
