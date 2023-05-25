package com.acadmi.notification;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.qna.QnaVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notification/*")
@Slf4j
public class NotificationController {
	
	@Autowired
	private NotificationService notificationService;
	
	//notification list
	@GetMapping("list")
	public ModelAndView getList(NotificationVO notificationVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//알림전체보기를 눌렀을때 기본적으로 notificationkind가 1로 들어가게 jsp에서 설정
		List<NotificationVO> ar = notificationService.getKindList(notificationVO, session);
		log.info("========== size : {}",ar.size());
		
		mv.addObject("list", ar);
		mv.setViewName("notification/list");
		return mv;
	}
	
	@GetMapping("test")
	public ModelAndView getTest() throws Exception {
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = new QnaVO();
		notificationService.setQna(qnaVO);
		return mv;
	}
	
	

}
