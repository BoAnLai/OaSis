package com.lee.waitingperson.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import tool.Tool;

public class WaitingPersonDao implements WaitingPersonInterface{
	
	public static final String INSERT="INSERT INTO WaitingPerson(waitingPerson_WaitingID,waitingPerson_UserID)VALUES(?,?)"; 
	public static final String SELECTALL="SELECT * FROM WaitingPerson Where waitingPerson_WaitingID=?";
	public static final String SELECTTOTAL="SELECT * FROM WaitingPerson;";
	public static final String DELECTROOMPEOPLE="DELETE FROM waitingPerson WHERE waitingPerson_WaitingID=? AND waitingPerson_UserID=?";

	static {
		try {
			Class.forName(Tool.DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void insert(WaitingPersonVO watp) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			
			pstmt=con.prepareStatement(INSERT);
			pstmt.setInt(1,watp.getWaitingPersonWaitingID());
			pstmt.setInt(2,watp.getWaitingPersonUserID());
			System.out.println(watp.getWaitingPersonWaitingID());
			System.out.println(watp.getWaitingPersonUserID());
			
			pstmt.executeUpdate();
			System.out.println("資料新增成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, null);
		}
		
		
	}

	@Override
	public void delect(WaitingPersonVO watp) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(DELECTROOMPEOPLE);
			
			pstmt.setInt(1,watp.getWaitingPersonWaitingID());
			pstmt.setInt(2, watp.getWaitingPersonUserID());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, null);
		}
		
	}

	@Override
	public List<WaitingPersonVO> getAll(Integer waitingPersonWaitingID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<WaitingPersonVO>wpList=new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			
			pstmt=con.prepareStatement(SELECTALL);
			pstmt.setInt(1,waitingPersonWaitingID);
			
			
			
			
			
			rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				WaitingPersonVO wp=new WaitingPersonVO();
				wp.setWaitingPersonId(rs.getInt(1));
				wp.setWaitingPersonWaitingID(rs.getInt(2));
				wp.setWaitingPersonUserID(rs.getInt(3));
				wpList.add(wp);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, rs);
		}
		
		return wpList;//不要再忘記了!!!
	}

	@Override
	public List<WaitingPersonVO> getAll() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<WaitingPersonVO>wpList=new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			
			pstmt=con.prepareStatement(SELECTTOTAL);		
			rs=pstmt.executeQuery();
		
			while(rs.next()) {
				WaitingPersonVO wp=new WaitingPersonVO();
				wp.setWaitingPersonId(rs.getInt(1));
				wp.setWaitingPersonWaitingID(rs.getInt(2));
				wp.setWaitingPersonUserID(rs.getInt(3));
				wpList.add(wp);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Tool.closeResources(con, pstmt, rs);
		}
		
		return wpList;//不要再忘記了!!!
	}

	

	

}
