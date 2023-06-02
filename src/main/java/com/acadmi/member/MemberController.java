package com.acadmi.member;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.administrator.AdministratorService;
import com.acadmi.administrator.AdministratorVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentService;
import com.acadmi.student.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

//	Member
	
	@Autowired
	private MemberService memberService;
	
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
	   
	   
//	   ========================================멤버 권한에 따른 마이페이지========================================
	   
	   @GetMapping("studentPage")
	   public ModelAndView getStudent(StudentVO studentVO, MultipartFile multipartFile) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      DepartmentVO departmentVO =  memberService.getStudent(studentVO, multipartFile);
	     
	      mv.addObject("departmentVO", departmentVO);
		  mv.setViewName("member/studentPage");
		     
		  return mv;
	   }
	   
	   @GetMapping("professorPage")
	   public ModelAndView getProfessor(ProfessorVO professorVO, MultipartFile multipartFile) throws Exception {
		   ModelAndView mv = new ModelAndView();
		     
		   DepartmentVO departmentVO =  memberService.getProfessor(professorVO, multipartFile);
		   
		   mv.addObject("departmentVO", departmentVO);
		   mv.setViewName("member/professorPage");
	      
	      return mv;
	   }
	   
	   @GetMapping("administratorPage")
	   public ModelAndView getAdministrator(AdministratorVO administratorVO, MultipartFile multipartFile) throws Exception {
		   ModelAndView mv = new ModelAndView();
		     
		   DepartmentVO departmentVO =  memberService.getAdministrator(administratorVO, multipartFile);
		   
		   mv.addObject("departmentVO", departmentVO);
		   mv.setViewName("member/administratorPage");
	      
	      return mv;
	   }
	   
	   
//	   ==================================studentUpdate==================================
	   
	   
	   @GetMapping("studentUpdate")
	   public ModelAndView getStudentUpdate(StudentVO studentVO, MultipartFile multipartFile) throws Exception {
	       ModelAndView mv = new ModelAndView();

	       DepartmentVO departmentVO = memberService.getStudent(studentVO, multipartFile);

	       mv.addObject("departmentVO", departmentVO);
	       mv.setViewName("member/studentUpdate");

	       return mv;
	   }

	   @PostMapping("studentUpdate")
	   public ModelAndView postStudentUpdate(StudentVO studentVO, ModelAndView mv, MultipartFile multipartFile) throws Exception {
	       
	       // 회원 정보를 업데이트한 후, 다시 학생 정보를 조회하여 DepartmentVO에 담아 반환합니다.
	       int result = memberService.setStudentUpdate(studentVO, multipartFile);

	     
	       mv.setViewName("redirect:/");

	       return mv;
	   }


	   
//	   ==================================professorUpdate==================================
	   
	   @GetMapping("professorUpdate")
	   public ModelAndView setProfessorUpdate(ProfessorVO professorVO, MultipartFile multipartFile) throws Exception {
		   ModelAndView mv = new ModelAndView();
		     
		   DepartmentVO departmentVO =  memberService.getProfessor(professorVO, multipartFile);
		   
		   mv.addObject("departmentVO", departmentVO);
		   mv.setViewName("member/professorUpdate");
	      
	      return mv;
	   }
	   
	   @PostMapping("professorUpdate")
	   public ModelAndView setProfessorUpdate(ProfessorVO professorVO, ModelAndView mv, MultipartFile multipartFile) throws Exception {
		     
		   MemberVO memberVO =  memberService.setProfessorUpdate(professorVO, multipartFile);
		   
		   mv.addObject("memberVO", memberVO);
		   mv.setViewName("redirect:/");
	      
	      return mv;
	   }
	   
	   
//	   ==================================administratorUpdate==================================
	   
	   
	   @GetMapping("administratorUpdate")
	   public ModelAndView setAdministratorUpdate(AdministratorVO administratorVO, MultipartFile multipartFile) throws Exception {
		   ModelAndView mv = new ModelAndView();
		     
		   DepartmentVO departmentVO =  memberService.getAdministrator(administratorVO, multipartFile);
		   
		   mv.addObject("departmentVO", departmentVO);
		   mv.setViewName("member/administratorUpdate");
	      
	      return mv;
	   }
	   
	   @PostMapping("administratorUpdate")
	   public ModelAndView setAdministratorUpdate(AdministratorVO administratorVO, ModelAndView mv, MultipartFile multipartFile) throws Exception {
		     
		   MemberVO memberVO =  memberService.setAdministratorUpdate(administratorVO, multipartFile);
		   
		   mv.addObject("memberVO", memberVO);
		   mv.setViewName("redirect:/");
	      
	      return mv;
	   }
	   
}
