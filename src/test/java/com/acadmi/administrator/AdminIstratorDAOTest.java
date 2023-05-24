package com.acadmi.administrator;

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
import com.acadmi.student.StudentVO;
import com.fasterxml.jackson.databind.type.CollectionLikeType;

@SpringBootTest
@Rollback(true)
public class AdminIstratorDAOTest {

	@Autowired
	private AdminIstratorDAO adminAdminIstratorDAO;
	
	@Test
	@Transactional(rollbackFor = Exception.class)
	void setMemberInsertTest() throws Exception {
		
		for(int i=0; i<50; i++) {
			MemberVO memberVO = new MemberVO();
//			memberVO.setUsername(i);
			adminAdminIstratorDAO.setMemberInsert(memberVO);
			
		}
	}
	
//	@Test
//	void setCollegeInsertTest() throws Exception {
//		
//		for(int i=0; i<50; i++) {
//			CollegeVO collegeVO = new CollegeVO();
//			collegeVO.setCollegeNum(i);
//			collegeVO.setCollegeName("정보대" + i);
//			adminAdminIstratorDAO.setCollegeInsert(collegeVO);
//		}
//	}
//	
//	@Test
//	void setDepartmentInsertTest() throws Exception {
//		
//		for(int i=0; i<50; i++) {
//			DepartmentVO departmentVO = new DepartmentVO();
//			departmentVO.setDeptNum(i);
//			departmentVO.setCollegeNum(i);
//			departmentVO.setDeptName("컴퓨터공학과" + i);
//			adminAdminIstratorDAO.setDepartmentInsert(departmentVO);
//		}
//	}
//	
//	@Test
//	void setStudentInsertTest() throws Exception {
//		
//		for(int i=0; i<50; i++) {
//			StudentVO studentVO = new StudentVO();
//			studentVO.setUsername(i);
//			studentVO.setDeptNum(i);
//			adminAdminIstratorDAO.setStudentInsert(studentVO);
//		}
//	}
}
