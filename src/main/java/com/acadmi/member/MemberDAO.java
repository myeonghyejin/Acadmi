package com.acadmi.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	
}
