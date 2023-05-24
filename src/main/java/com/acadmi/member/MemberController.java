package com.acadmi.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.member.MemberVO;

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
	public ModelAndView getLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		return mv;
	}
	
//	@PostMapping("login")
//	public ModelAndView getLogin(MemberVO memberVO, HttpSession session) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		memberVO = memberService.getLogin(memberVO);
//		
//		mv.setViewName("redirect:./login");
//		if(memberVO != null) {
//			session.setAttribute("member", memberVO);
//			mv.setViewName("redirect:../");
//		}
//	
//		return mv;
//	}
	
	@GetMapping("logout")
	public ModelAndView getLogout(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		session.invalidate();
		
		mv.setViewName("redirect:../");
		
		return mv;
	}

}
