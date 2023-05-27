package com.acadmi.student.lecture;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.lecture.LectureVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudentLectureService {
	
	@Autowired
	private StudentLectureDAO studentLectureDAO;
	
	/** SELECT **/
	//수강 신청 & 장바구니 조회
	public List<LectureVO> getAllLectureList(Pagination pagination) throws Exception {
		pagination.makeStartRow();
		pagination.makeNum(studentLectureDAO.getAllLectureCount(pagination));
		
//		log.error("{}", studentLectureDAO.getAllLectureList(pagination).isEmpty());
		
		return studentLectureDAO.getAllLectureList(pagination);
	}
	
	//내 수강 신청 조회
	public List<StudentLectureVO> getMyLectureList(StudentLectureVO studentLectureVO, HttpSession session) throws Exception {
		return studentLectureDAO.getMyLectureList(studentLectureVO);
	}
	
	//내 장바구니 조회
	public List<FavoriteLectureVO> getMyFavoriteList(FavoriteLectureVO favoriteLectureVO, HttpSession session) throws Exception {
		return studentLectureDAO.getMyFavoriteList(favoriteLectureVO);
	}

}
