package com.acadmi.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.board.BoardVO;
import com.acadmi.lecture.LectureVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
 public class MainController {
  
	  @Autowired 
	  private StudentService studentService;
	  
	  @GetMapping("/") 
	  public ModelAndView getNoticeList() throws Exception {
		  ModelAndView mv = new ModelAndView();
	  
//		  List<BoardVO> ar = studentService.getNoticeList();
//		  List<LectureVO> ar2 = studentService.getCurrentLectureList();
//		  log.error("current ::: {}", ar2.get(0).getLectureName());
//		  
//		  mv.addObject("notice", ar); 
//		  mv.addObject("currentLecture", ar2);
		  
		  
		  mv.setViewName("index");
		  
		  
		  return mv;
	  
	  }
  
  }
 
