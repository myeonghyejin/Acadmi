package com.acadmi.administrator;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface AdminIstratorDAO {
	
	public List<AdminIstratorVO> getMemberList() throws Exception;

}
