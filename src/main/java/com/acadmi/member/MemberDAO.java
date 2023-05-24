package com.acadmi.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	public int setLogout(MemberVO memberVO) throws Exception;
	
}
