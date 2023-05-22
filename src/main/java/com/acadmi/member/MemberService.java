package com.acadmi.member;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
		return memberDAO.getLogin(memberVO);
	}
	
}
