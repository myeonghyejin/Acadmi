package com.acadmi.student;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.lecture.StudentLectureVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student/*")
@Slf4j
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("myLectureList")
	public ModelAndView getMyLectureList(LectureVO lectureVO, HttpSession session) throws Exception {
		log.error("studentVO :: {}", lectureVO.getUsername());
		ModelAndView mv = new ModelAndView();
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		
		lectureVO.setUsername(authentication.getName()); 
		LectureVO minYear = studentService.getMaxYear(lectureVO);
		LectureVO maxYear = studentService.getMinYear(lectureVO);
		
		log.error("username ::: {}", authentication.getName());
		
		List<LectureVO> ar =  studentService.getMyLectureList(lectureVO);
		
		
		mv.addObject("list", ar);
		mv.addObject("minYear", minYear);
		mv.addObject("maxYear",maxYear );
		mv.setViewName("student/myLectureList");
		return mv;
		
	}
	
	
	
}
