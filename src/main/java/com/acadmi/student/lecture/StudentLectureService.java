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
		
		if(studentLectureDAO.getAllLectureCount(pagination) == 0) {
			pagination.setLastNum(1L);
			pagination.setNext(false);
		}
		
//		log.error("{}", studentLectureDAO.getAllLectureList(pagination).isEmpty());
		
		return studentLectureDAO.getAllLectureList(pagination);
	}
	
	//내 수강 신청 조회
	public List<StudentLectureVO> getMyLectureList(StudentLectureVO studentLectureVO, HttpSession session, Pagination pagination) throws Exception {
		return studentLectureDAO.getMyLectureList(studentLectureVO, pagination);
	}
	
	//내 장바구니 조회
	public List<FavoriteLectureVO> getMyFavoriteList(FavoriteLectureVO favoriteLectureVO, HttpSession session, Pagination pagination) throws Exception {
		return studentLectureDAO.getMyFavoriteList(favoriteLectureVO, pagination);
	}
	
	//수강한 강의인지 아닌지 확인
	public StudentLectureVO getMyLecture(StudentLectureVO studentLectureVO) throws Exception {
		return studentLectureDAO.getMyLecture(studentLectureVO);
	}
	
	//장바구니에 담은 강의인지 아닌지 확인
	public StudentLectureVO getMyFavorite(FavoriteLectureVO favoriteLectureVO) throws Exception {
		return studentLectureDAO.getMyFavorite(favoriteLectureVO);
	}
	
	/** INSERT **/
	//수강 신청
	public int setStudentLectureInsert(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session) throws Exception {
		return studentLectureDAO.setStudentLectureInsert(studentLectureVO);
	}
	
	//장바구니 담기
	public int setFavoriteLectureInsert(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session) throws Exception {
		return studentLectureDAO.setFavoriteLectureInsert(favoriteLectureVO);
	}
	
	/** UPDATE **/
	//수강 신청 인원 증가
	public int setSubscriptionAddUpdate(LectureVO lectureVO) throws Exception {
		return studentLectureDAO.setSubscriptionAddUpdate(lectureVO);
	}
	
	//수강 신청 인원 감소
	public int setSubscriptionDeleteUpdate(LectureVO lectureVO) throws Exception {
		return studentLectureDAO.setSubscriptionDeleteUpdate(lectureVO);
	}
	
	/** DELETE **/
	//수강 취소
	public int setStudentLectureDelete(StudentLectureVO studentLectureVO, LectureVO lectureVO, HttpSession session) throws Exception {
		return studentLectureDAO.setStudentLectureDelete(studentLectureVO);
	}
	
	//장바구니 빼기
	public int setFavoriteLectureDelete(FavoriteLectureVO favoriteLectureVO, LectureVO lectureVO, HttpSession session) throws Exception {
		return studentLectureDAO.setFavoriteLectureDelete(favoriteLectureVO);
	}
	
}
