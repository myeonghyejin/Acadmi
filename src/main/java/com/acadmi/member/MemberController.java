package com.acadmi.member;

import java.util.Enumeration;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("login")
	public ModelAndView getLogin(HttpSession session) throws Exception{
		 ModelAndView mv = new ModelAndView();
	     
		 MemberVO memberVO = new MemberVO();
		 
	     Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
	      
	     if(object == null) {
	        mv.setViewName("member/login");
	     } 
	     else {
	        mv.setViewName("redirect:/");
	     } 

	     return mv;
	}
	
//	@PostMapping(value = "login")
//	   public ModelAndView getLogin(MemberVO memberVO, HttpSession session)throws Exception{
//	      ModelAndView mv = new ModelAndView();
//	      
//	      memberVO = memberService.getLogin(memberVO);
//	      mv.setViewName("redirect:./login");
//	      
//	      if(memberVO != null) {
//	         session.setAttribute("member", memberVO);
//	         mv.setViewName("redirect:../");
//	      }
//	      
//	      return mv;
//	   }
	
	@GetMapping("info")
	public void info(HttpSession session) {
//		String pw="yang1234";
//		
//		MemberVO memberVO=(MemberVO)memberService.loadUserByUsername("12345");
//		
//		log.error("{} ::::: ", memberVO.getPassword());
//		log.error("{} ::::: ", passwordEncoder.encode(pw));
//		log.error("{} :::::", memberVO.getPassword().equals(passwordEncoder.encode(pw)));
//		
//		boolean check = passwordEncoder.matches(pw, memberVO.getPassword());
//		log.error("{} :::: ", check);
//		
//		
//		log.error("======== Login Info ===========");
		//SPRING_SECURITY_CONTEXT
//		Enumeration<String> names = session.getAttributeNames();
//		while(names.hasMoreElements()) {
//			log.error("==== {} === ", names.nextElement());
//		}
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT"); 
		log.error("========== {} =========", obj);
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication= contextImpl.getAuthentication();
		
		log.error("{}======", authentication.getAuthorities());
		
		log.error("====== {} ======", obj);
		log.error("====== USERNAME :  {} ======", authentication.getName());
		log.error("====== Detail :  {} ======", authentication.getDetails());
		log.error("====== MemberVO :  {} ======", authentication.getPrincipal());
	}
	
	@GetMapping("mypage")
	   public ModelAndView getMemberPage(HttpSession session) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      MemberVO memberVO = (MemberVO)session.getAttribute("member");
	      
	      memberVO = memberService.getMyPage(memberVO);
	      
	      mv.addObject("memberVO", memberVO);
	      mv.setViewName("member/mypage");
	      
	      return mv;
	   }
	

	   @GetMapping("join")
	   public ModelAndView setMemberAdd(@ModelAttribute MemberVO memberVO) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      mv.setViewName("member/join");
	      
	      return mv;
	   }
	   
	   @PostMapping("join")
	   public ModelAndView setMemberAdd(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
//	      boolean check = memberService.passwordCheck(memberVO, bindingResult);
//	      
//	      if(check) {
//	         mv.setViewName("member/join");
//	         return mv;
//	      }
	      
	      int result = memberService.setJoin(memberVO);
	      
	      mv.setViewName("redirect:./login");
	      
	      return mv;
	   }
	   
	   @GetMapping("findPw")
		public ModelAndView getFindPw(MemberVO memberVO) throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/findPw");
			return mv;
		}
	   
	   @PostMapping("findPw")
		public ModelAndView getFindPw(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception{
			ModelAndView mv = new ModelAndView();
			boolean check = memberService.getFindPw(memberVO, bindingResult);
			if(check) {
				mv.setViewName("member/findPw");
				return mv;
			}
			mv.setViewName("member/login");
			return mv;
		}
	 
}
