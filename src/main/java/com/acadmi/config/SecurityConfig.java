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
                  .antMatchers("/member/join").permitAll()
//                  .antMatchers("/test").authenticated()
//                  	.antMatchers("/").permitAll()
                  .antMatchers("/").hasAnyRole("ADMIN", "ADMINISTRATOR", "PROFESSOR", "STUDENT")
//                  .anyRequest().permitAll()
                  .and()
               .formLogin()
                  .loginPage("/member/login")
                  .defaultSuccessUrl("/")
//                  .successHandler(new UserSuccessHandler())
                  .failureHandler(new UserLoginFailHandler())
                  .permitAll()
                  .and()
               .logout()
                  .logoutUrl("/member/logout")
                  .logoutSuccessUrl("/member/login")
//                .addLogoutHandler(userLogoutHandler)
                  .invalidateHttpSession(true)
                  .deleteCookies("JSESSIONID")
                  .permitAll()
                  .and();
//               .sessionManagement()
//                  .maximumSessions(1) // 최대 허용 가능한 session의 수, -1 : 무제한
//                  .maxSessionsPreventsLogin(false) // false : 이전 사용자 session을 만료, true : 새로운 사용자 인증 실패
//                  ;
               
         return httpSecurity.build();
      }
      
   @Bean
   public PasswordEncoder getPasswordEncoder() {
      return new BCryptPasswordEncoder();
   }
}
