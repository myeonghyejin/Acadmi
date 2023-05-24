package com.acadmi.notification;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NotificationVO {
	
	private Long notificationNum;
	private String recipient;
	private String sender;
	private String notificationMsg;
	private Date notificationDate;
	private Integer notificationStatus;
	private Integer notificationKind;

}
