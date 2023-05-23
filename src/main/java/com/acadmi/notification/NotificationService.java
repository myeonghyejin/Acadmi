package com.acadmi.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	public List<NotificationVO> getList() throws Exception {
		return notificationDAO.getList();
	}

}
