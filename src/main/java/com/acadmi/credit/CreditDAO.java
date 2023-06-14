package com.acadmi.credit;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.StudentVO;

@Mapper
public interface CreditDAO {
	
	//강의 목록
	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception;
	//강의 정보
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception;
	//학생 목록 및 성적 정보
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception;
	
	//학생 성적 유무
	public int getCreditExists(LectureVO lectureVO) throws Exception;
	//성적 등록
	public int setCreditAdd(CreditVO creditVO) throws Exception;
	//성적 수정
	public int setCreditUpdate(CreditVO creditVO) throws Exception;
}