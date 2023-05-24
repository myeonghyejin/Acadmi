package com.acadmi.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.acadmi.board.notice.NoticeVO;
import com.acadmi.member.MemberVO;
import com.acadmi.qna.QnaVO;


@Service
public class NotificationService {
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	@Autowired
	private SimpMessagingTemplate messagingTemplate;
	
	public void sendNotification(String username, String message) {
		messagingTemplate.convertAndSendToUser(username, "/queue/notification", message);
	}
	
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
		List<MemberVO> ar = notificationDAO.getMemberList();
		for(MemberVO memberVO:ar) {
			this.sendNotification(memberVO.getUsername().toString(), "[공지]"+notificationVO.getNotificationMsg());
		}
		
		return result;
	}
	
	//직원(administratop)의 알림 : 질의응답, 강의 등록
	//질의응답이 등록되었을때 알림발생
	public int setQna(QnaVO qnaVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationMsg(qnaVO.getTitle());
		//member가 완성되면 세션에서 id빼와서 sender에다가 넣기
		// kind가 2번은 질의응답 등록
		notificationVO.setNotificationKind(2);
		//for문 돌려서 디비에서 권한정보 빼와서 직원인 멤버만 recipient에 넣어준다
		MemberVO memberVO = new MemberVO();
		//category가 1이 직원
		memberVO.setCategory(1);
		List<MemberVO> ar =  notificationDAO.getAdministratorList(memberVO);
		for(MemberVO memberVO2:ar) {
			notificationVO.setRecipient(memberVO2.getUsername());
			result = notificationDAO.setNotification(notificationVO);
			this.sendNotification(memberVO2.getUsername().toString(), "[질의응답]"+notificationVO.getNotificationMsg());
		}
		return result;
	}
	
	//강의가 등록되었을떄 알림 발생
	public int setLecture(String lectureName) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationMsg(lectureName);
		notificationVO.setNotificationKind(6);
		//for문 돌려서 디비에서 권한정보 빼와서 직원인 멤버만 recipient에 넣어준다
		MemberVO memberVO = new MemberVO();
		//category가 1이 직원
		memberVO.setCategory(1);
		List<MemberVO> ar =  notificationDAO.getAdministratorList(memberVO);
		for(MemberVO memberVO2:ar) {
			notificationVO.setRecipient(memberVO2.getUsername());
			result = notificationDAO.setNotification(notificationVO);
			String username = memberVO2.getUsername().toString();
			String destication = "/queue/notification";
			String message = "[강의실배정]"+notificationVO.getNotificationMsg();
			messagingTemplate.convertAndSendToUser(username, message, message);
		}
		
		return result;
	}

}
