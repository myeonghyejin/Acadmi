package com.acadmi.administrator;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;


@Mapper
public interface AdministratorDAO {
	
	public List<StudentVO> getStudentList(Pagination pagination) throws Exception;
	public List<ProfessorVO> getProfessorList(Pagination pagination) throws Exception;
	public List<AdministratorVO> getAdminIstratorList(Pagination pagination) throws Exception;
	public Long getTotalCountStudent(Pagination pagination) throws Exception;
	public Long getTotalCountProfessor(Pagination pagination) throws Exception;
	public Long getTotalCountAdminIstrator(Pagination pagination) throws Exception;
	
	public int setMemberInsert(MemberVO memberVO) throws Exception;
	public int setStudentInsert(StudentVO studentVO)throws Exception;
	public int setProfessorInsert(ProfessorVO professorVO)throws Exception;
	public int setAdminIstratorInsert(AdministratorVO adminIstratorVO) throws Exception;
	
	public List<MemberVO> getMember() throws Exception;

}
