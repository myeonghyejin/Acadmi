package com.acadmi.lecture;

import java.util.List;

import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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
	private Integer suvScription;
	private Integer personal;
	private Integer year;
	private String weekday;
	private Integer startTime;
	private Integer endTime;
	private Integer completionGrade;
	private Integer status;
	private String note;
	private Integer temporary;
	
	private ProfessorVO professorVO;
	private StudentVO studentVO;


}
