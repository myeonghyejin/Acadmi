package com.acadmi.student;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.lecture.StudentLectureVO;

@Mapper
public interface StudentDAO {
	
	//내 수강 강좌
	public List<LectureVO> getMyLectureList(LectureVO lectureVO) throws Exception;
	public List<LectureVO> getMyCreditList(LectureVO lectureVO) throws Exception;
	
	//입학년됴~재학년도
	public Integer getMaxYear(LectureVO lectureVO) throws Exception;
	public Integer getMinYear(LectureVO lectureVO) throws Exception;
}
