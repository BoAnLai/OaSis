package com.mike.msg.model;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.mike.tool.JedisTool;

import redis.clients.jedis.Jedis;

public class MsgService {

	private Gson gson;
	private Jedis jedis;
	
	public MsgService() {
		this.gson =new Gson();
		this.jedis = JedisTool.getJedisPool().getResource();
	}
	
	
	public void addAdminMsg(String content) {
		
		String msg = gson.toJson(new Msg("ADMIN", content));
		jedis.rpush("user:admin:applyForCompany", msg);
	};
	
	public void applyForCompany(Integer userId) {
		
		String str = "user: ";
		str += userId;
		str += " 申請廠商身分";
		
		addAdminMsg(str);
	}
	
	public List<Msg> getAdminMsg(){
		
		List<String> list = jedis.lrange("user:admin:applyForCompany", 0, -1);
		List<Msg> outputList = new ArrayList<Msg>();
		
		Msg msg = null;
		for(String str : list) {
			
			
			try {
				msg = gson.fromJson(str, Msg.class);
			}catch(JsonSyntaxException e) {
				msg = null;
			}
			
			
			outputList.add(msg);
		}
		
		return outputList;
	}
	
	public void removeMsgFromApplyForCompany(int index) {
		jedis.lset("user:admin:applyForCompany",index,"__DELETED__");
	}
	
	
//	public static void main(String args[]) {
//		MsgService msgSvc = new MsgService();
//		
//		msgSvc.applyForCompany(1);
//		msgSvc.applyForCompany(2);
//		
//		
//		msgSvc.getAdminMsg();
//	}
}
