package com.acadmi.util;

import java.time.LocalDate;

public class DateUtils {
	
	public static int calculateCurrentYear() {
		LocalDate currentDate = LocalDate.now();
		int year = currentDate.getYear();
		return year;
	}
	
	public static int calculateCurrentSemester() {
		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();
		int semester;
		
		//1학기인지 2학기인지 판단
	    if (month >= 2 && month <= 7) {
	        semester = 1; //2월부터 7월까지는 1학기
	    } else {
	    	semester = 2; //8월부터 1월까지는 2학기
	    }
	    
	    return semester;
		
	}

}
