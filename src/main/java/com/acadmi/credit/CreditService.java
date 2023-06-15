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
	//강의 목록
	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception{
		return creditDAO.getLectureList(lectureVO);
	}
	//강의 정보
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception{
		return creditDAO.getLectureDetail(lectureVO);
	}
	//학생 목록 및 성적 정보
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception{
		return (List<StudentVO>) creditDAO.getLectureAttendee(lectureVO);
	}
	//성적 유무
	public int getCreditExists(LectureVO lectureVO) throws Exception{
		return creditDAO.getCreditExists(lectureVO);
	}
	//성적 입력
	public int setCreditAdd(CreditVO creditVO) throws Exception{
		return creditDAO.setCreditAdd(creditVO);
	}
	//성적 수정
	public int setCreditUpdate(CreditVO creditVO) throws Exception{
		return creditDAO.setCreditUpdate(creditVO);
	}
}