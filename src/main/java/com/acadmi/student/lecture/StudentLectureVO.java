package com.acadmi.student.lecture;

import com.acadmi.credit.CreditVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentLectureVO {
	
	private Long lectureNum;
	private String username;
	private Integer retake;
	private Integer enabled;
	private CreditVO creditVO;

}
