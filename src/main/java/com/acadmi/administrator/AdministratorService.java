package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lectureroom.LectureRoomVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdministratorService {
	
	@Autowired
	private AdministratorDAO administratorDAO;
	
	//회원 관리
	
	//계정 생성
	public int setStudentAdd(StudentVO studentVO) throws Exception {
		
		int result = administratorDAO.setMemberAdd(studentVO);
		
		studentVO.setUsername(studentVO.getUsername());
		
		result = administratorDAO.setStudentAdd(studentVO);
		
		return result;
		
	}
	//회원 조회
	public List<StudentVO> getStudentList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountStudent(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getStudentList(pagination);
	}
	
	public List<ProfessorVO> getProfessorList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountProfessor(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getProfessorList(pagination);
	}
	
	public List<AdministratorVO> getAdminIstratorList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountAdminIstrator(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getAdminIstratorList(pagination);
	}
	
	//강의실 관리
	
	//강의실 조회
	public List<LectureRoomVO> getLectureRoomList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountLectureRoom(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getLectureRoomList(pagination);
	}
	//강의실 등록
	public int setLectureRoomAdd(LectureRoomVO lectureRoomVO) throws Exception {
		
		return administratorDAO.setLectureRoomAdd(lectureRoomVO);
	}
	//강의실 수정
	public int setLectureRoomUpdate(LectureRoomVO lectureRoomVO) throws Exception {
		
		return administratorDAO.setLectureRoomUpdate(lectureRoomVO);
	}
	

}
