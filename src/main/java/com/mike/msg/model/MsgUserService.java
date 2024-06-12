package com.mike.msg.model;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.mike.tool.JedisTool;
import com.mike.user.model.UserService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

public class MsgUserService {

	private Gson gson;
	private Jedis jedis;
	
	public MsgUserService() {
		this.gson =new Gson();
		this.jedis = JedisTool.getJedisPool().getResource();
	}
	
	
	public void regularApplyForCompany(Integer userId) {
		
		MsgAdminService msgAdminSvc = new MsgAdminService();
		UserService userSvc = new UserService();
		
		String str = "user: ";
		str += userId;
		str += " (";
		str += userSvc.getByUserId(userId).getUserEmail();
		str += ")申請廠商身份";
		
		msgAdminSvc.addAdminMsg(Msg.TYPE_REGULAR_APPLY_FOR_COMPANY,str);
	}
	
	
	public List<String> getExistingRedisKeyForOneUser(int userId){
		
		String keyPattern = "user:" + userId + ":*";
		ScanParams params = new ScanParams().match(keyPattern);
		
		String cursor = ScanParams.SCAN_POINTER_START;
		
		List<String> keys = new ArrayList<String>();
		do {
            ScanResult<String> scanResult = jedis.scan(cursor, params);
            cursor = scanResult.getStringCursor();
            keys.addAll(scanResult.getResult());
        } while (!ScanParams.SCAN_POINTER_START.equals(cursor));
		
		return keys;
	}
	
	
	public List<Msg> getMsgListByRedisKeyForOneUser(int userId, String redisKey) {
		
		List<Msg> msgList = new ArrayList<Msg>();
		List<String> msgInJsonStringList = new ArrayList<String>();
		
		msgInJsonStringList = jedis.lrange(redisKey, 0, -1);
		for(String msgInJsonString:msgInJsonStringList) {
			msgList.add(gson.fromJson(msgInJsonString, Msg.class));
		}
		return msgList;
	}
	
	
	public void addMsgForOneUser(int userId, String type ,String content) {
		String msgRecipient = "user " + userId;
		String keyForRedis = "user:" + userId +":"+type;
		
		String msg = gson.toJson(new Msg(msgRecipient, type, content));
		jedis.rpush(keyForRedis, msg);
	}
	
	
//	public void addMsgWhenGameSubsTriggered(List<Integer> userIdList, ) {
//		
//		for(int userId:userIdList) {
//			
//			addMsgForOneUser(userId,Msg.TYPE_GAME_SUBSCRIBE_NOTIFY)
//		}
//		
//	}
	
	
	
	
	public static void main(String args[]) {
		MsgUserService msgUserSvc = new MsgUserService();
		
//		msgUserSvc.regularApplyForCompany(7);
		
		msgUserSvc.addMsgForOneUser(1,Msg.TYPE_GAME_SUBSCRIBE_NOTIFY,"78行的方法");
		msgUserSvc.addMsgForOneUser(1,"subsArt","79行的方法");
		msgUserSvc.addMsgForOneUser(1,"subsGame","80行的方法");
		
		List<String> keys = msgUserSvc.getExistingRedisKeyForOneUser(1);
		for(String key:keys) {
			
			System.out.println("==========");
			System.out.print("key: ");
			System.out.println(key);
			
			List<Msg> msgList = msgUserSvc.getMsgListByRedisKeyForOneUser(1,key);
			for(Msg msg : msgList) {
				System.out.println(msg);
			}
		}
		
		System.out.println("main executed!");
	}
}
