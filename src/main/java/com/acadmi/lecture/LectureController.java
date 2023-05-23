package com.acadmi.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lecture/")
public class LectureController {
	@Autowired
	private LectureService lectureService;
	
	@GetMapping("list")
	public ModelAndView getLectureList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<LectureVO> ar = lectureService.getLectureList();
		mv.addObject("list",ar);
		mv.setViewName("lecture/list");
		return mv;
	}

}
