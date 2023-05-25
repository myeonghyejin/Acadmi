package com.acadmi.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	public int setLogout(MemberVO memberVO) throws Exception;
	public int setJoin(MemberVO memberVO) throws Exception;
	public int setRoleAdd(Map<String, Object> map) throws Exception;
	public int setEnabled() throws Exception;
	
}
