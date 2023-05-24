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
	
	//@Test
	void setMemberInsertTest() throws Exception {
		
		for(int i=0; i<50; i++) {
			MemberVO memberVO = new MemberVO();
			memberVO.setUsername("user");
			adminAdminIstratorDAO.setMemberInsert(memberVO);
			
		}
	}
	
	
}
