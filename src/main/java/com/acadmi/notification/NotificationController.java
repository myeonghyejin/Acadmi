package com.acadmi.notification;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.board.qna.QnaVO;
import com.acadmi.lecture.LectureVO;

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
		List<NotificationVO> ar = notificationService.getKindList(notificationVO, session);
		List<LectureVO> lectureList = notificationService.getLectureList();
		mv.addObject("lecture", lectureList);
		mv.addObject("list", ar);
		mv.setViewName("notification/list");
		return mv;
	}
	
	@GetMapping("notificationList")
	@ResponseBody
	public int getNotificationList(HttpSession session) throws Exception {
		NotificationVO notificationVO = new NotificationVO();
		List<NotificationVO> ar = notificationService.getnotificationist(notificationVO, session);
		int result = ar.size();
		return result;
	}
	
	@GetMapping("notificationKind")
	@ResponseBody
	public int getNotificationKind(NotificationVO notificationVO, HttpSession session) throws Exception {
		List<NotificationVO> ar = notificationService.getnotificationKindList(notificationVO, session);
		int result = ar.size();
		return result;
	}
	
	@GetMapping("notificationStatus")
	@ResponseBody
	public String setNotifacationSave(NotificationVO notificationVO) throws Exception {
		int result = notificationService.setNotificationStatus(notificationVO);
		String msg = "실패하였습니다.";
		if(notificationVO.getNotificationStatus()==2) {		
			if(result>0) {
				msg = "보관에 성공하였습니다.";
			}
		} else {
			if(result>0) {
				msg = "취소에 성공하였습니다.";
				log.info("{}",msg);
			}
		}
		return msg;
	}
	
//	@GetMapping("test")
//	public void getTest() throws Exception {
//		notificationService.setMemberSeqUpdate();
//	}
	
	

}
