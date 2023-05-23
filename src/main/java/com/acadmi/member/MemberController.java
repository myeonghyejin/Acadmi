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
	
	@PostMapping("login")
	public ModelAndView getLogin(MemberVO memberVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO = memberService.getLogin(memberVO);
		
		mv.setViewName("redirect:./login");
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			mv.setViewName("redirect:../");
		}
	
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView getLogout(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		session.invalidate();
		
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	@GetMapping(value = "mypage")
	   public ModelAndView getMemberPage(HttpSession session) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      MemberVO memberVO = (MemberVO)session.getAttribute("member");
	      
	      memberVO = memberService.getMyPage(memberVO);
	      
	      mv.addObject("memberVO", memberVO);
	      mv.setViewName("member/mypage");
	      
	      return mv;
	   }
	
	@GetMapping(value = "info")
	   public void info(HttpSession session) {
	      String pw = "qwer1234";
	      MemberVO memberVO = (MemberVO) memberService.loadUserByUsername("wkdgustj02");
	      
	      log.error("============== {} ============", memberVO.getPassword());
	      log.error("============== {} ============", passwordEncoder.encode(pw));
	      log.error("============== {} ============", memberVO.getPassword().equals(passwordEncoder.encode(pw)));
	      
	      // encode 된 패스워드는 passwordEncoder의 matches로 DB에 암호화된 패스워드와 비교
	      boolean check = passwordEncoder.matches(pw, memberVO.getPassword());
	      log.error("============== {} ============", check);
	      
	      log.error("================== Login Info =================");
//	      Enumeration<String> names = session.getAttributeNames();
//	      while(names.hasMoreElements()) {
//	         log.error("======== {} =======", names.nextElement());
//	      }
	      Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
	      SecurityContextImpl contextImpl = (SecurityContextImpl) obj;
	      Authentication authentication = contextImpl.getAuthentication();
	      
	      log.error("======== {} =======", obj);
	      log.error("======== NAME : {} =======", authentication.getName());
	      log.error("======== DETAIL : {} =======", authentication.getDetails());
	      log.error("======== PRINCIPAL : {} =======", authentication.getPrincipal());
	   }

	
}
