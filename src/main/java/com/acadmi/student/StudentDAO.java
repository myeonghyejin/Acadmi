package com.acadmi.student;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.lecture.StudentLectureVO;

@Mapper
public interface StudentDAO {
	
	//내 수강 강좌
	public List<LectureVO> getMyLectureList(LectureVO lectureVO) throws Exception;
	public LectureVO getMaxYear(LectureVO lectureVO) throws Exception;
	public LectureVO getMinYear(LectureVO lectureVO) throws Exception;
}
