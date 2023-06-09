package com.acadmi.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.acadmi.interceptor.EmailCheckInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
//		registry.addInterceptor(emailCheckInterceptor)
//				.addPathPatterns("member/firstEmail")
//				;
		
	}
	
}
