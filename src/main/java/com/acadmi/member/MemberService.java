package com.acadmi.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.acadmi.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
		return memberDAO.getLogin(memberVO);
	}
	
	public MemberVO getMyPage(MemberVO memberVO)throws Exception{
		return memberDAO.getLogin(memberVO);
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
	
}
