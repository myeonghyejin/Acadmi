package com.acadmi.lecture;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.notification.NotificationService;
import com.acadmi.period.PeriodVO;
import com.acadmi.student.StudentVO;
import com.acadmi.syllabus.ClassVO;
import com.acadmi.syllabus.SyllabusVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lecture/")
public class LectureController {
	@Autowired
	private LectureService lectureService;
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping("list")
	public ModelAndView getLectureList(LectureVO lectureVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		/* 이렇게 세션에서 받아와야함.
		 * Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		 * SecurityContextImpl contextImpl = (SecurityContextImpl) obj; Authentication
		 * authentication = contextImpl.getAuthentication();
		 */
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl) obj; 
		Authentication authentication = contextImpl.getAuthentication();
		lectureVO.setUsername(authentication.getName());
		
		List<LectureVO> ar = lectureService.getLectureList(lectureVO);
		mv.addObject("list",ar);
		mv.setViewName("lecture/list");
		return mv;
	}
	
	
	@GetMapping("add")
	public ModelAndView setLectureAdd(@ModelAttribute LectureVO lectureVO,CollegeVO collegeVO, DepartmentVO departmentVO, PeriodVO periodVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		log.error("getMapping");
		List<DepartmentVO> department = lectureService.getDepartmentList(departmentVO);
		List<CollegeVO> college = lectureService.getCollegeList(collegeVO);
		List<PeriodVO> period = lectureService.getSemesterList(periodVO);
		mv.addObject("period",period);
		mv.addObject("college", college);
		mv.addObject("department",department);
		mv.setViewName("lecture/add");
		return mv;
	}
	@PostMapping("add")
	public ModelAndView setLectureAdd(LectureVO lectureVO, ModelAndView mv, @RequestParam("buttonType")String buttonType,HttpSession session) throws Exception{
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl) obj; 
		Authentication authentication = contextImpl.getAuthentication();
		lectureVO.setUsername(authentication.getName());
		if(buttonType.equals("1")) {
			int result = lectureService.setLectureAdd(lectureVO);
			result = notificationService.setLecture(lectureVO);
		} else if(buttonType.equals("0")){
			int result = lectureService.setTemporaryAdd(lectureVO);
		}
		log.error(lectureVO.getLectureNum().toString());
		
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setLectureUpdate(LectureVO lectureVO,CollegeVO collegeVO, DepartmentVO departmentVO, PeriodVO periodVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> department = lectureService.getDepartmentList(departmentVO);
		List<CollegeVO> college = lectureService.getCollegeList(collegeVO);
		List<PeriodVO> period = lectureService.getSemesterList(periodVO);
		mv.addObject("period",period);
		mv.addObject("college", college);
		mv.addObject("department",department);
		lectureVO = lectureService.getLectureDetail(lectureVO);
		mv.addObject("update",lectureVO);
		mv.setViewName("lecture/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView setLectureUpdate(LectureVO lectureVO, ModelAndView mv, @RequestParam("buttonType")String buttonType) throws Exception{
		if(buttonType.equals("1")) {
			int result = lectureService.setLectureUpdate(lectureVO);
		} else if(buttonType.equals("0")){
			int result = lectureService.setTemporaryUpdate(lectureVO);
		}
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setLectureDelete(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = lectureService.setLectureDelete(lectureVO);
		String message = "";
		if(result>0) {
			message = "게시물이 삭제되었습니다";
		}else {
			message = "삭제실패";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	@GetMapping("main")
	public ModelAndView getLectureMain(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getLectureProfessor(lectureVO);
		mv.addObject("lecture",lectureVO);
		List<ClassVO> ar = lectureService.getSyllabusClass(lectureVO);
		mv.addObject("classes",ar);
		int exists = lectureService.getSyllabusExists(lectureVO);
		mv.addObject("exists",exists);
		mv.setViewName("temp/sidebar/professor_lecture");
		mv.setViewName("lecture/main");
		return mv;
	}
	
	@GetMapping("info")
	public ModelAndView getLectureInfo(LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getLectureDetail(lectureVO);
		mv.addObject("lecture",lectureVO);
		int exists = lectureService.getSyllabusExists(lectureVO);
		mv.addObject("exists",exists);
		mv.setViewName("temp/sidebar/professor_lecture");
		mv.setViewName("lecture/info");
		return mv;
	}
	
	@GetMapping("attendee")
	public ModelAndView getLectureAttendee(LectureVO lectureVO, StudentVO studentVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StudentVO> ar = lectureService.getLectureAttendee(lectureVO);
		mv.addObject("list",ar);
		lectureVO = lectureService.getLectureDetail(lectureVO);
		mv.addObject("lecture",lectureVO);
		int exists = lectureService.getSyllabusExists(lectureVO);
		mv.addObject("exists",exists);
		mv.setViewName("temp/sidebar/professor_lecture");
		mv.setViewName("lecture/attendee");
		return mv;
	}
	
	@GetMapping("syllabusAdd")
	public ModelAndView setSyllabusAdd(@ModelAttribute LectureVO lectureVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getLectureDetail(lectureVO);
		mv.addObject("lecture",lectureVO);
		int exists = lectureService.getSyllabusExists(lectureVO);
		mv.addObject("exists",exists);
		mv.setViewName("temp/sidebar/professor_lecture");
		mv.setViewName("lecture/syllabusAdd");
		return mv;
	}
	@PostMapping("syllabusAdd")
	public ModelAndView setSyllabusAdd(LectureVO lectureVO, ModelAndView mv, SyllabusVO syllabusVO,ClassVO classVO,@RequestParam Map<String, String> formData) throws Exception{
		int result = lectureService.setSyllabusAdd(syllabusVO);
		classVO.setSyllabusNum(syllabusVO.getSyllabusNum());
		for(int i=1;i<9;i++) {
			ClassVO newClassVO = new ClassVO();
			newClassVO.setSyllabusNum(classVO.getSyllabusNum());
	        newClassVO.setOrder(i);
	        newClassVO.setSubject(formData.get("subject" + i));
	        newClassVO.setGoal(formData.get("goal" + i));
	        newClassVO.setCapability(formData.get("capability" + i));
	        newClassVO.setNote(formData.get("note" + i));
	        log.error(newClassVO.getSubject());
	        result = lectureService.setClassAdd(newClassVO);
		}
		lectureVO = lectureService.getLectureDetail(lectureVO);
		
		mv.addObject("result","등록성공");
		mv.addObject("url","./syllabusDetail?lectureName="+lectureVO.getLectureName());
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("syllabusDetail")
	public ModelAndView setSyllabusDetail(@ModelAttribute LectureVO lectureVO, ClassVO classVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getSyllabusDetail(lectureVO);
		mv.addObject("lecture", lectureVO);
		List<ClassVO> ar = lectureService.getSyllabusClass(lectureVO);
		mv.addObject("classes",ar);
		int exists = lectureService.getSyllabusExists(lectureVO);
		mv.addObject("exists",exists);
		mv.setViewName("temp/sidebar/professor_lecture");
		mv.setViewName("lecture/syllabusDetail");
		return mv;
	}
	@GetMapping("syllabusUpdate")
	public ModelAndView setSyllabusUpdate(LectureVO lectureVO,SyllabusVO syllabusVO,ClassVO classVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureVO = lectureService.getSyllabusDetail(lectureVO);
		mv.addObject("lecture", lectureVO);
		List<ClassVO> ar = lectureService.getSyllabusClass(lectureVO);
		mv.addObject("classes",ar);
		mv.setViewName("temp/sidebar/professor_lecture");
		mv.setViewName("lecture/syllabusUpdate");
		return mv;
	}
	@PostMapping("syllabusUpdate")
	public ModelAndView setSyllabusUpdate(LectureVO lectureVO,SyllabusVO syllabusVO,ClassVO classVO,ModelAndView mv,@RequestParam Map<String, String> formData) throws Exception{
		int result = lectureService.setSyllabusUpdate(syllabusVO);
		log.error(formData.get("subject2"));
		lectureVO = lectureService.getLectureDetail(lectureVO);
		for(int i=1;i<9;i++) {
			ClassVO newClassVO = new ClassVO();
			newClassVO.setSyllabusNum(syllabusVO.getSyllabusNum());
	        newClassVO.setOrder(i);
	        newClassVO.setSubject(formData.get("subject" + i));
	        newClassVO.setGoal(formData.get("goal" + i));
	        newClassVO.setCapability(formData.get("capability" + i));
	        newClassVO.setNote(formData.get("note" + i));
	       

	        result = lectureService.setClassUpdate(newClassVO);
		}
		mv.addObject("result","수정성공");
		String str = lectureVO.getLectureName();
		mv.addObject("url","./syllabusDetail?lectureName="+str);
		mv.setViewName("common/result");
		return mv;
	}
	
	

}