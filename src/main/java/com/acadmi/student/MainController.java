package com.acadmi.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.board.BoardVO;

@Controller
public class MainController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/")
	public ModelAndView getNoticeList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVO> ar =  studentService.getNoticeList();
		
		mv.addObject("list", ar);
		mv.setViewName("index");
		
		return mv;
		
	}

}
