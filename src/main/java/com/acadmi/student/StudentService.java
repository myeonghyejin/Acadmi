package com.acadmi.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.lecture.StudentLectureVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudentService {
	
	@Autowired
	private StudentDAO studentDAO;
	
	public List<LectureVO> getMyLectureList(LectureVO lectureVO) throws Exception {
		
		List<LectureVO> ar =  studentDAO.getMyLectureList(lectureVO);
		
		return ar;
	}
	
	public List<LectureVO> getMyCreditList(LectureVO lectureVO) throws Exception {
		
		List<LectureVO> ar = studentDAO.getMyCreditList(lectureVO);
		
		return ar;
	}
	
	//입학년도~재학년도
	public Map<String, Object> getYear(LectureVO lectureVO) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("min", studentDAO.getMinYear(lectureVO));
		map.put("max", studentDAO.getMaxYear(lectureVO));
				
		return map;
	}
} 
