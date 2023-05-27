package com.acadmi.student.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.lecture.LectureVO;
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

}
