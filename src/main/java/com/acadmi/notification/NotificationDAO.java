package com.acadmi.notification;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NotificationDAO {
	
	public List<NotificationVO> getList() throws Exception;
	
	public int setNotification(NotificationVO notificationVO) throws Exception;

}
