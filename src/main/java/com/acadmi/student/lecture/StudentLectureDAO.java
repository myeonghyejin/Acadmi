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
	public List<StudentLectureVO> getMyLectureList(Pagination pagination) throws Exception;
	
	//내 장바구니 조회
	public List<FavoriteLectureVO> getMyFavoriteList(Pagination pagination) throws Exception;
	
	//글 개수
	public Long getTotalCount(Pagination pagination) throws Exception;

}
