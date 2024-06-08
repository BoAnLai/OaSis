package com.lee.chatter.model;

import java.util.Date;

public class ChatMessage {
	private String type;
	private String sender;
	private String receiver;
	private String message;
	private String time;
	/*想加入甚麼狀態請寫在這邊*/

	public ChatMessage(String type, String sender, String receiver, String message) {
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
	}
	


	public ChatMessage(String type, String sender, String receiver, String message, String time) {
		super();
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.time = time;
	}



	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}
	
	

	
	
	
}
