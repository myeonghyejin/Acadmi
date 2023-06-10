package com.acadmi.syllabus;

import java.util.List;

import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SyllabusVO {
	private Long syllabusNum;
	private Long lectureNum;
	private String curriculumOutline;
	private String goal;
	private String evaluation;
	private String method;
	private String bookName;
	private String bookAuthor;
	private String bookPublisher;
	private String bookPublicationDate;
	private String bookISBN;
	private String bookNote;
	
	private List<ClassVO> classVOs;

}
