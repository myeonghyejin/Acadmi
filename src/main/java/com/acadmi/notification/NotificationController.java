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
	
	@GetMapping("list")
	public ModelAndView getList(NotificationVO notificationVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		notificationVO.setNotificationKind(1);
		log.debug("==========check==============");
		List<NotificationVO> ar = notificationService.getList(notificationVO);
		
		mv.addObject("list", ar);
		mv.setViewName("notification/list");
		return mv;
	}

}
