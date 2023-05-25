package com.acadmi.student.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.lecture.LectureVO;
import com.acadmi.util.Pagination;

@Service
public class StudentLectureService {
	
	@Autowired
	private StudentLectureDAO studentLectureDAO;
	
	/** SELECT **/
	//내 수강 신청 조회
	public List<LectureVO> getAllLectureList(Pagination pagination) throws Exception {
		pagination.makeStartRow();
		pagination.makeNum(studentLectureDAO.getTotalCount(pagination));
		return studentLectureDAO.getAllLectureList(pagination);
	}
	
	//내 수강 신청 조회
	public List<StudentLectureVO> getMyLectureList(Pagination pagination) throws Exception {
		pagination.makeStartRow();
		pagination.makeNum(studentLectureDAO.getTotalCount(pagination));
		return studentLectureDAO.getMyLectureList(pagination);
	}
	
	//내 수강 신청 조회
	public List<FavoriteLectureVO> getMyFavoriteList(Pagination pagination) throws Exception {
		pagination.makeStartRow();
		pagination.makeNum(studentLectureDAO.getTotalCount(pagination));
		return studentLectureDAO.getMyFavoriteList(pagination);
	}

}
