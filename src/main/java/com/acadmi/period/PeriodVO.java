package com.acadmi.period;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PeriodVO {
	
	private Integer year;
	private Integer semester;
	private Date applicationStart;
	private Date applicationEnd;
	private Date favoriteStart;
	private Date favoriteEnd;
	private Date deadline;
	
}