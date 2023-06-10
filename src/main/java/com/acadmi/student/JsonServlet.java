package com.acadmi.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;



import lombok.extern.slf4j.Slf4j;
	
@WebServlet (name = "jsonServlet", urlPatterns = "/lectureListJson")
@Slf4j
public class JsonServlet extends HttpServlet {

	
	//1. 클라이언트에서 파라미터 값을 받는다
	//2. 파라미터 값을 가지고 db로 조회
	//3. 조회된 값을 json애 저장
	//4. 이 json을 @WebServlet을 통해 클라이언트에 보내준다
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter printWriter = resp.getWriter();
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
	
	
}
