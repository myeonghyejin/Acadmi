package com.acadmi.member;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
class MemberTest {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	

	@Test
	void test() {
		String result = passwordEncoder.encode("yang1234");
		System.out.println("result {}" + result);
	}

}
