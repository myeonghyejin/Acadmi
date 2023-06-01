package com.acadmi.credit;

import java.util.List;

import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CreditVO {
	private Long creditNum;
	private Long lectureNum;
	private String username;
	private Float semiGrade;
	private Float finalGrade;
	private Float reportGrade;
	private Float attenance;
	private Float Credit;

}
