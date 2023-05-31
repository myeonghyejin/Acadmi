package com.acadmi.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LectureService {
	
	@Autowired
	private LectureDAO lectureDAO;
	
	public List<LectureVO> getLectureList() throws Exception{
		return lectureDAO.getLectureList();
	}
	public List<LectureVO> getTemporaryList() throws Exception{
		return lectureDAO.getTemporaryList();
	}
	public int setLectureUpdate(LectureVO lectureVO) throws Exception{
		return lectureDAO.setLectureUpdate(lectureVO);
	}
	public int setLectureAdd(LectureVO lectureVO) throws Exception{
		log.error("ddd");
		return lectureDAO.setLectureAdd(lectureVO);
	}
	public int setTemporaryAdd(LectureVO lectureVO) throws Exception{
		log.error("ddd");
		return lectureDAO.setTemporaryAdd(lectureVO);
	}
	

}
