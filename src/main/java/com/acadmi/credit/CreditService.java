package com.acadmi.credit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CreditService {
	
	@Autowired
	private CreditDAO creditDAO;
	
	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception{
		return creditDAO.getLectureList(lectureVO);
	}
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception{
		return (List<StudentVO>) creditDAO.getLectureAttendee(lectureVO);
	}
	public int getCreditExists(LectureVO lectureVO) throws Exception{
		return creditDAO.getCreditExists(lectureVO);
	}
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception{
		return creditDAO.getLectureDetail(lectureVO);
	}
	public int setCreditAdd(CreditVO creditVO) throws Exception{
		return creditDAO.setCreditAdd(creditVO);
	}
}