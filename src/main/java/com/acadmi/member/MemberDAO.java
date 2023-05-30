package com.acadmi.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.administrator.AdministratorVO;
import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;

@Mapper
public interface MemberDAO {

//	Member
	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	public int setLogout(MemberVO memberVO) throws Exception;
	public int setJoin(MemberVO memberVO) throws Exception;
	public int setRoleAdd(Map<String, Object> map) throws Exception;
	public MemberVO getFindPw(MemberVO memberVO) throws Exception;
	public int setPwUpdate(MemberVO memberVO) throws Exception;
	
//	========================================================================================
	
	public DepartmentVO getStudent(StudentVO studentVO) throws Exception;
	public DepartmentVO getProfessor(ProfessorVO professorVO) throws Exception;
	public DepartmentVO getAdministrator(AdministratorVO administratorVO) throws Exception;
	
//	=========================================================================================
	
	public MemberVO setStudentUpdate(StudentVO studentVO) throws Exception;
	public MemberVO setProfessorUpdate(ProfessorVO professorVO) throws Exception;
	public MemberVO setAdministratorUpdate(AdministratorVO administratorVO) throws Exception;

}
