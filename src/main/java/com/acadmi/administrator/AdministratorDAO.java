package com.acadmi.administrator;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lectureroom.LectureRoomVO;
import com.acadmi.member.MemberSeqVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;


@Mapper
public interface AdministratorDAO {
	
	//회원관리
	
	//아이디 
//	public int setMemberSeqAdd(MemberSeqVO memberSeqVO) throws Exception;
//	public MemberSeqVO getMemberSeq(MemberSeqVO memberSeqVO) throws Exception;
//	public int setMemberSeqUpdate(MemberSeqVO memberSeqVO) throws Exception;
	
	//계정 생성
	public int setMemberAdd(MemberVO memberVO) throws Exception;
	public int setStudentAdd(StudentVO studentVO) throws Exception;
	public int setAdministratorAdd(AdministratorVO administratorVO) throws Exception;
	
	//회원 조회
	public List<StudentVO> getStudentList(Pagination pagination) throws Exception;
	public List<ProfessorVO> getProfessorList(Pagination pagination) throws Exception;
	public List<AdministratorVO> getAdminIstratorList(Pagination pagination) throws Exception;
	public Long getTotalCountStudent(Pagination pagination) throws Exception;
	public Long getTotalCountProfessor(Pagination pagination) throws Exception;
	public Long getTotalCountAdminIstrator(Pagination pagination) throws Exception;
	
	
	
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
