package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.member.MemberVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/administrator/*")
@Slf4j
public class AdminIstratorController {
	
	@Autowired
	private AdminIstratorService adminIstratorService;

	@GetMapping("studentList")
	public ModelAndView getMemberList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AdminIstratorVO> ar =  adminIstratorService.getStudentList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/studentList");
		
		return mv;
	}
	
	@GetMapping("professorList")
	public ModelAndView getProfessorList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AdminIstratorVO> ar = adminIstratorService.getProfessorList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/professorList");
		
		return mv;
	}
	
	@GetMapping("adminIstratorList")
	public ModelAndView getAdminIstratorList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AdminIstratorVO> ar = adminIstratorService.getAdminIstratorList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/adminIstratorList");
		
		return mv;
		
		
	}
	
	

}
