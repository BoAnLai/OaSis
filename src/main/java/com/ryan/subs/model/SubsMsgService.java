package com.ryan.subs.model;

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
	
	public void gameUpdateMsg(int gameId) {
		//1.找到所有有訂閱這個id的使用者 List<userId>
		//2.新增訊息到每個使用者的信箱
		//? 可變動參數名稱
		jedis.rpush("user:?:gameSub", "?");
	}
}
