package com.acadmi.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.board.BoardVO;
import com.acadmi.util.FileVO;
import com.acadmi.util.Pagination;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping(value = "list")
	public ModelAndView getList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVO> ar = qnaService.getList(pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping(value = "detail")
	public ModelAndView getDetail(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = (QnaVO)qnaService.getDetail(qnaVO);
		
		mv.addObject("boardVO", qnaVO);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@GetMapping(value = "add")
	public ModelAndView setInsert(@ModelAttribute BoardVO boardVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		
		return mv;
	}
	
	@PostMapping(value = "add")
	public ModelAndView setInsert(QnaVO qnaVO, MultipartFile [] boardFiles) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setInsert(qnaVO, boardFiles);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping(value = "fileDown")
	public ModelAndView getFileDown(FileVO fileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		fileVO = qnaService.getFileDetail(fileVO);
		
		mv.addObject("boardFileVO", fileVO);
		mv.setViewName("fileManager");
		
		return mv;
	}
}
