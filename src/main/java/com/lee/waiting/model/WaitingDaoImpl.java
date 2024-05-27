package com.lee.waiting.model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import tool.HibernateUtil;
import tool.Tool;

/*
 * SQL:是對表格跟欄位做查詢
 * HQL:是對物件跟屬性作查詢
 * 
 * getCurrentSession:老師說用這價比較好，但是在這邊好像commit後
 * 就拿不到連線了，所以我改用openSession();
 * 
 * 查詢不用打開交易與commit
 */

public class WaitingDaoImpl implements WaitingInterface{
	
	public static final String WAITING_GETINROOM="SELECT waiting.*\r\n"
			+ "FROM waiting\r\n"
			+ "INNER JOIN waitingPerson B ON waiting.waiting_id = B.waitingperson_waitingID\r\n"
			+ "WHERE B.waitingperson_userID = ?\r\n"
			+ "AND waiting.waiting_reserve > NOW()\r\n"
			+ "ORDER BY waiting.waiting_reserve;\r\n"
			+ "";
	
	


	@Override
	public void insert(WaitingVO wat) {
	
		Session session=HibernateUtil.getSessionFactory().openSession();
		try {			
			session.beginTransaction();
			session.save(wat);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.shutdown();
		}
		
	}

	@Override
	public List<WaitingVO> getAll() {
			
		Session session=HibernateUtil.getSessionFactory().openSession();		
		List<WaitingVO> wtList=null;
		try {
			
			session.beginTransaction();
			//這邊我嘗試用createNativeQuery，效果:速度較快(因Hibernate還是需要將HQL轉換成SQL給資料庫，直接給SQL會執行效率更好!-----應公司不同使用作練習)
			NativeQuery<WaitingVO> query=session.createNativeQuery("SELECT * FROM waiting where waiting_reserve > NOW() ORDER BY waiting_Reserve",WaitingVO.class);
			wtList=query.list();
	
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return wtList;
	}



	@Override
	public WaitingVO getOne(Integer watno) {
		
		Session session=HibernateUtil.getSessionFactory().openSession();		
		WaitingVO wat=null;
		try {
			session.beginTransaction();
			wat=session.get(WaitingVO.class, watno);//get方法適合用在不確定該筆資料是否存在		
			session.getTransaction().commit();
		} catch (Exception e) {			
			e.printStackTrace();
		}	
		return wat;
	}

	@Override
	public void updateAll(WaitingVO wat) {
		
		Session session=HibernateUtil.getSessionFactory().openSession();		
		try {
			session.beginTransaction();
			session.update(wat);
			session.getTransaction().commit();	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<WaitingVO> getTotal() {
		
		Session session=HibernateUtil.getSessionFactory().openSession();		
		List<WaitingVO>wtList =null;
		
		try {
			
			wtList=session.createQuery("from WaitingVO",WaitingVO.class).list();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wtList;
	}

	@Override
	public List<WaitingVO> getMyRoom(Integer waitingUserID) {
		
		Session session=HibernateUtil.getSessionFactory().openSession();
		List<WaitingVO>wtList=null;
		
		try {
			session.beginTransaction();		
	        String hql = "from WaitingVO WHERE waitingUserId = :WaitingUserId AND waitingReserve > CURRENT_TIMESTAMP ORDER BY waitingReserve";   
	        wtList = session.createQuery(hql, WaitingVO.class).setParameter("WaitingUserId",waitingUserID).list();
	        session.getTransaction().commit();
	               			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wtList;
	}

	@Override
	public List<WaitingVO> getInRoom(Integer waitingUserID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<WaitingVO>wtList =new ArrayList<>();

		
		try {
			try {
				Class.forName(Tool.DRIVER);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con=DriverManager.getConnection(Tool.URL,Tool.USERID,Tool.PASSWORD);
			pstmt=con.prepareStatement(WAITING_GETINROOM);
			
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
