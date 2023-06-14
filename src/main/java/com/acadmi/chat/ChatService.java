package com.acadmi.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;

import com.acadmi.administrator.AdministratorVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;
import com.acadmi.webSocket.ChatWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	//새로운 메세지 출력
	public List<ChatRoomVO> getChatList(ChatRoomVO chatRoomVO, HttpSession session) throws Exception {
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication = contextImpl.getAuthentication();
		chatRoomVO.setRoomSender(authentication.getName());
		return chatDAO.getChatList(chatRoomVO);
	}
	
	//채팅방 목록 list
	public List<ChatRoomVO> getChatRoomList(Pagination pagination, HttpSession session) throws Exception {
		Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		Authentication authentication= contextImpl.getAuthentication();
		pagination.setUsername(authentication.getName());
		return chatDAO.getChatRoomList(pagination);
	}
	
	//채팅방 메세지 출력
	public ChatRoomVO getChatRoom(ChatRoomVO chatRoomVO) throws Exception {
		int result = 0;
		ChatMessageVO chatMessageVO = new ChatMessageVO();
		String sender = chatRoomVO.getRoomSender();
		String recipient = chatRoomVO.getRoomRecipient();
		chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
		
		//처음 채팅할때
		if(chatRoomVO == null) {
			chatRoomVO = new ChatRoomVO();
			MemberVO memberVO = new MemberVO();
			
			//sender의 이름 출력
			memberVO.setUsername(sender);
			memberVO = chatDAO.getMemberDetail(memberVO);
			if(memberVO.getCategory()==0) {
				AdministratorVO administratorVO = chatDAO.getAdministratorName(memberVO);
				chatRoomVO.setSenderName(administratorVO.getName());
				
			} else if(memberVO.getCategory()==1) {
				ProfessorVO professorVO = chatDAO.getProfessorName(memberVO);
				chatRoomVO.setSenderName(professorVO.getName());
			} else {
				StudentVO studentVO = chatDAO.getStudentName(memberVO);
				chatRoomVO.setSenderName(studentVO.getName());
			}
			
			//recipient의 이름 출력
			memberVO.setUsername(recipient);
			memberVO = chatDAO.getMemberDetail(memberVO);
			if(memberVO.getCategory()==0) {
				AdministratorVO administratorVO = chatDAO.getAdministratorName(memberVO);
				chatRoomVO.setRecipientName(administratorVO.getName());
			} else if(memberVO.getCategory()==1) {
				ProfessorVO professorVO = chatDAO.getProfessorName(memberVO);
				chatRoomVO.setRecipientName(professorVO.getName());
			} else {
				StudentVO studentVO = chatDAO.getStudentName(memberVO);
				chatRoomVO.setRecipientName(studentVO.getName());
			}
			chatRoomVO.setRoomSender(sender);
			chatRoomVO.setRoomRecipient(recipient);
			result = chatDAO.setSenderChatRoom(chatRoomVO);
			chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
			chatMessageVO.setChatNum(chatRoomVO.getChatNum());
			chatMessageVO.setMsgContents(recipient+"님을 초대했습니다");
			chatMessageVO.setMsgStatus(2);
			result = chatDAO.setSaveMessage(chatMessageVO);
			result = chatDAO.setRecipientChatRoom(chatRoomVO);
			ChatRoomVO recipientChatRoom = new ChatRoomVO();
			recipientChatRoom.setRoomSender(recipient);
			recipientChatRoom.setRoomRecipient(sender);
			recipientChatRoom = chatDAO.getChatRoom(recipientChatRoom);
			chatMessageVO.setChatNum(recipientChatRoom.getChatNum());
			chatMessageVO.setMsgContents(sender+"님이 당신을 초대했습니다");
			result = chatDAO.setSaveMessage(chatMessageVO);
		}
		//상대방이 채팅방을 나갔을때
		ChatRoomVO yourChatRoomVO = new ChatRoomVO();
		yourChatRoomVO.setRoomSender(recipient);
		yourChatRoomVO.setRoomRecipient(sender);
		yourChatRoomVO = chatDAO.getChatRoom(yourChatRoomVO);
		if(yourChatRoomVO==null) {
			return chatDAO.getChatRoom(chatRoomVO);
		}
		
		//정상적인 상황
		chatRoomVO.setChatStatus(1);
		result = chatDAO.setChatRoomUpdate(chatRoomVO);
		chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		result = chatDAO.setMyChatMessageUpdate(chatMessageVO);
		chatMessageVO.setChatNum(yourChatRoomVO.getChatNum());
		result = chatDAO.setYourChatMessageUpdate(chatMessageVO);
		
		return chatDAO.getChatRoom(chatRoomVO);
	}
	
	//나간 상대 다시 초대
	public int setInviteChat(ChatRoomVO chatRoomVO) throws Exception {
		String sender = chatRoomVO.getRoomSender();
		String recipient = chatRoomVO.getRoomRecipient();
		MemberVO memberVO = new MemberVO();
		
		//sender의 이름 출력
		memberVO.setUsername(sender);
		memberVO = chatDAO.getMemberDetail(memberVO);
		if(memberVO.getCategory()==0) {
			AdministratorVO administratorVO = chatDAO.getAdministratorName(memberVO);
			chatRoomVO.setSenderName(administratorVO.getName());
			
		} else if(memberVO.getCategory()==1) {
			ProfessorVO professorVO = chatDAO.getProfessorName(memberVO);
			chatRoomVO.setSenderName(professorVO.getName());
		} else {
			StudentVO studentVO = chatDAO.getStudentName(memberVO);
			chatRoomVO.setSenderName(studentVO.getName());
		}
		
		//recipient의 이름 출력
		memberVO.setUsername(recipient);
		memberVO = chatDAO.getMemberDetail(memberVO);
		if(memberVO.getCategory()==0) {
			AdministratorVO administratorVO = chatDAO.getAdministratorName(memberVO);
			chatRoomVO.setRecipientName(administratorVO.getName());
		} else if(memberVO.getCategory()==1) {
			ProfessorVO professorVO = chatDAO.getProfessorName(memberVO);
			chatRoomVO.setRecipientName(professorVO.getName());
		} else {
			StudentVO studentVO = chatDAO.getStudentName(memberVO);
			chatRoomVO.setRecipientName(studentVO.getName());
		}
		int result = chatDAO.setRecipientChatRoom(chatRoomVO);
		ChatMessageVO chatMessageVO = new ChatMessageVO();
		chatRoomVO=chatDAO.getChatRoom(chatRoomVO);
		chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		chatMessageVO.setMsgStatus(2);
		chatMessageVO.setMsgContents(recipient+"님을 다시 초대했습니다.");
		result = chatDAO.setSaveMessage(chatMessageVO);
		chatRoomVO.setRoomSender(recipient);
		chatRoomVO.setRoomRecipient(sender);
		chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
		chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		chatMessageVO.setMsgContents(sender+"님이 당신을 초대했습니다.");
		result = chatDAO.setSaveMessage(chatMessageVO);
		return result;
	}
	
	//메세지 저장
	public int setSaveMessage(ChatMessageVO chatMessageVO) throws Exception {
		int result = chatDAO.setSaveMessage(chatMessageVO);
		
		return result;
	}
	
	//채팅방 나가기
	public int setChatRoomDelete(ChatRoomVO chatRoomVO) throws Exception {
		int result = chatDAO.setChatRoomDelete(chatRoomVO);
		String sender = chatRoomVO.getRoomSender();
		String recipient = chatRoomVO.getRoomRecipient();
		chatRoomVO.setRoomSender(recipient);
		chatRoomVO.setRoomRecipient(sender);
		chatRoomVO = chatDAO.getChatRoom(chatRoomVO);
		if(chatRoomVO==null) {
			return result;
		}
		chatRoomVO.setChatStatus(2);
		result = chatDAO.setChatRoomUpdate(chatRoomVO);
		ChatMessageVO chatMessageVO = new ChatMessageVO();
		chatMessageVO.setChatNum(chatRoomVO.getChatNum());
		chatMessageVO.setMsgStatus(2);
		chatMessageVO.setMsgContents("상대방이 나갔습니다.");
		result = chatDAO.setSaveMessage(chatMessageVO);
		return result;
	}
	
	//메세지 삭제
	public int setDeleteMessage(ChatMessageVO chatMessageVO) throws Exception {
		return chatDAO.setDeleteMessage(chatMessageVO);
	}
	

}
