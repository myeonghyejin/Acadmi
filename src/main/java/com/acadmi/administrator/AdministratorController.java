package com.acadmi.administrator;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;import org.springframework.boot.context.properties.ConfigurationPropertiesBinding;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.lecture.room.LectureRoomVO;
import com.acadmi.lecture.room.TimeTableVO;
import com.acadmi.member.MemberSeqVO;
import com.acadmi.member.MemberVO;
import com.acadmi.notification.NotificationService;
import com.acadmi.notification.NotificationVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/administrator/*")
@Slf4j
public class AdministratorController {
	
	@Autowired
	private AdministratorService administratorService;
	
	@Autowired
	private NotificationService notificationService;

	//회원 관리
	//아이디
	
	//계정 관리
	@GetMapping("studentAdd")
	public ModelAndView setStudentAdd(MemberSeqVO memberSeqVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<CollegeVO>ar = administratorService.getCollege();
		List<DepartmentVO> ar2 = administratorService.getDepartment();
		
		
		mv.addObject("college", ar);
		mv.addObject("department", ar2);
		mv.setViewName("administrator/studentAdd");
		
		return mv;
		
	}
	@PostMapping("studentAdd")
	public ModelAndView setStudentAdd(@Valid StudentVO studentVO, BindingResult bindingResult, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
//			List<FieldError> e= bindingResult.getFieldErrors();
//			for(FieldError fieldError:e) {
//				log.error("Error : {}", fieldError);
//			}
		
			if(bindingResult.hasErrors()) {
				log.warn("검중에 실패");
				mv.setViewName("administrator/studentAdd");
				return mv;
			}
			
			int result = administratorService.setStudentAdd(studentVO,memberVO, memberSeqVO);
			
			String message="등록 실패";
			
			if(result > 0) {
				message = "등록 되었습니다";
				
			}
			
			mv.addObject("result", message);
			mv.setViewName("common/result");
			
			mv.addObject("url", "./studentList");
			return mv;
		
	}
	@GetMapping("administratorAdd")
	public ModelAndView setAdministratorAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<CollegeVO>ar = administratorService.getCollege();
		List<DepartmentVO> ar2 = administratorService.getDepartment();
		
		
		mv.addObject("college", ar);
		mv.addObject("department", ar2);
		
		mv.setViewName("administrator/administratorAdd");
		
		return mv;
		
	}
	
	@PostMapping("administratorAdd")
	public ModelAndView setAdministratorAdd(@Valid AdministratorVO administratorVO, BindingResult bindingResult, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setAdministratorAdd(administratorVO, memberVO, memberSeqVO);
		
		if(bindingResult.hasErrors()) {
			log.warn("검중에 실패");
			mv.setViewName("administrator/administratorAdd");
			return mv;
		}
		
		String message="등록 실패";
		
		if(result > 0) {
			message = "등록 되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./administratorList");
		return mv;
		
		
	}
	
	@GetMapping("professorAdd")
	public ModelAndView setProfessorAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<CollegeVO>ar = administratorService.getCollege();
		List<DepartmentVO> ar2 = administratorService.getDepartment();
		
		
		mv.addObject("college", ar);
		mv.addObject("department", ar2);
		
		mv.setViewName("administrator/professorAdd");
		
		return mv;
		
	}
	
	@PostMapping("professorAdd")
	public ModelAndView setProfessorAdd(@Valid ProfessorVO professorVO, BindingResult bindingResult, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setProfessorAdd(professorVO, memberVO, memberSeqVO);
		
//		if(bindingResult.hasErrors()) {
//			log.warn("검중에 실패");
//			mv.setViewName("administrator/professorAdd");
//			return mv;
//		}
		
		String message="등록 실패";
		
		if(result > 0) {
			message = "등록 되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./professorList");
		return mv;
		
		
	}
	
	//회원 조회
	@GetMapping("studentList")
	public ModelAndView getMemberList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<StudentVO> ar =  administratorService.getStudentList(pagination);
		List<CollegeVO> ar2 =  administratorService.getCollege();
		List<DepartmentVO> ar3 =  administratorService.getDepartment();
		mv.addObject("list", ar);
		mv.addObject("college", ar2);
		mv.addObject("department", ar3);
		mv.setViewName("administrator/studentList");
		
		return mv;
	}
	
	@GetMapping("professorList")
	public ModelAndView getProfessorList( Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<ProfessorVO> ar = administratorService.getProfessorList(pagination);
		List<CollegeVO> ar2 =  administratorService.getCollege();
		List<DepartmentVO> ar3 =  administratorService.getDepartment();
		mv.addObject("list", ar);
		mv.addObject("college", ar2);
		mv.addObject("department", ar3);
		mv.setViewName("administrator/professorList");
		
		return mv;
	}
	
	@GetMapping("administratorList")
	public ModelAndView getAdministratorList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AdministratorVO> ar = administratorService.getAdministratorList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/administratorList");
		
		return mv;
		
	}
	
	//강의실 관리
	
	//강의실 조회
	@GetMapping("lectureRoomList")
	public ModelAndView getLectureRoomList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<LectureRoomVO> ar = administratorService.getLectureRoomList(pagination);
		List<LectureRoomVO> ar2 =  administratorService.getLectureBuilding();
		mv.addObject("list", ar);
		mv.addObject("list2", ar2);
		mv.setViewName("administrator/lectureRoomList");
		
		return mv;
	}
	@PostMapping("lectureRoomList")
	public ModelAndView setLectureRoomUpdate(LectureRoomVO lectureRoomVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result =  administratorService.setLectureRoomUpdate(lectureRoomVO);
		
		
		return mv;
	}
	
	//강의실 등록
	@GetMapping("lectureRoomAdd")
	public ModelAndView getLectureRoomAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<LectureRoomVO> ar = administratorService.getLectureBuilding();
		mv.addObject("lectureRoom", ar);
		mv.setViewName("administrator/lectureRoomAdd");
		
		return mv;
	}
	
	@PostMapping("lectureRoomAdd")
	public ModelAndView setLectureRoomAdd(@Valid LectureRoomVO lectureRoomVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setLectureRoomAdd(lectureRoomVO);
		
		
		if(bindingResult.hasErrors()) {
			log.warn("검증에 실패");
			mv.setViewName("administrator/lectureRoomAdd");
			return mv;
			
		}
		
		String message="등록 실패";
		
		
		if(result > 0) {
			message = "등록 되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./lectureRoomList");
		return mv;
	}
	
	//강의실 중복 체크
	@GetMapping("lectureRoomDuplicateCheck")
	@ResponseBody
	public boolean LectureRoomDuplicateCheck(LectureRoomVO lectureRoomVO) throws Exception {
		boolean check = true;
		lectureRoomVO = administratorService.LectureRoomDuplicateCheck(lectureRoomVO);
		
		if(lectureRoomVO !=null) {
			check = false;
		}
		
		return check;
	}
	
	//학과 관리
	
	//학과 조회
	@GetMapping("departmentList")
	public ModelAndView  getDepartmentList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<DepartmentVO> ar = administratorService.getDepartmentList(pagination);
		List<CollegeVO> ar2 =  administratorService.getCollege();
		
		mv.addObject("list", ar);
		mv.addObject("college", ar2);
		mv.setViewName("administrator/departmentList");
		
		return mv;
	}
	
	@PostMapping("departmentList")
	public ModelAndView setDepartmentUpdate(@Valid DepartmentVO departmentVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result =  administratorService.setDepartmentUpdate(departmentVO);
		
		return mv;
	}
	
	//학과 등록
	@GetMapping("departmentAdd")
	public ModelAndView setDepartmentAdd(CollegeVO collegeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<CollegeVO> ar =  administratorService.getCollege();
		mv.addObject("list", ar);
		
		mv.setViewName("administrator/departmentAdd");
		
		return mv;
	}
	
	@PostMapping("departmentAdd")
	public ModelAndView setDepartmentAdd(@Valid DepartmentVO departmentVO, BindingResult bindingResult) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setDepartmentAdd(departmentVO);
		
		if(bindingResult.hasErrors()) {
			log.warn("검증에 실패");
			mv.setViewName("administrator/departmentAdd");
			return mv;
		}
		
		String message = "등록 실패";
		
		if(result > 0) {
			message = "등록되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./departmentList");
		return mv;
	}
	
	//학과 중복 체크
	@GetMapping("departmentDuplicateCheck")
	@ResponseBody
	public boolean departmentDuplicateCheck(DepartmentVO departmentVO) throws Exception {
		boolean check = true;
		departmentVO = administratorService.departmentDuplicateCheck(departmentVO);
		
		if(departmentVO !=null) {
			check = false;
		}
		
		return check;
	}
	
	//기간 설정
	
	@GetMapping("periodList")
	public ModelAndView getPeriodList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PeriodVO> ar = administratorService.getPeriodList(pagination);
		
		mv.addObject("list", ar);
		mv.setViewName("administrator/periodList");
		
		return mv;
	}
	
	@GetMapping("periodAdd")
	public ModelAndView setPeriodAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<String> result = administratorService.getCurrentYear();
		
		mv.addObject("year", result);
		mv.setViewName("administrator/periodAdd");
		
		return mv;
	}
	
	
	@PostMapping("periodAdd")
	public ModelAndView setPeriodAdd(@Valid PeriodVO periodVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setPeriodAdd(periodVO);
		
		
		  if(bindingResult.hasErrors()) { 
			  log.warn("검증에 실패");
			  mv.setViewName("administrator/periodAdd"); return mv; 
		 }
		 
		
		String message= "등록 실패";
		
		if(result > 0) {
			message = "등록되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./periodList");
		return mv;
		
		
	}
	
	//강의 조회
	@GetMapping("lectureList")
	public ModelAndView getLectureList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<LectureVO> ar = administratorService.getLectureList(pagination);
		List<DepartmentVO> ar2 =  administratorService.getDepartment();
		List<String> ar3 =  administratorService.getCurrentYear();
		
		mv.addObject("list", ar);
		mv.addObject("department", ar2);
		mv.addObject("year", ar3);
		mv.setViewName("administrator/lectureList");
		
		return mv;
	}

	//강의실 배정
	@GetMapping("lectureRoomAssignment")
	public ModelAndView getLectureRoomAssignment(Pagination pagination, NotificationVO notificationVO, LectureVO lectureVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<LectureRoomVO> ar = administratorService.getLectureRoomAssignment(pagination);
		lectureVO = administratorService.getLectureNum(lectureVO);
		
		if(notificationVO.getNotificationNum() != null) {
			int result = notificationService.setDelete(notificationVO);
		}
		
		mv.addObject("list", ar);
		mv.addObject("lectureNum", lectureVO);
		mv.setViewName("administrator/lectureRoomAssignment");
		
		return mv;
	}
	
	@PostMapping("lectureRoomAssignment")
	public ModelAndView setLectureRoomAssignment(@Valid LectureVO lectureVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result =  administratorService.setLectureRoomAssignmentUpdate(lectureVO);
		
		if(bindingResult.hasErrors()) {
			log.warn("검증에 실패");
			mv.setViewName("administrator/lectureRoomAssignment");
			return mv;
		}
		
		String message= "배정 실패";
		
		if(result > 0) {
			message = "배정되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./lectureRoomAssignment");
		return mv;
		
		
	}

}