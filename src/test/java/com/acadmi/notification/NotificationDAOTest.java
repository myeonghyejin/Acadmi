package com.acadmi.notification;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class NotificationDAOTest {

	@Autowired
	private NotificationDAO notificationDAO;
	
	@Test
	void getList() throws Exception {
		
		List<NotificationVO> ar = notificationDAO.getList();
		assertNotEquals(0, ar.size());
		
	}
	
	@Test
	void setNotification() throws Exception {
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setUsername(123L);
		notificationVO.setNotificationMsg("dsdsds");
		notificationVO.setNotificationKind(1);
		int result = notificationDAO.setNotification(notificationVO);
		assertNotEquals(0, result);
	}
	
}
