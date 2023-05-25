package com.acadmi.lecture;

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
	private Integer lastTime;
	private Float completionGrade;
	private String note;
	private Integer temporary;

}