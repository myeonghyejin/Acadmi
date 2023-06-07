package com.acadmi.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("list")
	public ModelAndView getChatRoomList(Pagination pagination, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ChatRoomVO> ar = chatService.getChatRoomList(pagination, session);
		mv.addObject("list", ar);
		mv.setViewName("chat/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getChatRoomDetail(ChatRoomVO chatRoomVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		chatRoomVO = chatService.getChatRoom(chatRoomVO);
		mv.addObject("chatRoom", chatRoomVO);
		mv.setViewName("chat/detail");
		return mv;
	}
	
	

}
