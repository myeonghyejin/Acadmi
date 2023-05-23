package com.acadmi.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureDAO {

	public List<LectureVO> getLectureList() throws Exception;
}
