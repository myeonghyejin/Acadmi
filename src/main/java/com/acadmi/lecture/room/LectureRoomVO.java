package com.acadmi.lecture.room;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class LectureRoomVO {

	private String lectureBuilding;
	private Integer lectureRoom;
	private Integer personal;
	private Integer status;
	
	private List<TimeTableVO> timeTableVOs;
}
