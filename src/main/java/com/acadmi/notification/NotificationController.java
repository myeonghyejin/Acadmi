package com.acadmi.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notification/*")
@Slf4j
public class NotificationController {
	
	@Autowired
	private NotificationService notificationService;
	
	//notification list
	@GetMapping("list")
	public ModelAndView getList() throws Exception {
		ModelAndView mv = new ModelAndView();
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationKind(1);
		List<NotificationVO> ar = notificationService.getKindList(notificationVO);
		log.info("========== size : {}",ar.size());
		
		mv.addObject("list", ar);
		mv.setViewName("notification/list");
		return mv;
	}
	
	

}
