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
import com.mike.game.model.GameService;
import com.mike.tool.JedisTool;

import redis.clients.jedis.Jedis;

public class SubsMsgService {
	
	private static final String GET_USERID_BY_GAMEID = "SELECT subs_user_id, subs_status FROM subs where subs_game_id = ?";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oasis");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private Gson gson;
	private Jedis jedis;
	
	public  SubsMsgService()  {
		this.gson =new Gson();
		this.jedis = JedisTool.getJedisPool().getResource();
	}
	
	
	
	 
	
	
	public List<SubsVO> findByGameId(Integer subsGameId) {
		
		List<SubsVO> subsList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_USERID_BY_GAMEID);

			pstmt.setInt(1, subsGameId);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SubsVO subsVO = new SubsVO();
				
                subsVO.setSubsUserId(rs.getInt("subs_user_id"));
                subsVO.setSubsStatus(rs.getBoolean("subs_status"));
                
                subsList.add(subsVO);
                             
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("發生資料庫錯誤! "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return subsList;
	}
	
	public void pushMessageToUsers(Integer subsGameId) throws Exception {
		
        List<SubsVO> subsList = findByGameId(subsGameId);

        try {
            for (SubsVO subs : subsList) {
                if (subs.getSubsStatus()) {
                    // 根據 subsGameId 動態生成消息內容
                    String message = "尊敬的用戶，您訂閱的遊戲ID：" + GameService.getGameByGameId(subs.getSubsGameId()).getGameName() + " 有新動態！";

                    // 使用 Redis 推送消息，假設每個用戶有一個唯一的頻道
                    String userChannel = "user:" + subs.getSubsUserId();
                    jedis.publish(userChannel, message);


                }
            }
        } finally {
            jedis.close();
        }
    }
	
	public static void main(String[] args) {
	    

	
	}
}
