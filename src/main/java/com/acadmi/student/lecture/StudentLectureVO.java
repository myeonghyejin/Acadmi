package com.acadmi.student.lecture;

import com.acadmi.lecture.LectureVO;
import com.acadmi.credit.CreditVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentLectureVO {
	
	private Long lectureNum;
	private String username;
	private Integer year;
	private Integer semester;
	private Integer credit;
	
	private LectureVO lectureVO;
	private CreditVO creditVO;

}
