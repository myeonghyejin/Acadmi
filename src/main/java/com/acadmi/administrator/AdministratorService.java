package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lectureroom.LectureRoomVO;
import com.acadmi.member.MemberSeqVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdministratorService {
	
	@Autowired
	private AdministratorDAO administratorDAO;
	
	//회원 관리
	
	//아이디
	//username이 string이기 때문에 string으로 변환시켜주기
	
	public List<CollegeVO> getCollege() throws Exception {
		return administratorDAO.getCollege();
	}
	
	public List<DepartmentVO> getDepartment() throws Exception {
		return administratorDAO.getDepartment();
	}
	
	//계정 생성
	public int setStudentAdd(StudentVO studentVO, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception {
		
		int result;
		String year;
		 if(administratorDAO.getYearSeq(memberSeqVO) == null) {
			 result =  administratorDAO.setInsertSeq(memberSeqVO);
			 year=  administratorDAO.getYearSeq(memberSeqVO).toString();
			 Long memberSeq = administratorDAO.getMemberSeq(memberSeqVO);
			 String username;
			 
			 if(memberSeq < 10) {
				  username = year + "000" + memberSeq;
			  }else if(memberSeq < 100) {
				  username = year + "00" + memberSeq;
			  }else if(memberSeq < 1000) {
				  username = year + "0" + memberSeq;
			  }else {
				  username = year + memberSeq;
			  }
			  
			  
			  memberVO.setUsername(username);
			 
			
			result = administratorDAO.setMemberAdd(memberVO);
			
			studentVO.setUsername(memberVO.getUsername());
			
			result = administratorDAO.setStudentAdd(studentVO);
			
			return result;
			 
			 
		 }else {
			  year = administratorDAO.getYearSeq(memberSeqVO).toString(); 
			  result = administratorDAO.setUpdateSeq(memberSeqVO);
			  Long memberSeq = administratorDAO.getMemberSeq(memberSeqVO);
			  String username;
			  
			  
			  
			  if(memberSeq < 10) {
				  username = year + "000" + memberSeq;
			  }else if(memberSeq < 100) {
				  username = year + "00" + memberSeq;
			  }else if(memberSeq < 1000) {
				  username = year + "0" + memberSeq;
			  }else {
				  username = year + memberSeq;
			  }
			  
			  
			  memberVO.setUsername(username);
			 
			
			result = administratorDAO.setMemberAdd(memberVO);
			
			studentVO.setUsername(memberVO.getUsername());
			
			result = administratorDAO.setStudentAdd(studentVO);
			
			return result;
		 }
	
		
	}
	
	public int setAdministratorAdd(AdministratorVO administratorVO, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception {
		
		int result;
		String year;
		 if(administratorDAO.getYearSeq(memberSeqVO) == null) {
			 result =  administratorDAO.setInsertSeq(memberSeqVO);
			 year=  administratorDAO.getYearSeq(memberSeqVO).toString();
			 Long memberSeq = administratorDAO.getMemberSeq(memberSeqVO);
			 String username;
			 
			 if(memberSeq < 10) {
				  username = year + "000" + memberSeq;
			  }else if(memberSeq < 100) {
				  username = year + "00" + memberSeq;
			  }else if(memberSeq < 1000) {
				  username = year + "0" + memberSeq;
			  }else {
				  username = year + memberSeq;
			  }
			  
			  
			  memberVO.setUsername(username);
			 
			
			result = administratorDAO.setMemberAdd(memberVO);
			
			administratorVO.setUsername(memberVO.getUsername());
			
			result = administratorDAO.setAdministratorAdd(administratorVO);
			
			return result;
			 
			 
		 }else {
			  year = administratorDAO.getYearSeq(memberSeqVO).toString(); 
			  result = administratorDAO.setUpdateSeq(memberSeqVO);
			  Long memberSeq = administratorDAO.getMemberSeq(memberSeqVO);
			  String username;
			  
			  
			  
			  if(memberSeq < 10) {
				  username = year + "000" + memberSeq;
			  }else if(memberSeq < 100) {
				  username = year + "00" + memberSeq;
			  }else if(memberSeq < 1000) {
				  username = year + "0" + memberSeq;
			  }else {
				  username = year + memberSeq;
			  }
			  
			  
			  memberVO.setUsername(username);
			 
			
			result = administratorDAO.setMemberAdd(memberVO);
			
			administratorVO.setUsername(memberVO.getUsername());
			
			result = administratorDAO.setAdministratorAdd(administratorVO);
			
			return result;
		 }
		
	}
	
	//회원 조회
	public List<StudentVO> getStudentList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountStudent(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getStudentList(pagination);
	}
	
	public List<ProfessorVO> getProfessorList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountProfessor(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getProfessorList(pagination);
	}
	
	public List<AdministratorVO> getAdministratorList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountAdministrator(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getAdministratorList(pagination);
	}
	
	//강의실 관리
	
	//강의실 조회
	public List<LectureRoomVO> getLectureRoomList(Pagination pagination) throws Exception {
		Long totalCount = administratorDAO.getTotalCountLectureRoom(pagination);
		
		pagination.makeNum(totalCount);
		pagination.makeStartRow();
		
		return administratorDAO.getLectureRoomList(pagination);
	}
	//강의실 등록
	public int setLectureRoomAdd(LectureRoomVO lectureRoomVO) throws Exception {
		
		return administratorDAO.setLectureRoomAdd(lectureRoomVO);
	}
	//강의실 수정
	public int setLectureRoomUpdate(LectureRoomVO lectureRoomVO) throws Exception {
		
		return administratorDAO.setLectureRoomUpdate(lectureRoomVO);
	}
	

}
