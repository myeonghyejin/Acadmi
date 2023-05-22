package com.acadmi.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	public MemberVO login(MemberVO memberVO) throws Exception;
	
}
