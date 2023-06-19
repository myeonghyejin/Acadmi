package com.acadmi.student.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.acadmi.department.DepartmentVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.util.Pagination;

@Mapper
public interface StudentLectureDAO {
	
	/** SELECT **/
	//수강 신청 & 장바구니 조회
	public List<LectureVO> getAllLectureList(Pagination pagination) throws Exception;
	
	//내 수강 신청 조회
	public List<StudentLectureVO> getMyLectureList(StudentLectureVO studentLectureVO) throws Exception;
	
	//내 장바구니 조회
	public List<FavoriteLectureVO> getMyFavoriteList(FavoriteLectureVO favoriteLectureVO) throws Exception;
	
	//수강 신청 & 장바구니 강의 총 개수
	public Long getAllLectureCount(Pagination pagination) throws Exception;
	
	//내 수강 신청 강의 총 개수
	public Long getMyLectureCount(Pagination pagination) throws Exception;
	
	//내 장바구니 강의 총 개수
	public Long getMyFavoriteCount(Pagination pagination) throws Exception;
	
	//수강한 강의인지 아닌지 확인
	public StudentLectureVO getMyLecture(StudentLectureVO studentLectureVO) throws Exception;
	
	//장바구니에 담은 강의인지 아닌지 확인
	public FavoriteLectureVO getMyFavorite(FavoriteLectureVO favoriteLectureVO) throws Exception;
	
	//현재 수강 중인 강의들의 총 학점 계산
	public Long getSumCredit(StudentLectureVO studentLectureVO) throws Exception;
	
	//수강하고자 하는 강의와 현재 수강 중인 강의들의 총 학점 계산
	public Long getCalculateCredit(StudentLectureVO studentLectureVO) throws Exception;
	
	//이미 수강한 강의와 시간이 겹치는지 확인
	public List<LectureVO> getDuplicateTime(StudentLectureVO studentLectureVO, LectureVO lectureVO) throws Exception;
	
	//학과 조회
	public List<DepartmentVO> getDepartment() throws Exception;
	
	/** INSERT **/
	//수강 신청
	public int insertToStudentLecture(StudentLectureVO studentLectureVO) throws Exception;
	
	//장바구니 담기
	public int insertToFavoriteLecture(FavoriteLectureVO favoriteLectureVO) throws Exception;
	
	/** UPDATE **/
	//수강 신청 인원 증가
	public int addToSubscription(LectureVO lectureVO) throws Exception;
	
	//수강 신청 인원 감소
	public int deleteToSubscription(LectureVO lectureVO) throws Exception;
	
	//장바구니에 담음
	public int addToFavorite(LectureVO lectureVO) throws Exception;
	
	//장바구니에서 뺌
	public int deleteToFavorite(LectureVO lectureVO) throws Exception;
	
	/** DELETE **/
	//수강 취소
	public int deleteToStudentLecture(StudentLectureVO studentLectureVO) throws Exception;
	
	//장바구니 빼기
	public int deleteToFavoriteLecture(FavoriteLectureVO favoriteLectureVO) throws Exception;	

}
