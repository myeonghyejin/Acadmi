package com.acadmi.notification;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.administrator.AdminIstratorController;
import com.acadmi.administrator.AdministratorVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.board.lectureQna.LectureQnaVO;
import com.acadmi.board.qna.QnaVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.student.StudentVO;
import com.acadmi.student.Student_lectureVO;

@Mapper
public interface NotificationDAO {
	
	//kind에 따른 알림 list
	public List<NotificationVO> getKindList(NotificationVO notificationVO) throws Exception;
	
	//알림 저장
	public int setNotification(NotificationVO notificationVO) throws Exception;
	
	//알림 보낼 전체 멤버list 출력
	public List<MemberVO> getMemberList() throws Exception;
	
	//알림 보낼 직원 멤버list 출력
	public List<AdministratorVO> getAdministratorList() throws Exception;
	
	//교수 정보를 가져오는 detail
	public ProfessorVO getProfessorDetail(MemberVO memberVO) throws Exception;
	
	//학생 정보를 가져오는 detail
	public StudentVO getStudentDetail(MemberVO memberVO) throws Exception;
	
	//qna의 원글을 가져오는 것
	public QnaVO getOriginalQna(QnaVO qnaVO) throws Exception;
	
	//강의 정보를 가져오는 것
	public LectureVO getLecture(LectureVO lectureVO) throws Exception;
	
	//수강 강의 정보를 가져오는 List
	public List<Student_lectureVO> getStudentLectureList(LectureVO lectureVO) throws Exception;
	
	//lectureQna의 원글을 가져오는 것
	public LectureQnaVO getOriginalLectureQna(LectureQnaVO lectureQnaVO) throws Exception;

}
