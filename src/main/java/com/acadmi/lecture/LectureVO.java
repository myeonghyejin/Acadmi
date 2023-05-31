package com.acadmi.lecture;

import java.util.List;

import com.acadmi.department.DepartmentVO;
import com.acadmi.lecture.room.LectureRoomVO;
import com.acadmi.period.PeriodVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.student.lecture.FavoriteLectureVO;
import com.acadmi.student.lecture.StudentLectureVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LectureVO {
	
	private Long lectureNum;
	private String username;
	private String lectureName;
	private Integer semester;
	private String category;
	private String lectureBuilding;
	private Integer lectureRoom;
	private Integer deptNum;
	private Integer grade;
	private Integer subscription;
	private Integer personal;
	private Integer year;
	private String weekday;
	private Integer startTime;
	private Integer endTime;
	private Float completionGrade;
	private Integer status;
	private String note;
	private Integer temporary;
	
	private StudentLectureVO studentLectureVO;
	private FavoriteLectureVO favoriteLectureVO;
	private ProfessorVO professorVO;
	private StudentVO studentVO;
	private PeriodVO periodVO;
	private LectureRoomVO lectureRoomVO;
	private DepartmentVO departmentVO;

}