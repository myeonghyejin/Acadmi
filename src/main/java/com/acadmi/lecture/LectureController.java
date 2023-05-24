package com.acadmi.lecture;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	@GetMapping("temporary")
	public ModelAndView getTemporaryList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<LectureVO> ar = lectureService.getTemporaryList();
		mv.addObject("temporary",ar);
		mv.setViewName("lecture/temporary");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setLectureAdd(@ModelAttribute LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		log.error("getMapping");
		mv.setViewName("lecture/add");
		return mv;
	}
	@PostMapping("add")
	public ModelAndView setLectureAdd(LectureVO lectureVO, ModelAndView mv) throws Exception{
		log.error("postMapping-before");
		int result = lectureService.setLectureAdd(lectureVO);
		log.error("postMapping-after");
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setLectureUpdate(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("update",lectureVO);
		mv.setViewName("lecture/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView setLectureUpdate(LectureVO lectureVO, ModelAndView mv) throws Exception{
		int result = lectureService.setLectureUpdate(lectureVO);
		mv.setViewName("lecture/list");
		return mv;
	}

}
