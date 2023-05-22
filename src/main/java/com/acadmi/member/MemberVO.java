package com.acadmi.member;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {

	private Integer userName;
	private String password;
	private String email;
	private Integer category;
	private Integer enabled;
	
}
