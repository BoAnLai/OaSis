package com.mike.msg.model;

import com.google.gson.Gson;

public class Msg {

	private String recipient;
	private String content;
	
	public Msg() {
		super();
	};
	
	public Msg(String recipient, String content) {
		this.setRecipient(recipient);
		this.setContent(content);
	}
	
	
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
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
		outputStr += "\r content="+ this.getContent();
		outputStr += "]\r\r";
		return outputStr;
	}
	
	public static void main(String args[]) {
		
		Msg msg = new Msg("mike", "hello mike");
		
		Gson gson = new Gson();
		String str = gson.toJson(msg);
		
		System.out.println(msg);
		System.out.println("===");
		System.out.println(str);
		
	}
	
}
