package com.acadmi.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.acadmi.department.DepartmentVO;

import lombok.extern.slf4j.Slf4j;

public class UserSuccessHandler implements AuthenticationSuccessHandler{

	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
		
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
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        
        // 필요한 정보를 세션에 저장합니다.
        HttpSession session = request.getSession();
        session.setAttribute("username", userDetails.getUsername());
        session.setAttribute("name", userDetails.getAuthorities());
        // 추가적인 필드들을 세션에 저장할 수 있습니다.
        
        // 인증 성공 후에 이동할 페이지로 리다이렉트합니다.
        response.sendRedirect("/");
	}
}
