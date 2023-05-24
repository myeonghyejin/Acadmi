package com.acadmi.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureDAO {

	public List<LectureVO> getLectureList() throws Exception;
	public List<LectureVO> getTemporaryList() throws Exception;
	public int setLectureAdd(LectureVO lectureVO) throws Exception;
	public int setLectureUpdate(LectureVO lectureVO) throws Exception;
}
