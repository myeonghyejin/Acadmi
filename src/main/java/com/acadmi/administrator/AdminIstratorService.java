package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminIstratorService {
	
	@Autowired
	private AdminIstratorDAO adminIstratorDAO;
	
	public List<StudentVO> getStudentList(Pagination pagination) throws Exception {
		Long totalCount = adminIstratorDAO.getTotalCountStudent(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return adminIstratorDAO.getStudentList(pagination);
	}
	
	public List<ProfessorVO> getProfessorList(Pagination pagination) throws Exception {
		Long totalCount = adminIstratorDAO.getTotalCountProfessor(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return adminIstratorDAO.getProfessorList(pagination);
	}
	
	public List<AdminIstratorVO> getAdminIstratorList(Pagination pagination) throws Exception {
		Long totalCount = adminIstratorDAO.getTotalCountAdminIstrator(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return adminIstratorDAO.getAdminIstratorList(pagination);
	}

}
