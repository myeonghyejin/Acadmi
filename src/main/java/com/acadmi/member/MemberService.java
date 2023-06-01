package com.acadmi.member;

import java.security.SecureRandom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.acadmi.administrator.AdministratorDAO;
import com.acadmi.administrator.AdministratorVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.FileManager;
import com.acadmi.util.FileVO;
import com.acadmi.util.MailManager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService{
	
//	Member
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Value("${app.upload.member}")
	private String path;
	
	@Autowired
	private MailManager mailManager;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
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
	
	public DepartmentVO getStudent(StudentVO studentVO, MultipartFile multipartFile) throws Exception {
		
		return memberDAO.getStudent(studentVO);
	}
	
	public DepartmentVO getProfessor(ProfessorVO professorVO, MultipartFile multipartFile) throws Exception {
		
		return memberDAO.getProfessor(professorVO);
	}

	public DepartmentVO getAdministrator(AdministratorVO administratorVO, MultipartFile multipartFile) throws Exception {
	
		return memberDAO.getAdministrator(administratorVO);
	}
	
	
//	======================================================================================================================
	
	
	public MemberVO setStudentUpdate(StudentVO studentVO, MultipartFile multipartFile) throws Exception{
		MemberVO memberVO = memberDAO.setStudentUpdate(studentVO);
		
		if(multipartFile != null) {
			
			if(!multipartFile.isEmpty()) {
				String fileName = fileManager.saveFile(path, multipartFile);
				MemberFilesVO memberFilesVO = new MemberFilesVO();
				memberFilesVO.setUsername(studentVO.getUsername());
				memberFilesVO.setFileName(fileName);
				memberFilesVO.setOriName(multipartFile.getOriginalFilename());
				
				memberVO = memberDAO.setFileUpdate(memberFilesVO);
			}
		}
		return memberVO;		
		    
	}
	
	public MemberVO setProfessorUpdate(ProfessorVO professorVO, MultipartFile multipartFile) throws Exception{
		return memberDAO.setProfessorUpdate(professorVO);
	}
	
	public MemberVO setAdministratorUpdate(AdministratorVO administratorVO, MultipartFile multipartFile) throws Exception{
		return memberDAO.setAdministratorUpdate(administratorVO);
	}
	
}
