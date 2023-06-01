package com.acadmi.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.college.CollegeVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.student.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LectureService {
	
	@Autowired
	private LectureDAO lectureDAO;
	
	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception{
		return lectureDAO.getLectureList(lectureVO);
	}
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception{
		return lectureDAO.getLectureDetail(lectureVO);
	}
	
	public LectureVO getLectureMain(LectureVO lectureVO) throws Exception{
		return lectureDAO.getLectureMain(lectureVO);
	}
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception{
		return (List<StudentVO>) lectureDAO.getLectureAttendee(lectureVO);
	}
	
	public int setLectureAdd(LectureVO lectureVO) throws Exception{
		return lectureDAO.setLectureAdd(lectureVO);
	}
	public int setTemporaryAdd(LectureVO lectureVO) throws Exception{
		return lectureDAO.setTemporaryAdd(lectureVO);
	}
	
	public int setLectureUpdate(LectureVO lectureVO) throws Exception{
		return lectureDAO.setLectureUpdate(lectureVO);
	}
	public int setTemporaryUpdate(LectureVO lectureVO) throws Exception{
		return lectureDAO.setTemporaryUpdate(lectureVO);
	}
	public int setLectureDelete(LectureVO lectureVO) throws Exception{
		return lectureDAO.setLectureDelete(lectureVO);
	}
	
	
	public List<CollegeVO> getDepartmentList(CollegeVO collegeVO) throws Exception{
		return lectureDAO.getDepartmentList(collegeVO);
	}
	public List<CollegeVO> getCollegeList(CollegeVO collegeVO) throws Exception{
		return lectureDAO.getCollegeList(collegeVO);
	}
	
	public List<PeriodVO> getSemesterList(PeriodVO periodVO) throws Exception{
		return lectureDAO.getSemesterList(periodVO);
	}
}