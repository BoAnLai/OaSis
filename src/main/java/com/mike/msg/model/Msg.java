package com.mike.msg.model;

import com.google.gson.Gson;

public class Msg {

	private String recipient;
	private String type;
	private String content;
	
	public static final String TYPE_REGULAR_APPLY_FOR_COMPANY = "applyForCompany";
	public static final String TYPE_GAME_SUBSCRIBE_NOTIFY = "gameSubs";
	
	public Msg() {
		super();
	};
	
	public Msg(String recipient,String type, String content) {
		this.setRecipient(recipient);
		this.setType(type);
		this.setContent(content);
	}
	
	
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		String outputStr = "Msg: [";		
		outputStr += "\r recupient="+ this.getRecipient();
		outputStr += "\r type="+ this.getType();
		outputStr += "\r content="+ this.getContent();
		outputStr += "]\r\r";
		return outputStr;
	}
	
	public static void main(String args[]) {
		
		Msg msg = new Msg("mike","Greeting" ,"hello mike");
		
		Gson gson = new Gson();
		String str = gson.toJson(msg);
		
		System.out.println(msg);
		System.out.println("===");
		System.out.println(str);
		
	}
	
}
