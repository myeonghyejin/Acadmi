package com.acadmi.student.lecture;

import com.acadmi.lecture.LectureVO;
import com.acadmi.student.StudentVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FavoriteLectureVO {

	private Long favoriteNum;
	private Long lectureNum;
	private String username;
	
}