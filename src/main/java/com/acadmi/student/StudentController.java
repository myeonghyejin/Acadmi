package com.acadmi.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.board.BoardVO;
import com.acadmi.board.notice.NoticeService;
import com.acadmi.board.notice.NoticeVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.student.lecture.StudentLectureVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student/*")
@Slf4j
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	

	//내 수강 리스트
	@GetMapping("myLectureList")
	public ModelAndView getMyLectureList(HttpSession session, LectureVO lectureVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		
		lectureVO.setUsername(authentication.getName()); 
	
		
		log.error("username ::: {}", authentication.getName());
		
		List<LectureVO> ar =  studentService.getMyLectureList(lectureVO);
		
		mv.addObject("list", ar);
		
		mv.addObject("map", studentService.getYear(lectureVO));
		mv.addObject("obj", lectureVO);
		
		mv.setViewName("student/myLectureList");
		return mv;
		
	}
	
	
	//내 성적 조회
	@GetMapping("myCreditList")
	public ModelAndView getMyCreditList(HttpSession session, LectureVO lectureVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		
		lectureVO.setUsername(authentication.getName());
		
		List<LectureVO> ar = studentService.getMyCreditList(lectureVO);
		
		mv.addObject("list", ar);
		mv.addObject("map", studentService.getYear(lectureVO));
		mv.setViewName("student/myCreditList");
		
		return mv;
	}
	
	
	

	
}
