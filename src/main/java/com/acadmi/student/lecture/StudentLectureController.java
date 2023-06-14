package com.acadmi.student.lecture;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.lecture.LectureVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.student.StudentService;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student/lecture/*")
@Slf4j
public class StudentLectureController {
	
	@Autowired
	private StudentLectureService studentLectureService;
	
	@Autowired
	private StudentService studentService;
	
	/** SELECT **/
	//수강 신청 & 장바구니 조회
	@GetMapping("all_lecture")
	public ModelAndView getAllLectureList(Pagination pagination, HttpSession session, ModelAndView mv) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		pagination.setUsername(authentication.getName());
		
		PeriodVO periodVO =  studentService.getFavoirte();
		PeriodVO periodVO2 = studentService.getApplication();
				
			if(periodVO == null || periodVO.toString().isEmpty()) {
				String message = "장바구니 기간이 아닙니다";
				
				mv.addObject("result", message);
				mv.setViewName("common/result");
				
				mv.addObject("url", "/");
				
				return mv;
			}
				
		List<LectureVO> ar = studentLectureService.getAllLectureList(pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/all_lecture");

		return mv;
	}
	
	//내 수강 신청 조회
	@GetMapping("my_lecture")
	public ModelAndView getMyLectureList(StudentLectureVO studentLectureVO, HttpSession session, ModelAndView mv) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		studentLectureVO.setUsername(authentication.getName());
		
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_lecture");
		
		return mv;
	}
	
	//내 장바구니 조회
	@GetMapping("my_favorite")
	public ModelAndView getMyFavoriteList(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		favoriteLectureVO.setUsername(authentication.getName());
		
		List<FavoriteLectureVO> ar = studentLectureService.getMyFavoriteList(favoriteLectureVO);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_favorite");
		
		return mv;
	}
	
	//시간표 조회
	@GetMapping("timetable")
	public ModelAndView getTimetableList(StudentLectureVO studentLectureVO, HttpSession session, Pagination pagination, ModelAndView mv) throws Exception {
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/timetable");
		
		return mv;
	}
	
	/** INSERT **/
	//수강 신청
	@PostMapping("my_lecture/insert")
	public ModelAndView insertToStudentLecture(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		studentLectureVO.setUsername(authentication.getName());
		
		if(studentLectureService.getMyLecture(studentLectureVO) == null) {
			studentLectureService.addToSubscription(lectureVO);
			result = studentLectureService.insertToStudentLecture(studentLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	//장바구니 담기
	@PostMapping("my_favorite/insert")
	public ModelAndView insertToFavoriteLecture(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		favoriteLectureVO.setUsername(authentication.getName());
		
		if(studentLectureService.getMyFavorite(favoriteLectureVO) == null) {
			studentLectureService.addToFavorite(lectureVO);
			result = studentLectureService.insertToFavoriteLecture(favoriteLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
			
		return mv;
	}
	
	/** DELETE **/
	//수강 취소
	@PostMapping("my_lecture/delete")
	public ModelAndView deleteToStudentLecture(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		studentLectureVO.setUsername(authentication.getName());
		
		if(studentLectureService.getMyLecture(studentLectureVO) != null) {
			studentLectureService.deleteToSubscription(lectureVO);
			result = studentLectureService.deleteToStudentLecture(studentLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	//장바구니 빼기
	@PostMapping("my_favorite/delete")
	public ModelAndView deleteToFavoriteLecture(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		favoriteLectureVO.setUsername(authentication.getName());
		
		if(studentLectureService.getMyFavorite(favoriteLectureVO) != null) {
			studentLectureService.deleteToFavorite(lectureVO);
			result = studentLectureService.deleteToFavoriteLecture(favoriteLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
			
		return mv;
	}

}
