package com.acadmi.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acadmi.administrator.AdministratorVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;

@Mapper
public interface ChatDAO {
	
		//select
	
	//채팅방 목록 list
	public List<ChatRoomVO> getChatRoomList(Pagination pagination) throws Exception;
	
	//채팅방 메세지 출력
	public ChatRoomVO getChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	
	//이름 뽑아오기 위한 select
	public MemberVO getMemberDetail(MemberVO memberVO) throws Exception;
	
	public AdministratorVO getAdministratorName(MemberVO memberVO) throws Exception;
	
	public ProfessorVO getProfessorName(MemberVO memberVO) throws Exception;
	
	public StudentVO getStudentName(MemberVO memberVO) throws Exception;
	
	//새 매세지 표시를 위한 select
	public List<ChatRoomVO> getChatList(ChatRoomVO chatRoomVO) throws Exception;
	
	//파일 저장
	public int setChatFileAdd(ChatFilesVO chatFilesVO) throws Exception;
	
	//msgNum을 뽑아오는 쿼리
	public Long getMsgNum(Long chatNum) throws Exception;
	
		//insert
	
	//채팅방 생성
	//내 채팅방
	public int setSenderChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	//상대 채팅방
	public int setRecipientChatRoom(ChatRoomVO chatRoomVO) throws Exception;

	//메세지 입력
	public int setSaveMessage(ChatMessageVO chatMessageVO) throws Exception;
	
		//update
	
	//채팅방 상태 변경
	public int setChatRoomUpdate(ChatRoomVO chatRoomVO) throws Exception;
	
	//내 채팅방 메세지 상태 변경
	public int setMyChatMessageUpdate(ChatMessageVO chatMessageVO) throws Exception;
	
	//상대 채팅방 메세지 상태 변경
	public int setYourChatMessageUpdate(ChatMessageVO chatMessageVO) throws Exception;
	
		//delete
	
	//채팅방 나가기
	public int setChatRoomDelete(ChatRoomVO chatRoomVO) throws Exception;
	
	//메세지 삭제
	public int setDeleteMessage(ChatMessageVO chatMessageVO) throws Exception;
	
}
