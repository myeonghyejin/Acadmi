package com.acadmi.credit;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.StudentVO;
import com.acadmi.syllabus.ClassVO;
import com.acadmi.syllabus.SyllabusVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/credit/")
public class CreditController {
	@Autowired
	private CreditService creditService;
	
	@GetMapping("list")
	public ModelAndView getLectureList(LectureVO lectureVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		/* 이렇게 세션에서 받아와야함.
		 * Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		 * SecurityContextImpl contextImpl = (SecurityContextImpl) obj; Authentication
		 * authentication = contextImpl.getAuthentication();
		 */
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl) obj; 
		Authentication authentication = contextImpl.getAuthentication();
		lectureVO.setUsername(authentication.getName());
		
		List<LectureVO> ar = creditService.getLectureList(lectureVO);
		mv.addObject("list",ar);
		mv.setViewName("credit/list");
		return mv;
	}
	@GetMapping("attendee")
	public ModelAndView getLectureAttendee(LectureVO lectureVO, StudentVO studentVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StudentVO> ar = creditService.getLectureAttendee(lectureVO);
		mv.addObject("attendee",ar);
		lectureVO = creditService.getLectureDetail(lectureVO);
		mv.addObject("detail",lectureVO);
		mv.setViewName("credit/attendee");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView getLectureAttendee(LectureVO lectureVO, StudentVO studentVO, CreditVO creditVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StudentVO> ar = creditService.getLectureAttendee(lectureVO);
		mv.addObject("attendee",ar);
		lectureVO = creditService.getLectureDetail(lectureVO);
		mv.addObject("detail",lectureVO);
		mv.setViewName("credit/add");
		return mv;
	}
	

}