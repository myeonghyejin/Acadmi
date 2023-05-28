package com.acadmi.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.administrator.AdminIstratorDAO;
import com.acadmi.administrator.AdminIstratorVO;
import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
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
	
	public List<AdminIstratorVO> getStudent(MemberVO memberVO) throws Exception;
	public List<AdminIstratorVO> getProfessor(MemberVO memberVO) throws Exception;
	public List<AdminIstratorVO> getAdministrator(MemberVO memberVO) throws Exception;
	
	public int setStudent(MemberVO memberVO) throws Exception;
	public int setProfessor(MemberVO memberVO) throws Exception;
	public int setAdministrator(MemberVO memberVO) throws Exception;
	
//	========================================================================================

}
