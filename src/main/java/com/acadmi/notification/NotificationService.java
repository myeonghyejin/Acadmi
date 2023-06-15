package com.acadmi.notification;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;

import com.acadmi.administrator.AdministratorVO;
import com.acadmi.board.lectureNotice.LectureNoticeVO;
import com.acadmi.board.lectureQna.LectureQnaVO;
import com.acadmi.board.notice.NoticeVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.board.qna.QnaVO;
import com.acadmi.student.StudentVO;
import com.acadmi.student.lecture.StudentLectureVO;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class NotificationService {
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	//전체 알림 list
	public List<NotificationVO> getnotificationist(NotificationVO notificationVO, HttpSession session) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = (Authentication)contextImpl.getAuthentication();
		notificationVO.setRecipient(authentication.getName());
		notificationVO.setNotificationStatus(0);
		return notificationDAO.getnotificationist(notificationVO);
	}
	
	//kind에 따른 새 알림 list
	public List<NotificationVO> getnotificationKindList(NotificationVO notificationVO, HttpSession session) throws Exception {
		Enumeration<String> names = session.getAttributeNames();
		Object ojt = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)ojt;
		Authentication authentication = (Authentication) contextImpl.getAuthentication();
		notificationVO.setRecipient(authentication.getName());
		return notificationDAO.getnotificationKindList(notificationVO);
	}
	
	//kind에 따른 알림 list
	public List<NotificationVO> getKindList(NotificationVO notificationVO, HttpSession session) throws Exception {
		Enumeration<String> names = session.getAttributeNames();
		log.info("========{}", names.nextElement());
		Object ojt = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)ojt;
		Authentication authentication = (Authentication) contextImpl.getAuthentication();
		notificationVO.setRecipient(authentication.getName());
		return notificationDAO.getKindList(notificationVO);
	}
	
	//member 모두가 받을 수 있음
	//중요 공지사항이 등록외었을때 알림발생
	public int setIptNotice(NoticeVO noticeVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationMsg("[공지]"+noticeVO.getTitle());
		//kind가 1은 공지사항
		notificationVO.setNotificationKind(1);
		//공지사항의 글번호
		notificationVO.setNum(noticeVO.getNum());
		List<MemberVO> ar = notificationDAO.getMemberList();
		for(MemberVO memberVO:ar) {
			notificationVO.setRecipient(memberVO.getUsername());
			result = notificationDAO.setNotification(notificationVO);
		}
		
		return result;
	}
	
	//직원(administratop)의 알림 : 질의응답, 강의 등록
	//질의응답이 등록되었을때 알림발생
	public int setQna(QnaVO qnaVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationMsg("[질의응답]"+qnaVO.getTitle());
		// kind가 2번은 질의응답 등록
		notificationVO.setNotificationKind(2);
		//질의응답의 글번호
		notificationVO.setNum(qnaVO.getNum());
		//for문 돌려서 디비에서 CATEGORY가 직원인 멤버만 recipient에 넣어준다
		List<AdministratorVO> administrators = notificationDAO.getAdministratorList();
		for(AdministratorVO administrator:administrators) {
			MemberVO memberVO = new MemberVO();
			memberVO.setUsername(qnaVO.getWriter());
			StudentVO student = notificationDAO.getStudentDetail(memberVO);
			//잘의응답 작성자(sender)의 학과와 뽑아온 멤버의 학과가 같을때 recipient에 넣어주고 저장 후 알림 보내기
			if(student != null) {
				if(student.getDeptNum()==administrator.getDeptNum()) {
					notificationVO.setRecipient(administrator.getUsername());
					result = notificationDAO.setNotification(notificationVO);
				}
			} else {
				ProfessorVO professor = notificationDAO.getProfessorDetail(memberVO);
				if(professor.getDeptNum()==administrator.getDeptNum()) {
					notificationVO.setRecipient(administrator.getUsername());
					result = notificationDAO.setNotification(notificationVO);
				}
			}
			
		}
		return result;
	}
	
	//강의가 등록되었을떄 알림 발생
	public int setLecture(LectureVO lectureVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationMsg("[강의등록]"+lectureVO.getLectureName());
		//kind가 7은 강의등록
		notificationVO.setNotificationKind(7);
		//강의의 강의번호
		notificationVO.setLectureNum(lectureVO.getLectureNum());
		//for문 돌려서 디비에서 CATEGORY가 직원인 멤버만 recipient에 넣어준다
		List<AdministratorVO> administrators =  notificationDAO.getAdministratorList();
		for(AdministratorVO administrator:administrators) {
			//직원과 강의 교수의 학과가 일치할때 알림 등록, 전송
			ProfessorVO professorVO = new ProfessorVO();
			professorVO.setUsername(lectureVO.getUsername());
			professorVO = notificationDAO.getProfessorDetail(professorVO);
			if(professorVO.getDeptNum()==administrator.getDeptNum()) {
				notificationVO.setRecipient(administrator.getUsername());
				result = notificationDAO.setNotification(notificationVO);		
			}
		}
		return result;
	}
	
	//교수(professor)의 알림 : 질의응답 답글, 강의 질의응답
	//질의응답 답글
	public int setQnaReply(QnaVO qnaVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationMsg("[답글]"+qnaVO.getTitle());
		//kind가 3은 질의응답 답글
		notificationVO.setNotificationKind(3);
		//질의응답 답글의 글번호
		notificationVO.setNum(qnaVO.getNum());
		//qna의 원글을 따와서 작성자를 recipient에 넣어준다 답글의 ref가 원글의 글번호
		qnaVO.setNum(qnaVO.getRef());
		qnaVO = notificationDAO.getOriginalQna(qnaVO);
		notificationVO.setRecipient(qnaVO.getWriter());
		result = notificationDAO.setNotification(notificationVO);
		return result;
	}
	
	//강의 질의응답
	public int setLectureQna(LectureQnaVO lectureQnaVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLectureNum(lectureQnaVO.getLectureNum());
		lectureVO = notificationDAO.getLecture(lectureVO);
		notificationVO.setNotificationMsg("["+lectureVO.getLectureName()+"]"+lectureQnaVO.getTitle());
		////kind가 5는 강의 질의응답
		notificationVO.setNotificationKind(5);
		//강의 질의응답의 글번호
		notificationVO.setNum(lectureQnaVO.getNum());
		//recipient는 강의의 교수(username)
		notificationVO.setRecipient(lectureVO.getUsername());
		result = notificationDAO.setNotification(notificationVO);
		return result;
	}
	
	//학생(student)의 알림 : 강의 공지사항, 질의응답 답글, 강의 질의응답 답글
	//강의 공지사항
	public int setLectureNotice(LectureNoticeVO lectureNoticeVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLectureNum(lectureNoticeVO.getLectureNum());
		lectureVO = notificationDAO.getLecture(lectureVO);
		notificationVO.setNotificationMsg("["+lectureVO.getLectureName()+"]"+lectureNoticeVO.getTitle());
		//kind가 4는 강의 공지사항
		notificationVO.setNotificationKind(4);
		//강의 공지사항의 글번호
		notificationVO.setNum(lectureNoticeVO.getNum());
		//수강강의에 강의 번호를 가지고있는 학생(username)들을 recipient에 넣는다
		List<StudentLectureVO> ar = notificationDAO.getStudentLectureList(lectureVO);
		for(StudentLectureVO student_lectureVO:ar) {
			notificationVO.setRecipient(student_lectureVO.getUsername());
			result = notificationDAO.setNotification(notificationVO);
		}
		return result;
	}
	
	//강의 질의응답 답글
	public int setLectureQnaReply(LectureQnaVO lectureQnaVO) throws Exception {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLectureNum(lectureQnaVO.getLectureNum());
		lectureVO = notificationDAO.getLecture(lectureVO);
		notificationVO.setNotificationMsg("["+lectureVO.getLectureName()+"]"+lectureQnaVO.getTitle());
		//kind가 6은 강의 질의응답 답글
		notificationVO.setNotificationKind(6);
		//강의 질의응답 답글의 글번호
		notificationVO.setNum(lectureQnaVO.getNum());
		//lectureQna의 원글을 따와서 작성자를 recipient에 넣는다 답글의 ref가 원글의 글번호
		lectureQnaVO.setNum(lectureQnaVO.getRef());
		lectureQnaVO = notificationDAO.getOriginalLectureQna(lectureQnaVO);
		notificationVO.setRecipient(lectureQnaVO.getWriter());
		result = notificationDAO.setNotification(notificationVO);
		return result;
	}
	
	//읽은 알림 삭제
	public int setDelete(NotificationVO notificationVO) throws Exception {
		if(notificationDAO.getDetail(notificationVO).getNotificationStatus() == 2) {
			return 1;
		}
		return notificationDAO.setDelete(notificationVO);
	}
	
	//글이 삭제되었을때 알림도 삭제
	public int setBoardNotificationDelete(NotificationVO notificationVO) throws Exception {
		return notificationDAO.setBoardNotificationDelete(notificationVO);
	}
	
	//알림 저장 처리
	public int setNotificationStatus(NotificationVO notificationVO) throws Exception {
		return notificationDAO.setNotificationSave(notificationVO);
	}
	

}
