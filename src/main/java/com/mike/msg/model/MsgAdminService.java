package com.mike.msg.model;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.mike.tool.JedisTool;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

public class MsgAdminService {

	private Gson gson;
	private Jedis jedis;
	
	public MsgAdminService() {
		this.gson =new Gson();
		this.jedis = JedisTool.getJedisPool().getResource();
	}
	
	public void addAdminMsg(String type, String content) {
		String msg = gson.toJson(new Msg("ADMIN",type, content));
		String redisKey = "user:admin:" + type;
		
		jedis.rpush(redisKey, msg);
	};
	
	
	public List<Msg> getMsgListForAdmin(String type){
		
		String redisKey = "user:admin" + type;
		
		List<String> list = jedis.lrange(redisKey, 0, -1);
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
}
