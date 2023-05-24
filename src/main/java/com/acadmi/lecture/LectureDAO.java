package com.acadmi.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureDAO {

	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception;
	
	public int setLectureAdd(LectureVO lectureVO) throws Exception;
	public int setTemporaryAdd(LectureVO lectureVO) throws Exception;
	public int setLectureUpdate(LectureVO lectureVO) throws Exception;
}
