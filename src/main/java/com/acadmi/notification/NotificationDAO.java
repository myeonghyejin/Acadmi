package com.acadmi.notification;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NotificationDAO {
	
	public List<NotificationVO> getList(NotificationVO notificationVO) throws Exception;

}
