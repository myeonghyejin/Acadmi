package com.acadmi.student.lecture;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView getAllLectureList(ModelAndView mv) throws Exception {
		mv.setViewName("student/lecture/all_lecture");
			
		return mv;
	}
	
	//ajax 수강 신청 & 장바구니 조회
	@GetMapping("all_lecture/list")
	public ModelAndView getAllLectureList(Pagination pagination, ModelAndView mv) throws Exception {
		List<LectureVO> ar = studentLectureService.getAllLectureList(pagination);
		
//		log.error("ar : {}", ar.isEmpty());
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/ajax/all_lecture_list");
			
		return mv;
	}
	
	//내 수강 신청 조회
	@GetMapping("my_lecture")
	public ModelAndView getMyLectureList(StudentLectureVO studentLectureVO, HttpSession session, Pagination pagination, ModelAndView mv) throws Exception {
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		
//		studentLectureVO.setUsername(memberVO.getUsername());
//		
//		studentLectureVO.setUsername("student");
		
//		log.error("member : {}", studentLectureVO.getUsername());
		
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO, session, pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_lecture");
		
		return mv;
	}
	
	//내 장바구니 조회
	@GetMapping("my_favorite")
	public ModelAndView getMyFavoriteList(FavoriteLectureVO favoriteLectureVO, HttpSession session, Pagination pagination, ModelAndView mv) throws Exception {
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		
//		favoriteLectureVO.setUsername(memberVO.getUsername());
		
		List<FavoriteLectureVO> ar = studentLectureService.getMyFavoriteList(favoriteLectureVO, session, pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_favorite");
		
		return mv;
	}
	
	//시간표 조회
	@GetMapping("timetable")
	public ModelAndView getTimetableList(StudentLectureVO studentLectureVO, HttpSession session, Pagination pagination, ModelAndView mv) throws Exception {
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(studentLectureVO, session, pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/timetable");
		
		return mv;
	}
	
	/** INSERT **/
	//수강 신청
	@PostMapping("my_lecture/insert")
	public ModelAndView setStudentLectureInsert(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		
//		studentLectureVO.setUsername(memberVO.getUsername());
		
		if(studentLectureService.getMyLecture(studentLectureVO) == null) {
			studentLectureService.setSubscriptionAddUpdate(lectureVO);
			result = studentLectureService.setStudentLectureInsert(studentLectureVO, lectureVO, session);
			FavoriteLectureVO favoriteLectureVO = new FavoriteLectureVO();
			result = studentLectureService.setFavoriteLectureDelete(favoriteLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	//장바구니 담기
	@PostMapping("my_favorite/insert")
	public ModelAndView setFavoriteLectureInsert(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		
//		favoriteLectureVO.setUsername(memberVO.getUsername());
		
		if(studentLectureService.getMyFavorite(favoriteLectureVO) == null) {
			result = studentLectureService.setFavoriteLectureInsert(favoriteLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
			
		return mv;
	}
	
	/** DELETE **/
	//수강 취소
	@PostMapping("my_lecture/delete")
	public ModelAndView setStudentLectureDelete(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		
//		studentLectureVO.setUsername(memberVO.getUsername());
		
		if(studentLectureService.getMyLecture(studentLectureVO) != null) {
			studentLectureService.setSubscriptionDeleteUpdate(lectureVO);
			result = studentLectureService.setStudentLectureDelete(studentLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	//장바구니 빼기
	@PostMapping("my_favorite/delete")
	public ModelAndView setFavoriteLectureDelete(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session, ModelAndView mv) throws Exception {
		int result = 0;
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		
//		favoriteLectureVO.setUsername(memberVO.getUsername());
		
		if(studentLectureService.getMyFavorite(favoriteLectureVO) != null) {
			log.error("hi");
			result = studentLectureService.setFavoriteLectureDelete(favoriteLectureVO, lectureVO, session);
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
			
		return mv;
	}

}
