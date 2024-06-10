package com.ryan.subs.model;

import java.util.List;
import java.util.Set;

import com.google.gson.Gson;
import com.mike.tool.JedisTool;

import redis.clients.jedis.Jedis;

public class SubsMsgService {

	
	private Gson gson;
	private Jedis jedis;
	
	public  SubsMsgService()  {
		this.gson =new Gson();
		this.jedis = JedisTool.getJedisPool().getResource();
	}
	
	public void gameArtAddMsg(int gameId) {
		
		SubsService subsSvc = new SubsService();
		List<SubsVO> subsList = subsSvc.findByGameId(gameId);
		
//		for (SubsVO subsVO : subsList) {
//	        int userId = subsVO.getSubsUserId();
//	        Boolean subsStatus =  subsVO.getSubsStatus();
//	        
//	        if (subsStatus == true) {
//	        	addMsgToMailbox(userId, Message);
//	        }
	        
	        // 處理每個訂閱了該遊戲的使用者，你可以執行相應的操作，比如新增訊息到他們的信箱
	        // addMsgToUserMailbox(userId, yourMessage);
//	    }
		//1.找到所有有訂閱這個id的使用者 List<userId>
		//2.新增訊息到每個使用者的信箱
		
		//? 可變動參數名稱
		 // 1. 找到所有有訂閱這個遊戲的使用者
		
    }
//		jedis.rpush("user:?:gameSub", "?");
	
	
	public static void main(String args[]) {
		SubsMsgService SubsMsgSvc = new SubsMsgService();
		
		SubsMsgSvc.gameArtAddMsg(2);
		
	}
	
	
}
