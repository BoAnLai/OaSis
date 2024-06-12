package com.ryan.subs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



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
	
	
	
	 
	
	
	
	
	public static void main(String[] args) {
	    

	
	}
}
