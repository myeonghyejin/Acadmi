package com.acadmi.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.administrator.AdministratorVO;
import com.acadmi.board.BoardVO;
import com.acadmi.notification.NotificationService;
import com.acadmi.notification.NotificationVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.FileVO;
import com.acadmi.util.Pagination;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private NotificationService notificationService;
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "qna";
	}
	
	@GetMapping(value = "list")
	public ModelAndView getList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVO> ar = qnaService.getList(pagination);
		
		List<StudentVO> students = qnaService.getStudent();
		
		List<ProfessorVO> professors = qnaService.getProfessor();
		
		List<AdministratorVO> administrators = qnaService.getAdministrator();
		
		mv.addObject("students", students);
		mv.addObject("professors", professors);
		mv.addObject("administrators", administrators);
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping(value = "detail")
	public ModelAndView getDetail(QnaVO qnaVO, NotificationVO notificationVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Long num = qnaService.getQnaList(qnaVO);
		
		qnaVO = (QnaVO)qnaService.getDetail(qnaVO);
		
		if(notificationVO.getNotificationNum() != null) {
			int result = notificationService.setDelete(notificationVO);
		}
		
		session.setAttribute("qnaVO", qnaVO);
		
		mv.addObject("num", num);
		mv.addObject("boardVO", qnaVO);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@GetMapping(value = "replyDetail")
	public ModelAndView getReplyDetail(QnaVO qnaVO, NotificationVO notificationVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = qnaService.getReplyDetail(qnaVO);
		
		if(notificationVO.getNotificationNum() != null) {
			int result = notificationService.setDelete(notificationVO);
		}
		
		mv.addObject("reply", qnaVO);
		mv.setViewName("board/replyDetail");
		
		return mv;
	}
	
	@GetMapping(value = "add")
	public ModelAndView setInsert(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		
		return mv;
	}
	
	@PostMapping(value = "add")
	public ModelAndView setInsert(QnaVO qnaVO, MultipartFile [] addfiles) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setInsert(qnaVO, addfiles);
		
		result = notificationService.setQna(qnaVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping(value = "fileDown")
	public ModelAndView getFileDown(FileVO fileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		fileVO = qnaService.getFileDetail(fileVO);
		
		mv.addObject("fileVO", fileVO);
		mv.setViewName("fileManager");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		qnaVO = (QnaVO)qnaService.getDetail(qnaVO);
		
		mv.addObject("dto", qnaVO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ModelAndView mv, QnaVO qnaVO, MultipartFile [] addfiles) throws Exception {
		
		int result = qnaService.setUpdate(qnaVO, addfiles);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(BoardVO boardVO, NotificationVO notificationVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setDelete(boardVO);
		
		result = notificationService.setBoardNotificationDelete(notificationVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@PostMapping("boardFileDelete")
	public ModelAndView setBoardFileDelete(FileVO fileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setBoardFileDelete(fileVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping(value = "reply")
	public ModelAndView setReplyAdd(ModelAndView mv ,QnaVO qnaVO) throws Exception {
		
		mv.setViewName("board/replyAdd");
		
		return mv;
	}
	
	@PostMapping(value = "reply")
	public ModelAndView setReplyAdd(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setReplyAdd(qnaVO);
		
		result = notificationService.setQnaReply(qnaVO);
		                             
		mv.setViewName("redirect:./detail?num=" + qnaVO.getNum());
		
		return mv;
	}
	
	
}
