package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberVO;
import com.acadmi.student.StudentVO;

@Service
public class AdminIstratorService {
	
	@Autowired
	private AdminIstratorDAO adminIstratorDAO;
	
	public List<AdministratorVO> getStudentList() throws Exception {
		
		return adminIstratorDAO.getStudentList();
	}
	
	public List<AdministratorVO> getProfessorList() throws Exception {
		
		return adminIstratorDAO.getProfessorList();
	}

}
