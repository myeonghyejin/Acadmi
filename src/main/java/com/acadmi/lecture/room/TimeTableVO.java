package com.acadmi.lecture.room;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TimeTableVO {
	
	private Long timeTableNum;
	private String lectureBuilding;
	private Integer lectureRoom;
	private String weekday;
	private Integer time;
	private Integer year;
	private Integer semester;
	
	private List<TimeInfoVO> timeInfoVOs;
	
	
	
}
