package com.acadmi.student;

import java.util.List;

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
	
	public LectureVO getMaxYear(LectureVO lectureVO) throws Exception {
		return studentDAO.getMaxYear(lectureVO);
	}
	
	public LectureVO getMinYear(LectureVO lectureVO) throws Exception {
		return studentDAO.getMinYear(lectureVO);
	}
} 
