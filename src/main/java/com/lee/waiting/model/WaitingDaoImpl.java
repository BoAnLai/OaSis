package com.lee.waiting.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import tool.Tool;

public class WaitingDaoImpl implements WaitingInterface{
	
	public static final String WAITING_INSER="INSERT INTO waiting(waiting_user_id,waiting_reserve,waiting_maxpeople,waiting_game_name)values(?,?,?,?)";
	public static final String WAITING_SELECTALL="SELECT * FROM waiting WHERE waiting_reserve>NOW() ORDER BY waiting_reserve";
	public static final String WAITING_SELECTTOTAL="SELECT * FROM waiting ;";
	public static final String WAITING_SELECTONE="SELECT * FROM waiting where waiting_id= ?";
	public static final String WAITING_UPDATEMAXPEOPLE="UPDATE waiting SET waiting_maxpeople=? where waiting_id=?";
	public static final String WAITING_UPDATERESERVE="UPDATE waiting SET waiting_reserve=? where waiting_id=?";
	public static final String WAITING_UPDATEALL="UPDATE waiting SET waiting_user_id=?,waiting_reserve =?,waiting_maxpeople=?,waiting_game_name=? where waiting_id=?";
	public static final String WAITING_SELECTMYROOM="SELECT * FROM waiting WHERE waiting_user_id =? AND waiting_reserve>NOW() ORDER BY waiting_reserve";
	
	static {
		try {
			Class.forName(Tool.DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void insert(WaitingVO wat) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_INSER);
			
			pstmt.setInt(1,wat.getWaitingUserId());
			pstmt.setTimestamp(2,wat.getWaitingReserve());
			pstmt.setInt(3, wat.getWaitingMaxPeople());
			pstmt.setString(4, wat.getWaitingGameName());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, null);
		}
		
	}

	@Override
	public List<WaitingVO> getAll() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<WaitingVO>wtList =new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_SELECTALL);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				WaitingVO wt=new WaitingVO();
				wt.setWaitingID(rs.getInt(1));
				wt.setWaitingUserId(rs.getInt(2));
				Timestamp timestamp = rs.getTimestamp(3);
				wt.setWaitingReserve(timestamp);
				wt.setWaitingMaxPeople(rs.getInt(4));
				wt.setWaitingGameName(rs.getString(5));
				wtList.add(wt);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, rs);
		}
		
		
		return wtList;
	}

	@Override
	public void updateMaxPeople(WaitingVO wat) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_UPDATEMAXPEOPLE);
			
			pstmt.setInt(1,wat.getWaitingMaxPeople());
			pstmt.setInt(2, wat.getWaitingID());
			
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, null);
		}
		
		
	}

	@Override
	public void updateReserve(WaitingVO wat) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_UPDATERESERVE);
			
			pstmt.setTimestamp(1,wat.getWaitingReserve());
			pstmt.setInt(2,wat.getWaitingID());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, null);
		}
		
		
		
		
	}

	@Override
	public WaitingVO getOne(Integer watno) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		WaitingVO wat=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_SELECTONE);
			
			pstmt.setInt(1, watno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				wat=new WaitingVO();
				wat.setWaitingID(watno);
				wat.setWaitingUserId(rs.getInt("waiting_user_id"));
				wat.setWaitingReserve(rs.getTimestamp("waiting_reserve"));
				wat.setWaitingMaxPeople(rs.getInt("waiting_maxpeople"));
				wat.setWaitingGameName(rs.getString(5));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, rs);
		}
		
		return wat;
	}

	@Override
	public void updateAll(WaitingVO wat) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_UPDATEALL);
			
			pstmt.setInt(1, wat.getWaitingUserId());
			pstmt.setTimestamp(2,wat.getWaitingReserve());
			pstmt.setInt(3,wat.getWaitingMaxPeople());
			pstmt.setString(4,wat.getWaitingGameName());
			pstmt.setInt(5,wat.getWaitingID());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, null);
		}
		
	}

	@Override
	public List<WaitingVO> getTotal() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<WaitingVO>wtList =new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_SELECTTOTAL);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				WaitingVO wt=new WaitingVO();
				wt.setWaitingID(rs.getInt(1));
				wt.setWaitingUserId(rs.getInt(2));
				Timestamp timestamp = rs.getTimestamp(3);
				wt.setWaitingReserve(timestamp);
				wt.setWaitingMaxPeople(rs.getInt(4));
				wt.setWaitingGameName(rs.getString(5));
				wtList.add(wt);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, rs);
		}
		
		
		return wtList;
	}

	@Override
	public List<WaitingVO> getMyRoom(Integer waitingUserID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<WaitingVO>wtList =new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_SELECTMYROOM);
			
			pstmt.setInt(1,waitingUserID );
			rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				WaitingVO wt=new WaitingVO();
				
				wt.setWaitingID(rs.getInt(1));
				wt.setWaitingUserId(waitingUserID);
				Timestamp timestamp = rs.getTimestamp(3);
				wt.setWaitingReserve(timestamp);
				wt.setWaitingMaxPeople(rs.getInt(4));
				wt.setWaitingGameName(rs.getString(5));
				wtList.add(wt);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, rs);
		}
		
		return wtList;
	}

	

}
