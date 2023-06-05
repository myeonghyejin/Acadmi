package com.acadmi.lecture;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.student.StudentVO;
import com.acadmi.syllabus.ClassVO;
import com.acadmi.syllabus.SyllabusVO;

@Mapper
public interface LectureDAO {

	public List<LectureVO> getLectureList(LectureVO lectureVO) throws Exception;
	public LectureVO getLectureDetail(LectureVO lectureVO) throws Exception;
	public LectureVO getLectureProfessor(LectureVO lectureVO) throws Exception;
	public List<StudentVO> getLectureAttendee(LectureVO lectureVO) throws Exception;
	public List<ClassVO> getSyllabusClass(LectureVO lectureVO) throws Exception;
	public LectureVO getSyllabusDetail(LectureVO lectureVO) throws Exception;
	public int setLectureAdd(LectureVO lectureVO) throws Exception;
	public int setTemporaryAdd(LectureVO lectureVO) throws Exception;
	public int setLectureUpdate(LectureVO lectureVO) throws Exception;
	public int setTemporaryUpdate(LectureVO lectureVO) throws Exception;
	public int setLectureDelete(LectureVO lectureVO) throws Exception;
	public int setSyllabusAdd(SyllabusVO syllabusVO) throws Exception;
	public int setSyllabusUpdate(SyllabusVO syllabusVO) throws Exception;
	public int getSyllabusExists(LectureVO lectureVO) throws Exception;
	
	
	public List<DepartmentVO> getDepartmentList(DepartmentVO departmentVO) throws Exception;
	public List<CollegeVO> getCollegeList(CollegeVO collegeVO) throws Exception;
	public List<PeriodVO> getSemesterList(PeriodVO periodVO) throws Exception;
	
	
	
	
}