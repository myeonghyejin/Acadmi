package com.acadmi.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.student.StudentVO;

@Mapper
public interface LectureDAO {

	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception;
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception;
	public LectureVO getLectureMain(LectureVO lectureVO) throws Exception;
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception;
	public int setLectureAdd(LectureVO lectureVO) throws Exception;
	public int setTemporaryAdd(LectureVO lectureVO) throws Exception;
	public int setLectureUpdate(LectureVO lectureVO) throws Exception;
	public int setTemporaryUpdate(LectureVO lectureVO) throws Exception;
	public int setLectureDelete(LectureVO lectureVO) throws Exception;
}
