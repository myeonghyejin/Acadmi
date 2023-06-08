package com.acadmi.student.lecture;

import com.acadmi.lecture.LectureVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentLectureVO {
	
	private Long lectureNum;
	private String username;
	private Integer credit;
	private Integer enabled;
	
	private LectureVO lectureVO;

}
