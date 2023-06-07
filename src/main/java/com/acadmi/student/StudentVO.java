package com.acadmi.student;

import java.sql.Date;

import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentVO extends MemberVO{

	private Integer deptNum;
	private Integer grade;
	private String name;
	private Integer phone;
	private Date birth;
	private String address;
	private Integer status;
	
	private DepartmentVO departmentVO;
}
