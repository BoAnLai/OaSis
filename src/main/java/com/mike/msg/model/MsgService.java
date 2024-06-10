package com.mike.msg.model;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.mike.tool.JedisTool;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

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
	
	public List<String> getMsgListForOneUser(int userId) {
		
		String keyPattern = "user:" + userId + ":*";
		ScanParams params = new ScanParams().match(keyPattern);
		
		String cursor = ScanParams.SCAN_POINTER_START;
		
		List<String> keys = new ArrayList<String>();
		do {
            ScanResult<String> scanResult = jedis.scan(cursor, params);
            cursor = scanResult.getStringCursor();
            keys.addAll(scanResult.getResult());
        } while (!ScanParams.SCAN_POINTER_START.equals(cursor));
		
		List<String> msgList = new ArrayList<String>();
		List<String> tempMsgList = new ArrayList<String>();
		for(String key:keys) {
			tempMsgList = jedis.lrange(key, 0, -1);
			for(String msg:tempMsgList) {
				msgList.add(msg);
			}
		}
		return msgList;
	}
	
	
	public static void main(String args[]) {
		MsgService msgSvc = new MsgService();
		
		msgSvc.jedis.lpush("user:4:info", "4info","4info","4info","4info");
		msgSvc.jedis.lpush("user:4:info", "4info2");
		msgSvc.jedis.lpush("user:4:data", "4data");
		msgSvc.jedis.lpush("user:4:head", "4head");
		
		System.out.println(msgSvc.getMsgListForOneUser(4));
	}
}
