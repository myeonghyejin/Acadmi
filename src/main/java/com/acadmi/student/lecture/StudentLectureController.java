package com.acadmi.student.lecture;

import java.time.LocalDate;
import java.time.Period;
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

import com.acadmi.department.DepartmentVO;
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
	
	//현재 연도 계산
	private int calculateCurrentYear() {
		LocalDate currentDate = LocalDate.now();
		int year = currentDate.getYear();
		return year;
	}
	
	//현재 학기 계산
	private int calculateCurrentSemester() {
		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();
		int semester;
		
		//1학기인지 2학기인지 판단
	    if (month >= 2 && month <= 7) {
	        semester = 1; //2월부터 7월까지는 1학기
	    } else {
	    	semester = 2; //8월부터 1월까지는 2학기
	    }
	    return semester;
	}
	
	/** SELECT **/
	//수강 신청 & 장바구니 조회
	@GetMapping("all_lecture")
	public ModelAndView getAllLectureList(Pagination pagination, StudentLectureVO studentLectureVO, HttpSession session, ModelAndView mv) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		pagination.setUsername(authentication.getName());
		studentLectureVO.setUsername(authentication.getName());

		PeriodVO periodVO =  studentService.getFavoirte();
				
			if(periodVO == null || periodVO.toString().isEmpty()) {
				String message = "장바구니 기간이 아닙니다";
				
				mv.addObject("result", message);
				mv.setViewName("common/result");
				
				mv.addObject("url", "/");
				
				return mv;
			}
		
		List<LectureVO> ar = studentLectureService.getAllLectureList(pagination);
		List<DepartmentVO> ar2 = studentLectureService.getDepartment();
	    Long totalCredit = studentLectureService.getSumCredit(studentLectureVO);
	    
	    mv.addObject("credit", totalCredit);
		mv.addObject("list", ar);
		mv.addObject("department", ar2);
		mv.addObject("year", calculateCurrentYear());
		mv.addObject("semester", calculateCurrentSemester());
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
	public ModelAndView getTimetableList(StudentLectureVO studentLectureVO, HttpSession session, ModelAndView mv) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		studentLectureVO.setUsername(authentication.getName());
		
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO);
		
		String[] arr = {"월","화", "수", "목", "금"};
		
		mv.addObject("list", ar);
		mv.addObject("day", arr);
		mv.addObject("year", calculateCurrentYear());
		mv.addObject("semester", calculateCurrentSemester());
		mv.setViewName("student/lecture/timetable");
		
		return mv;
	}
	
	/** INSERT **/
	//수강 신청
	@PostMapping("my_lecture/insert")
	public ModelAndView insertToStudentLecture(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
	    Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
	    SecurityContextImpl contextImpl = (SecurityContextImpl) obj;
	    Authentication authentication = contextImpl.getAuthentication();
	    studentLectureVO.setUsername(authentication.getName());
	    
	    //이미 신청한 강의와 요일/시간이 겹치는지 확인
	    List<LectureVO> duplicateLectures = studentLectureService.getDuplicateTime(studentLectureVO, lectureVO);
	    
	    if (duplicateLectures != null && !duplicateLectures.isEmpty()) {
	        mv.addObject("result", 2);
	        mv.setViewName("common/ajaxResult");
	        return mv;
	    }
	    
	    //총 학점이 20점을 넘어가는지 확인
	    Long totalCredit = studentLectureService.getCalculateCredit(studentLectureVO);
	    int addedCredit = (lectureVO != null) ? lectureVO.getCompletionGrade() : 0;
	    if (totalCredit != null && totalCredit + addedCredit > 20) {
	        mv.addObject("result", 3);
	        mv.setViewName("common/ajaxResult");
	        return mv;
	    }
	    
	    //수강 신청 성공
	    int result = studentLectureService.insertToStudentLecture(studentLectureVO, lectureVO, session);
	    
	    if(result == 1) {
	    	studentLectureService.addToSubscription(lectureVO);;
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
			result = studentLectureService.insertToFavoriteLecture(favoriteLectureVO, lectureVO, session);
			if(result == 1) {
				studentLectureService.addToFavorite(lectureVO);
			}
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
			result = studentLectureService.deleteToStudentLecture(studentLectureVO, lectureVO, session);
			if(result == 1) {
				studentLectureService.deleteToSubscription(lectureVO);
			}
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
		
		FavoriteLectureVO getMyFavorite = studentLectureService.getMyFavorite(favoriteLectureVO);
		
		if(getMyFavorite != null) {
			result = studentLectureService.deleteToFavoriteLecture(favoriteLectureVO, lectureVO, session);
			log.info("{}", result);
			if(result == 1) {
				studentLectureService.deleteToFavorite(getMyFavorite.getLectureVO());
			}
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
			
		return mv;
	}

}
