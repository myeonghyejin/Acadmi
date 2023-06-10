package com.acadmi.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.student.StudentVO;
import com.acadmi.syllabus.ClassVO;
import com.acadmi.syllabus.SyllabusVO;

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
	
	public LectureVO getLectureProfessor(LectureVO lectureVO) throws Exception{
		return lectureDAO.getLectureProfessor(lectureVO);
	}
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception{
		return (List<StudentVO>) lectureDAO.getLectureAttendee(lectureVO);
	}
	
	public LectureVO getSyllabusDetail(LectureVO lectureVO) throws Exception{
		return lectureDAO.getSyllabusDetail(lectureVO);
	}
	public int getSyllabusExists(LectureVO lectureVO) throws Exception{
		return lectureDAO.getSyllabusExists(lectureVO);
	}
	public List<ClassVO> getSyllabusClass(LectureVO lectureVO) throws Exception{
		return lectureDAO.getSyllabusClass(lectureVO);
	}
	public int setSyllabusAdd(SyllabusVO syllabusVO) throws Exception{
		return lectureDAO.setSyllabusAdd(syllabusVO);
	}
	public int setClassAdd(ClassVO classVO) throws Exception{
		return lectureDAO.setClassAdd(classVO);
	}
	public int setSyllabusUpdate(SyllabusVO syllabusVO) throws Exception{
		return lectureDAO.setSyllabusUpdate(syllabusVO);
	}
	public int setClassUpdate(ClassVO classVO) throws Exception{
		log.error("syllabusNum : {}",classVO.getSyllabusNum());
		log.error("order : {}",classVO.getOrder());
		log.error(classVO.getSubject());
		return lectureDAO.setClassUpdate(classVO);
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
	
	
	public List<DepartmentVO> getDepartmentList(DepartmentVO departmentVO) throws Exception{
		return lectureDAO.getDepartmentList(departmentVO);
	}
	public List<CollegeVO> getCollegeList(CollegeVO collegeVO) throws Exception{
		return lectureDAO.getCollegeList(collegeVO);
	}
	
	public List<PeriodVO> getSemesterList(PeriodVO periodVO) throws Exception{
		return lectureDAO.getSemesterList(periodVO);
	}
}