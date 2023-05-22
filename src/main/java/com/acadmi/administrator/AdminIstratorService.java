package com.acadmi.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminIstratorService {
	
	@Autowired
	private AdminIstratorDAO adminIstratorDAO;
	
	public List<AdminIstratorVO> getMemberList() throws Exception {
		
		return adminIstratorDAO.getMemberList();
	}

}
