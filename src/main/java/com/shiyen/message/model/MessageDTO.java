package com.shiyen.message.model;

import java.sql.Timestamp;

public class MessageDTO {
	private String userNickname;
	private String messageContent;
	private Timestamp messageTimestamp;
	
	public MessageDTO(){};
	
	public MessageDTO(String userNickname,String messageContent,Timestamp messageTimestamp){
		this.userNickname = userNickname;
		this.messageContent = messageContent;
		this.messageTimestamp = messageTimestamp;
		
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Timestamp getMessageTimestamp() {
		return messageTimestamp;
	}

	public void setMessageTimestamp(Timestamp messageTimestamp) {
		this.messageTimestamp = messageTimestamp;
	}
	
}
