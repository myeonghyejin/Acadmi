package com.acadmi.member;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {

	private Integer username;
	private String password;
	private String email;
	private Integer category;
	private Integer enabled;
	private List<MemberFilesVO> memberFilesVOs;
	
	private List<RoleVO> roleVOs;
}
