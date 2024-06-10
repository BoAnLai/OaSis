package com.lee.chatter.model;

import java.util.Set;

/*
 * 不能稱為Entity，沒有對應到任何的資料庫
 * 只為了暫時存放零碎的資料(例如兩個表格的某些欄位，要做get,set)，又稱DTO,POJO
 * DTO:Data Transfer Object
 */
public class StateDTO {
	
	private String type;//like action
	
	private String userName;//誰上線了
	
	private Set<String> users;//線上所有使用者的名稱
	
	public StateDTO() {}
	
	public StateDTO(String type,String userName,Set<String> users) {		
		super();
		this.type=type;
		this.userName=userName;
		this.users=users;	
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Set<String> getUsers() {
		return users;
	}



	public void setUsers(Set<String> users) {
		this.users = users;
	}
	
	

}
