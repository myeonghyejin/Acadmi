package com.acadmi.administrator;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberVO;
import com.acadmi.student.StudentVO;


@Mapper
public interface AdminIstratorDAO {
	
	public List<AdminIstratorVO> getStudentList() throws Exception;
	public int setMemberInsert(MemberVO memberVO) throws Exception;
	public int setStudentInsert(StudentVO studentVO) throws Exception;
	public int setDepartmentInsert(DepartmentVO departmentVO) throws Exception;
	public int setCollegeInsert(CollegeVO collegeVO) throws Exception;
	
	public List<AdminIstratorVO> getProfessorList() throws Exception;

}
