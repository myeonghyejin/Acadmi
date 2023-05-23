package com.acadmi.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acadmi.board.notice.NoticeVO;
import com.acadmi.qna.QnaVO;

@Service
public class NotificationService {
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	public List<NotificationVO> getList() throws Exception {
		return notificationDAO.getList();
	}
	
	//member 모두가 받을 수 있음
	//중요 공지사항이 등록외었을때 알림발생
	public int setIptNotice(NoticeVO noticeVO) throws Exception {
		NotificationVO notificationVO = new NotificationVO();
		//123456789L은 admin 아이디
		notificationVO.setSender(123456789L);
		notificationVO.setNotificationMsg(noticeVO.getTitle());
		notificationVO.setNotificationKind(1);
		int result = notificationDAO.setNotification(notificationVO);
		
		return result;
	}
	
	//직원(administratop)의 알림
	//질의응답이 등록되었을때 알림발생
	public int setQna(QnaVO qnaVO) throws Exception {
		
		NotificationVO notificationVO = new NotificationVO();
		//for문 돌려서 디비에서 권한정보 빼와서 직원인 멤버만 recipient에 넣어준다
		//member가 완성되면 세션에서 id빼와서 sender에다가 넣기
		notificationVO.setNotificationMsg(qnaVO.getTitle());
		notificationVO.setNotificationKind(2);
		int result = notificationDAO.setNotification(notificationVO);
		
		return result;
	}

}
