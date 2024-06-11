package com.mike.tool;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisTool {

	private static JedisPool pool = null;

	private JedisTool() {
	}

	public static JedisPool getJedisPool() {

		if (pool == null) {
			synchronized(JedisTool.class) {
				if (pool == null) {
					JedisPoolConfig config = new JedisPoolConfig();
					config.setMaxTotal(8);
					config.setMaxIdle(8);
					config.setMaxWaitMillis(10000);
					pool = new JedisPool(config, "localhost", 6379,0,null,1);
				}
			}
		}
		return pool;
	}

	public static void shutdownJedisPool() {
		if (pool != null)
			pool.destroy();
	}
	
}
