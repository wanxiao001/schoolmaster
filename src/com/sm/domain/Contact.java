package com.sm.domain;

import java.util.Date;

public class Contact {
	private long id;
	private long userId;       //用户ID
	private long uuerId;       //预约人ID
	private Date contactTime;  //预约时间
	private String contacter;   //预约人
	private String QQ;
	private String email;
	private String message;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	public long getUuerId() {
		return uuerId;
	}
	public void setUuerId(long uuerId) {
		this.uuerId = uuerId;
	}
	public Date getContactTime() {
		return contactTime;
	}
	public void setContactTime(Date contactTime) {
		this.contactTime = contactTime;
	}
	public String getContacter() {
		return contacter;
	}
	public void setContacter(String contacter) {
		this.contacter = contacter;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
