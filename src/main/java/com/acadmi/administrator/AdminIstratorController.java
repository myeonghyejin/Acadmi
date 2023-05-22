package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/administrator/*")
@Slf4j
public class AdminIstratorController {
	
	@Autowired
	private AdminIstratorService adminIstratorService;

	@GetMapping("list")
	public ModelAndView getMemberList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AdminIstratorVO> ar =  adminIstratorService.getMemberList();
		mv.addObject("list", ar);
		mv.setViewName("administrator/list");
		
		return mv;
	}
}
