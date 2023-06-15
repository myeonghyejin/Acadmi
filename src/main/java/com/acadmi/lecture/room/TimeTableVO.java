package com.acadmi.lecture.room;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TimeTableVO {
	
	private String weekday;
	private Integer time;
	private Integer lectureBuilding;
	private Integer lectureRoom;
	private Integer startTime;
	private Integer lastTime;
	
	
	
}
