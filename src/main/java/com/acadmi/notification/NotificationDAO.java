package com.acadmi.notification;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.member.MemberVO;

@Mapper
public interface NotificationDAO {
	
	//알림 list 출력
	public List<NotificationVO> getList() throws Exception;
	
	//알림 저장
	public int setNotification(NotificationVO notificationVO) throws Exception;
	
	//알림 보낼 전체 멤버list 출력
	public List<MemberVO> getMemberList() throws Exception;
	
	//알림 보낼 직원 멤버list 출력
	public List<MemberVO> getAdministratorList(MemberVO memberVO) throws Exception;

}
