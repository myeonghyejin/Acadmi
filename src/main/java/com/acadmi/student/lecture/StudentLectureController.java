package com.acadmi.student.lecture;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.lecture.LectureVO;
import com.acadmi.member.MemberVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student/lecture/*")
@Slf4j
public class StudentLectureController {
	
	@Autowired
	private StudentLectureService studentLectureService;
	
	/** SELECT **/
	//수강 신청 & 장바구니 조회
	@GetMapping("all_lecture")
	public ModelAndView getAllLectureList(Pagination pagination, ModelAndView mv) throws Exception {
		List<LectureVO> ar = studentLectureService.getAllLectureList(pagination);
		
		log.error("ar : {}", ar.isEmpty());
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/all_lecture");
			
		return mv;
	}
	
	//내 수강 신청 조회
	@GetMapping("my_lecture")
	public ModelAndView getMyLectureList(StudentLectureVO studentLectureVO, HttpSession session, ModelAndView mv) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		studentLectureVO.setUsername(memberVO.getUsername());
		
//		log.error("member : {}", studentLectureVO.getUsername());
		
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO, session);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_lecture");
		
		return mv;
	}
	
	//내 장바구니 조회
	@GetMapping("my_favorite")
	public ModelAndView getMyFavoriteList(FavoriteLectureVO favoriteLectureVO, HttpSession session, ModelAndView mv) throws Exception {
		List<FavoriteLectureVO> ar = studentLectureService.getMyFavoriteList(favoriteLectureVO, session);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_favorite");
		
		return mv;
	}
	
	//시간표 조회
	@GetMapping("timetable")
	public ModelAndView getTimetableList(StudentLectureVO studentLectureVO, HttpSession session, ModelAndView mv) throws Exception {
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO, session);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/timetable");
		
		return mv;
	}

}
