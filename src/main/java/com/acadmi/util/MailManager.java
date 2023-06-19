package com.acadmi.util;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


import lombok.extern.slf4j.Slf4j;

@Component
public class MailManager {
	
	@Value("${spring.mail.username}")
	private String sender;

	@Autowired
	private JavaMailSender javaMailSender; 
	
	public void send(String email, String title, String text) throws Exception {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		mimeMessage.setFrom(sender);
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));
		mimeMessage.setSubject(title);
		mimeMessage.setText(text,"UTF-8","html");
		javaMailSender.send(mimeMessage);
	}

}