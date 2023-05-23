package com.acadmi.administrator;

import java.lang.reflect.Member;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberFilesVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.fasterxml.jackson.databind.type.CollectionLikeType;

@SpringBootTest
@Rollback(true)
public class AdminIstratorDAOTest {

	@Autowired
	private AdminIstratorDAO adminAdminIstratorDAO;
	
	//@Test
	void setMemberInsert() throws Exception {
		for(int i=0; i<50; i++) {	
			MemberVO memberVO = new MemberVO();
			
			memberVO.setUsername(i);
			memberVO.setPassword("1234");
			memberVO.setEmail("dfd@naver.com");
			memberVO.setCategory(2);
			memberVO.setEnabled(1);
			
			int result = adminAdminIstratorDAO.setMemberInsert(memberVO);
		}
	}
	
	
	//@Test
	void setStudentInsert() throws Exception {
		for(int i=1; i<50; i++) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setUsername(adminAdminIstratorDAO.getMember().get(i-1).getUsername());
			studentVO.setDeptNum(1);
			studentVO.setGrade(2);
			studentVO.setName("miri"+i);
			studentVO.setPhone(0102222222);
			studentVO.setAddress("서울");
			studentVO.setStatus(1);
			int result = adminAdminIstratorDAO.setStudentInsert(studentVO);
		}
	}
	
	//@Test
	void setProfessorInsert() throws Exception {
		for(int i=1; i<50; i++) {
			ProfessorVO professorVO = new ProfessorVO();
			
			professorVO.setUsername(adminAdminIstratorDAO.getMember().get(i-1).getUsername());
			professorVO.setDeptNum(1);
			professorVO.setName("professor"+i);
			professorVO.setProfessorRoom(i);
			professorVO.setPhone(01033333333);
			professorVO.setAddress("서울");
			professorVO.setStatus(1);
			
			int result = adminAdminIstratorDAO.setProfessorInsert(professorVO);
		}
	}
	
	@Test
	void setAdminIstratorInsert() throws Exception {
		
		for(int i=1; i<50; i++) {
			AdminIstratorVO adminIstratorVO = new AdminIstratorVO();
			
			adminIstratorVO.setUsername(adminAdminIstratorDAO.getMember().get(i-1).getUsername());
			adminIstratorVO.setName("administrator" + i);
			
			int result = adminAdminIstratorDAO.setAdminIstratorInsert(adminIstratorVO);
		}
	}
	
	

}
