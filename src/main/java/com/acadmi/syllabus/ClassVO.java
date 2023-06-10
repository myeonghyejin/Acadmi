package com.acadmi.syllabus;

import java.util.List;

import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ClassVO {
	private Long syllabusNum;
	private Integer order;
	private String subject;
	private String goal;
	private String capability;
	private String note;
	

}
