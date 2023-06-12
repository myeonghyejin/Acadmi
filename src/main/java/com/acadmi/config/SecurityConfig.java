package com.acadmi.config;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.acadmi.member.MemberService;
import com.acadmi.security.UserLoginFailHandler;
import com.acadmi.security.UserSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	 @Bean
	   WebSecurityCustomizer webSecurityConfig() {
	      return web -> web
	            .ignoring()
	            .antMatchers("/images/**")
	            .antMatchers("/css/**")
	            .antMatchers("/js/**")
	            .antMatchers("/favicon/**")
	            ;
	   }
	   
	   @Bean
	   SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
	      httpSecurity
	               .cors()
	               .and()
	               .csrf()
	               .disable()
	               
	               .authorizeRequests()
	                  // URL과 권한 매칭
	                  .antMatchers("/member/login").permitAll()
//	                  .antMatchers("/member/studentPage?username=${username}").authenticated()
	                  .antMatchers("/member/join").permitAll()
	                  .antMatchers("/").hasAnyRole("ADMIN", "ADMINISTRATOR", "PROFESSOR", "STUDENT")
	                  .antMatchers("/notice/add").hasRole("ADMINISTRATOR")
	                  .antMatchers("/notice/update").hasRole("ADMINISTRATOR")
	                  .antMatchers("/notice/delete").hasRole("ADMINISTRATOR")
	                  .antMatchers("/lectureNotice/add").hasRole("PROFESSOR")
	                  .antMatchers("/lectureNotice/update").hasRole("PROFESSOR")
	                  .antMatchers("/lectureNotice/delete").hasRole("PROFESSOR")
	                  .antMatchers("/qna/add").hasAnyRole("PROFESSOR", "STUDENT")
	                  .antMatchers("/qna/update").hasAnyRole("PROFESSOR", "STUDENT")
	                  .antMatchers("/qna/delete").hasAnyRole("PROFESSOR", "STUDENT")
	                  .antMatchers("/lectureQna/add").hasRole("STUDENT")
	                  .antMatchers("/lectureQna/update").hasRole("STUDENT")
	                  .antMatchers("/lectureQna/delete").hasRole("STUDENT")
	                  .and()
	               .formLogin()
	                  .loginPage("/member/login")
	                  .defaultSuccessUrl("/")
	                  .failureHandler(new UserLoginFailHandler())
	                  .permitAll()
	                  .and()
	               .logout()
	                  .logoutUrl("/member/logout")
	                  .logoutSuccessUrl("/member/login")
	                  .invalidateHttpSession(true)
	                  .deleteCookies("JSESSIONID")
	                  .permitAll()
	                  .and();
	               
	         return httpSecurity.build();
	      }
	      
	   @Bean
	   public PasswordEncoder getPasswordEncoder() {
	      return new BCryptPasswordEncoder();
	   }
   
//	 @Bean
//	   WebSecurityCustomizer webSecurityConfig() {
//	      return web -> web
//	            .ignoring()
//	            .antMatchers("/images/**")
//	            .antMatchers("/css/**")
//	            .antMatchers("/js/**")
//	            .antMatchers("/favicon/**");
//	   }
//	   
//	   @Bean
//	   SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
//	      httpSecurity
//	         .cors()
//	         .and()
//	         .csrf()
//	         .disable()
//	         
//	         .authorizeRequests()
//		         .antMatchers("/member/login").permitAll()
//		         .antMatchers("/member/firstEmail").permitAll()
//		         .antMatchers("/member/firstEmailCheck").permitAll()
//		         .antMatchers("/member/findPw").permitAll()
////		         .antMatchers("/member/administratorPage").hasRole("ADMINISTRATOR")
////		         .antMatchers("/member/administratorUpdate").hasRole("ADMINISTRATOR")
////		         .antMatchers("/member/professorPage").hasRole("PROFESSOR")
////		         .antMatchers("/member/professorUpdate").hasRole("PROFESSOR")
////		         .antMatchers("/member/studentPage").hasRole("STUDENT")
////		         .antMatchers("/member/studentUpdate").hasRole("STUDENT")
////	             .antMatchers("/").hasAnyRole("ADMIN", "ADMINISTRATOR", "PROFESSOR", "STUDENT")
////	             .antMatchers("/notice/add").hasRole("ADMINISTRATOR")
////	             .antMatchers("/notice/update").hasRole("ADMINISTRATOR")
////	             .antMatchers("/notice/delete").hasRole("ADMINISTRATOR")
////	             .antMatchers("/lectureNotice/add").hasRole("PROFESSOR")
////	             .antMatchers("/lectureNotice/update").hasRole("PROFESSOR")
////	             .antMatchers("/lectureNotice/delete").hasRole("PROFESSOR")
////	             .antMatchers("/qna/add").hasAnyRole("PROFESSOR", "STUDENT")
////	             .antMatchers("/qna/update").hasAnyRole("PROFESSOR", "STUDENT")
////	             .antMatchers("/qna/delete").hasAnyRole("PROFESSOR", "STUDENT")
////	             .antMatchers("/lectureQna/add").hasRole("STUDENT")
////	             .antMatchers("/lectureQna/update").hasRole("STUDENT")
////	             .antMatchers("/lectureQna/delete").hasRole("STUDENT")
//	             .and()
//	         .formLogin()
//		         .loginPage("/member/login")
//		         .defaultSuccessUrl("/")
//		         .failureHandler(new UserLoginFailHandler())
//		         .permitAll()
//		         .and()
//	         .logout()
//		         .logoutUrl("/member/logout")
//		         .logoutSuccessUrl("/member/login")
//		         .invalidateHttpSession(true)
//		         .deleteCookies("JSESSIONID")
//		         .permitAll()
//		         .and();
////	         .exceptionHandling() // 예외 처리 설정 시작
////	         	.accessDeniedPage("/WEB-INF/views/errorPage.jsp")
////	         .and();
//	      	
//	      return httpSecurity.build();
//	   }
//
//	   @Bean
//	   public PasswordEncoder getPasswordEncoder() {
//	      return new BCryptPasswordEncoder();
//	   }
	
}
