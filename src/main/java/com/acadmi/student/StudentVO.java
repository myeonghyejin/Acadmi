package com.acadmi.student;

import java.sql.Date;

import com.acadmi.credit.CreditVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.member.MemberFilesVO;
import com.acadmi.member.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentVO extends MemberVO{
	
	private Integer deptNum;
	private Integer grade;
	private String name;
	private String phone;
	private Date birth;
	private String address;
	private String addressDetail;
	private Integer status;
	
	private Integer rank;
	
	private DepartmentVO departmentVO;
	private MemberFilesVO memberFilesVO;
	private CreditVO creditVO;
}
