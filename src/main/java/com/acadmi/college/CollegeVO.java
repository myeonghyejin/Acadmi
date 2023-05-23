package com.acadmi.college;

import java.util.List;

import com.acadmi.department.DepartmentVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CollegeVO {

	private Integer collegeNum;
	private String collegeName;
	private String building;
	private List<DepartmentVO> departmentVOs;
}
