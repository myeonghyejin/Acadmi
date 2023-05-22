package com.acadmi.department;

import java.util.List;

import com.acadmi.student.StudentVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DepartmentVO {

	private Integer deptNum;
	private Integer collegeNum;
	private String deptName;
	private Integer status;
	private List<StudentVO> studentVOs;
}
