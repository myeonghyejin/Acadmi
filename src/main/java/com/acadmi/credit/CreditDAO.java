package com.acadmi.credit;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.StudentVO;

@Mapper
public interface CreditDAO {

	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception;
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception;
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception;
}