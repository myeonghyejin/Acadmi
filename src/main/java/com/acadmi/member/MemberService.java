package com.acadmi.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
		return memberDAO.getLogin(memberVO);
	}
	
	public MemberVO getMyPage(MemberVO memberVO)throws Exception{
		return memberDAO.getLogin(memberVO);
	}
	
	public int setLogout(MemberVO memberVO) throws Exception{
		return memberDAO.setLogout(memberVO);
	}
	
}
