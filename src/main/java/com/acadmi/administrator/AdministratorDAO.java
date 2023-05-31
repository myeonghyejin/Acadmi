package com.acadmi.administrator;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lecture.room.LectureRoomVO;
import com.acadmi.member.MemberSeqVO;
import com.acadmi.member.MemberVO;
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
	//강의실 수정
	public int setLectureRoomUpdate(LectureRoomVO lectureRoomVO) throws Exception;
	
	
 	
//	public int setMemberInsert(MemberVO memberVO) throws Exception;
//	public int setStudentInsert(StudentVO studentVO)throws Exception;
//	public int setProfessorInsert(ProfessorVO professorVO)throws Exception;
//	public int setAdminIstratorInsert(AdministratorVO adminIstratorVO) throws Exception;
//	
//	public List<MemberVO> getMember() throws Exception;

}
