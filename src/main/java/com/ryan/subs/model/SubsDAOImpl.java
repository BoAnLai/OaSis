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

public class SubsDAOImpl implements SubsDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oasis");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_SUBS = "INSERT INTO subs (subs_user_id, subs_game_id, subs_art_id, subs_date, subs_status) VALUES (?, ?, ?, ?, TRUE)";
	private static final String GET_ONE_SUBS = "SELECT subs_id, subs_user_id, subs_game_id, subs_art_id, subs_date, subs_status FROM subs where subs_id = ?";
	private static final String GET_USERID_SUBS = "SELECT subs_id, subs_user_id, subs_game_id, subs_art_id, subs_date, subs_status FROM subs where subs_user_id = ?";
	private static final String UPDATE = "UPDATE subs set subs_date=?, subs_status=? where subs_id = ?";
	
	@Override
	public void insert(SubsVO subsVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_SUBS);

			pstmt.setInt(1, subsVO.getSubsUserId());
			pstmt.setInt(2, subsVO.getSubsGameId());
			pstmt.setInt(3, subsVO.getSubsArtId());
			pstmt.setDate(4, new java.sql.Date(subsVO.getSubsTimestamp().getTime()));
			pstmt.setBoolean(5, subsVO.getSubsStatus());//狀態欄

			pstmt.executeUpdate("set auto_increment_offset=1;");
			pstmt.executeUpdate("set auto_increment_increment=1;");
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("發生資料庫錯誤! " + se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	}
	
	@Override
	public void update(SubsVO subsVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);


			pstmt.setDate(1, new java.sql.Date(subsVO.getSubsTimestamp().getTime()));
			pstmt.setBoolean(2, subsVO.getSubsStatus());
			pstmt.setInt(3, subsVO.getSubsId());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("發生資料庫錯誤! " + se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	}
	
	@Override
	public List<SubsVO> findByUserId(Integer subsUserId) {
		
		List<SubsVO> subsList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_USERID_SUBS);

			pstmt.setInt(1, subsUserId);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SubsVO subsVO = new SubsVO();
				subsVO.setSubsId(rs.getInt("subs_id"));
                subsVO.setSubsUserId(rs.getInt("subs_user_id"));
                subsVO.setSubsGameId(rs.getInt("subs_game_id"));
                subsVO.setSubsArtId(rs.getInt("subs_art_id"));
                subsVO.setSubsTimestamp(rs.getTimestamp("subs_date"));
                subsVO.setSubsStatus(rs.getBoolean("subs_status"));
               
                             
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
	
	@Override
	public SubsVO findByPrimaryKey(Integer subsId) {
		
		SubsVO subsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_SUBS);
			pstmt.setInt(1, subsId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				subsVO = new SubsVO();
				subsVO.setSubsId(rs.getInt("subs_id"));
                subsVO.setSubsUserId(rs.getInt("subs_user_id"));
                subsVO.setSubsGameId(rs.getInt("subs_game_id"));
                subsVO.setSubsArtId(rs.getInt("subs_art_id"));
                subsVO.setSubsTimestamp(rs.getTimestamp("subs_timestamp"));
                subsVO.setSubsStatus(rs.getBoolean("subs_status"));
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return subsVO;
	}
	
}
