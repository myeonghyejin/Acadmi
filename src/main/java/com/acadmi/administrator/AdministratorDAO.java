package com.acadmi.administrator;

import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.lecture.room.LectureRoomVO;
import com.acadmi.member.MemberSeqVO;
import com.acadmi.member.MemberVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;


@Mapper
public interface AdministratorDAO {
	
	//회원관리
	
	//아이디 
	public int setUpdateSeq(MemberSeqVO memberSeqVO) throws Exception;
	public Long getYearSeq(MemberSeqVO memberSeqVO) throws Exception;
	public Long getMemberSeq(MemberSeqVO memberSeqVO) throws Exception;
	public int setInsertSeq(MemberSeqVO memberSeqVO) throws Exception;
	public List<CollegeVO> getCollege() throws Exception;
	public List<DepartmentVO> getDepartment() throws Exception;
	
	//계정 생성
	public int setMemberAdd(MemberVO memberVO) throws Exception;
	public int setStudentAdd(StudentVO studentVO) throws Exception;
	public int setAdministratorAdd(AdministratorVO administratorVO) throws Exception;
	public int setProfessorAdd(ProfessorVO professorVO) throws Exception;
	public int setRoleAdd(Map<String, Object> map) throws Exception;
	
	//회원 조회
	public List<StudentVO> getStudentList(Pagination pagination) throws Exception;
	public List<ProfessorVO> getProfessorList(Pagination pagination) throws Exception;
	public List<AdministratorVO> getAdministratorList(Pagination pagination) throws Exception;
	public Long getTotalCountStudent(Pagination pagination) throws Exception;
	public Long getTotalCountProfessor(Pagination pagination) throws Exception;
	public Long getTotalCountAdministrator(Pagination pagination) throws Exception;
	
	
	
	//강의실 관리
	
	//강의실 조회
	public Long getTotalCountLectureRoom(Pagination pagination) throws Exception;
	public List<LectureRoomVO> getLectureRoomList(Pagination pagination) throws Exception;
	//강의실 등록
	public int setLectureRoomAdd(LectureRoomVO lectureRoomVO) throws Exception;
	public List<LectureRoomVO> getLectureBuilding() throws Exception;
	//강의실 중복 체크
	public LectureRoomVO LectureRoomDuplicateCheck(LectureRoomVO lectureRoomVO) throws Exception;
	//강의실 수정
	public int setLectureRoomUpdate(LectureRoomVO lectureRoomVO) throws Exception;

	
 	//학과 관리
	
	//학과 조회
	public Long getTotalCountDepartment(Pagination pagination) throws Exception;
	public List<DepartmentVO> getDepartmentList(Pagination pagination) throws Exception;
	
	//학과 등록
	public int setDepartmentAdd(DepartmentVO departmentVO) throws Exception;
	
	//학과 수정
	public int setDepartmentUpdate(DepartmentVO departmentVO) throws Exception;


	//기간 설정
	public int setPeriodAdd(PeriodVO periodVO) throws Exception;
	public List<String> getCurrentYear() throws Exception;
	
	//강의 조회
	public List<LectureVO> getLectureList(Pagination pagination) throws Exception;
	
	public Long getTotalCountLecture(Pagination pagination) throws Exception;
	
	//강의실 배정 
	public List<LectureRoomVO> getLectureRoomAssignment(Pagination pagination) throws Exception;
	public Long getTotalCountAssiginment(Pagination pagination) throws Exception;
 	public int setLectureRoomAssignmentUpdate(LectureVO lectureVO) throws Exception;
	public LectureVO getLectureNum(LectureVO lectureVO) throws Exception;
}
