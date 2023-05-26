package com.acadmi.member;

import java.security.SecureRandom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import com.acadmi.administrator.AdminIstratorDAO;
import com.acadmi.administrator.AdminIstratorVO;
import com.acadmi.util.MailManager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService{
	
//	Member
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MailManager mailManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
		return memberDAO.getLogin(memberVO);
	}
	
	public MemberVO getMyPage(MemberVO memberVO) throws Exception {
		
		memberVO = memberDAO.getLogin(memberVO);
		
		return memberVO;
	}
	
	public int setLogout(MemberVO memberVO) throws Exception{
		return memberDAO.setLogout(memberVO);
	}
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.error("============Spring Security Login============");
		log.error("====================={}=====================", username);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		try {
			memberVO = memberDAO.getLogin(memberVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberVO;
	}
	
	public int setJoin(MemberVO memberVO) throws Exception{
		//memberVO.setEnabled(true);
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		
		int result = memberDAO.setJoin(memberVO);
		Map<String, Object> map = new HashMap<>();
		map.put("username", memberVO.getUsername());
		map.put("num", 1);
		result = memberDAO.setRoleAdd(map);
		return result;
	}
	
	public boolean getFindPw(MemberVO memberVO, BindingResult bindingResult) throws Exception {
		boolean result = false;
		
		result = bindingResult.hasErrors();
		log.error("=========== result1 : {} ===========", result);

		if(memberDAO.getFindPw(memberVO) != null) {
			String charaters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			SecureRandom random = new SecureRandom();
			StringBuffer sb = new StringBuffer(6);
			for(int i = 0;i<6;i++) {
				sb.append(charaters.charAt(random.nextInt(charaters.length())));
			}
			String password = sb.toString();
			mailManager.send(memberVO.getEmail(), "임시 비밀번호 입니다", "임시비밀번호는 " + password + "입니다.");
			memberVO.setPassword(passwordEncoder.encode(password));
			memberDAO.setPwUpdate(memberVO);
			log.error("=========== result2 : {} ===========", result);

		} else {
			bindingResult.rejectValue("email", "member.username.email");
			result = true;
			log.error("=========== result3 : {} ===========", result);

			
		}
		
		return result;
		
	}
	
//	======================================================================================================================
	
	public AdminIstratorVO getStudent(MemberVO memberVO) throws Exception {
		
		return memberDAO.getStudent();
	}
	
	public AdminIstratorVO getProfessor(MemberVO memberVO) throws Exception {
		
		return memberDAO.getProfessor();
	}
	
	public AdminIstratorVO getAdminIstrator(MemberVO memberVO) throws Exception {
		
		return memberDAO.getAdminIstrator();
	}
	
	public AdminIstratorVO setStudent(MemberVO memberVO) throws Exception {
		
		return memberDAO.setStudent();
	}
	
	public AdminIstratorVO setProfessor(MemberVO memberVO) throws Exception {
		
		return memberDAO.setProfessor();
	}
	
	public AdminIstratorVO setAdminIstrator(MemberVO memberVO) throws Exception {
		
		return memberDAO.setAdminIstrator();
	}
	
}
