package com.acadmi.lecture;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
@CrossOrigin(origins="localhost")
@Slf4j
@Controller
@RequestMapping("/lecture/")
public class LectureController {
	@Autowired
	private LectureService lectureService;
	
	@GetMapping("list")
	public ModelAndView getLectureList(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<LectureVO> ar = lectureService.getLectureList(lectureVO);
		mv.addObject("list",ar);
		mv.setViewName("lecture/list");
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
	public ModelAndView setLectureAdd(LectureVO lectureVO, ModelAndView mv, @RequestParam("buttonType")String buttonType) throws Exception{
		if(buttonType.equals("1")) {
			int result = lectureService.setLectureAdd(lectureVO);
		} else if(buttonType.equals("0")){
			int result = lectureService.setTemporaryAdd(lectureVO);
		}
		log.error(lectureVO.getLectureNum().toString());
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setLectureUpdate(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getLectureDetail(lectureVO);
		mv.addObject("update",lectureVO);
		mv.setViewName("lecture/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView setLectureUpdate(LectureVO lectureVO, ModelAndView mv, @RequestParam("buttonType")String buttonType) throws Exception{
		if(buttonType.equals("1")) {
			int result = lectureService.setLectureUpdate(lectureVO);
		} else if(buttonType.equals("0")){
			int result = lectureService.setTemporaryUpdate(lectureVO);
		}
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setLectureDelete(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = lectureService.setLectureDelete(lectureVO);
		String message = "삭제 실패";
		if(result>0) {
			message = "게시물이 삭제되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/lecture");
		return mv;
	}
	
	
	@GetMapping("main")
	public ModelAndView getLectureMain(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getLectureMain(lectureVO);
		mv.addObject("main",lectureVO);
		mv.setViewName("lecture/main");
		return mv;
	}
	
	@GetMapping("info")
	public ModelAndView getLectureInfo(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getLectureDetail(lectureVO);
		mv.addObject("info",lectureVO);
		mv.setViewName("lecture/info");
		return mv;
	}

}
