package com.acadmi.security;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberDAO;
import com.acadmi.professor.ProfessorVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class UserSuccessHandler implements AuthenticationSuccessHandler{
	
	@Autowired
	private MemberDAO memberDAO;

	
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
			 log.error("===ID : {}", authentication.getName());
			 Collection<? extends GrantedAuthority> auths =  authentication.getAuthorities();
			 Map<String, String> map = new HashMap<>();
			 try {
			 for(GrantedAuthority grantedAuthority : auths) {
				 if(grantedAuthority.getAuthority().equals("ROLE_PROFESSOR")) {
					 map.put("role", "ROLE_PROFESSOR");
					
					 
				 }else if(grantedAuthority.getAuthority().equals("ROLE_ADMINISTRATOR")) {
					 map.put("role", "ROLE_ADMINISTRATOR");
					 
				 
				 }else  {
				 map.put("role", "ROLE_STUDENT");
				 
			 }
				 
			 }
			 
			 map.put("username", authentication.getName());
			 
			 String name= memberDAO.getName(map);
			 request.getSession().setAttribute("name", name);
			 }catch (Exception e) {
					e.printStackTrace();
				}
			
			response.sendRedirect("/");
			 
			
		
//			log.error("===========Login 성공 후 실행===========");
//			
//			String remember = request.getParameter("remember");
//			
//			log.error("=========={}==========", remember);
//			
//			if(remember != null && remember.equals("remember")) {
//				Cookie cookie = new Cookie("remember",authentication.getName());
//				cookie.setMaxAge(60*60*24);
//				response.addCookie(cookie);
//				
//			}
//			else {
//				Cookie [] cookies = request.getCookies();
//				for(Cookie cookie : cookies) {
//					if(cookie.getName().equals("remember")) {
//						cookie.setMaxAge(0);
//						response.addCookie(cookie);
//						break;
//					}
//				}
//			}
	
	}
}
