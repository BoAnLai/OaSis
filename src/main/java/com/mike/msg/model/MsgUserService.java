package com.mike.msg.model;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
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
	
	
	public List<Msg> getMsgListByRedisKey(String redisKey) {
		
		List<String> msgInJsonStringList = jedis.lrange(redisKey, 0, -1);

		System.out.println("=== in getMsgListByRedisKey ===");
		
		List<Msg> msgList = new ArrayList<Msg>();
		Msg msg = null;
		
		
		for(String msgInJsonString:msgInJsonStringList) {
			try {
				msg = gson.fromJson(msgInJsonString, Msg.class);
			}catch(JsonSyntaxException e){
				msg = null;
			}
			msgList.add(msg);
		}
		
		System.out.println("=== end of getMsgListByRedisKey ===");
		
		return msgList;
	}
	
	
	public void addMsgForOneUser(int userId, String type ,String content) {
		String msgRecipient = "user " + userId;
		String keyForRedis = "user:" + userId +":"+type;
		
		String msg = gson.toJson(new Msg(msgRecipient, type, content));
		jedis.rpush(keyForRedis, msg);
	}
	
	public void removeMsgFromUser(int userId, int msgIndex, String type) {
		String redisKey = "user:" + userId + ":" + type;
		jedis.lset(redisKey,msgIndex,"__DELETED__");
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
		
		msgUserSvc.addMsgForOneUser(1,Msg.TYPE_GAME_SUBSCRIBE_NOTIFY,"222");
		msgUserSvc.addMsgForOneUser(1,Msg.TYPE_GAME_SUBSCRIBE_NOTIFY,"333");
		msgUserSvc.addMsgForOneUser(1,Msg.TYPE_GAME_SUBSCRIBE_NOTIFY,"444");
		msgUserSvc.addMsgForOneUser(1,Msg.TYPE_GAME_SUBSCRIBE_NOTIFY,"555");
		
//		List<String> keys = msgUserSvc.getExistingRedisKeyForOneUser(1);
//		for(String key:keys) {
//			
//			System.out.println("==========");
//			System.out.print("key: ");
//			System.out.println(key);
//			
//			List<Msg> msgList = msgUserSvc.getMsgListByRedisKeyForOneUser(1,key);
//			for(Msg msg : msgList) {
//				System.out.println(msg);
//			}
//		}
		
		System.out.println("main executed!");
	}
}
