package com.acadmi.student.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.lecture.LectureVO;
import com.acadmi.util.Pagination;

@Controller
@RequestMapping("/student/lecture/*")
public class StudentLectureController {
	
	@Autowired
	private StudentLectureService studentLectureService;
	
	/** SELECT **/
	//수강 신청 & 장바구니 조회
	@GetMapping("all_lecture")
	public ModelAndView getAllLectureList(Pagination pagination, ModelAndView mv) throws Exception {
		List<LectureVO> ar = studentLectureService.getAllLectureList(pagination);
			
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/all_lecture");
			
		return mv;
	}
	
	//내 수강 신청 조회
	@GetMapping("my_lecture")
	public ModelAndView getMyLectureList(Pagination pagination, ModelAndView mv) throws Exception {
		List<StudentLectureVO> ar = studentLectureService.getMyLectureList(pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_lecture");
		
		return mv;
	}
	
	//내 장바구니 조회
	@GetMapping("my_favorite")
	public ModelAndView getMyFavoriteList(Pagination pagination, ModelAndView mv) throws Exception {
		List<FavoriteLectureVO> ar = studentLectureService.getMyFavoriteList(pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("student/lecture/my_favorite");
		
		return mv;
	}

}
