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
public interface AdminIstratorDAO {
	
	public List<AdminIstratorVO> getStudentList(Pagination pagination) throws Exception;
	public List<AdminIstratorVO> getProfessorList(Pagination pagination) throws Exception;
	public List<AdminIstratorVO> getAdminIstratorList(Pagination pagination) throws Exception;
	public Long getTotalCount(Pagination pagination) throws Exception;
	
	public int setMemberInsert(MemberVO memberVO) throws Exception;
	public int setStudentInsert(StudentVO studentVO)throws Exception;
	public int setProfessorInsert(ProfessorVO professorVO)throws Exception;
	public int setAdminIstratorInsert(AdminIstratorVO adminIstratorVO) throws Exception;
	
	public List<MemberVO> getMember() throws Exception;

}
