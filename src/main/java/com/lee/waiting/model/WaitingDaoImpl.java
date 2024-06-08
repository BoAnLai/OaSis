package com.lee.waiting.model;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import com.lee.waiting.controller.HibernateUtil;
import com.lee.waiting.controller.Tool;

/*
 * SQL:是對表格跟欄位做查詢
 * HQL:是對物件跟屬性作查詢
 * 
 * 查詢不用打開交易與commit
 */

public class WaitingDaoImpl implements WaitingInterface {


	@Override
	public void insert(WaitingVO wat) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(wat);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}

	}

	@Override
	public List<WaitingVO> getAll() {

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<WaitingVO> wtList = null;
		try {

			session.beginTransaction();
			// 這邊我嘗試用createNativeQuery，效果:速度較快(因Hibernate還是需要將HQL轉換成SQL給資料庫，直接給SQL會執行效率更好!-----應公司不同使用作練習)
			NativeQuery<WaitingVO> query = session.createNativeQuery(
					"SELECT * FROM waiting where waiting_reserve > NOW() ORDER BY waiting_Reserve", WaitingVO.class);
			wtList = query.list();

			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return wtList;
	}

	@Override
	public WaitingVO getOne(Integer watno) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		WaitingVO wat = null;
		try {
			session.beginTransaction();
			wat = session.get(WaitingVO.class, watno);// get方法適合用在不確定該筆資料是否存在
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wat;
	}

	@Override
	public void updateAll(WaitingVO wat) {

		Session session = HibernateUtil.getSessionFactory().openSession();
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

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<WaitingVO> wtList = null;

		try {

			wtList = session.createQuery("from WaitingVO", WaitingVO.class).list();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wtList;
	}

	@Override
	public List<WaitingVO> getMyRoom(Integer waitingUserID) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<WaitingVO> wtList = null;

		try {
			session.beginTransaction();
			String hql = "from WaitingVO WHERE waitingUserId = :WaitingUserId AND waitingReserve > CURRENT_TIMESTAMP ORDER BY waitingReserve";
			wtList = session.createQuery(hql, WaitingVO.class).setParameter("WaitingUserId", waitingUserID).list();
			session.getTransaction().commit();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wtList;
	}

	@Override
	public List<WaitingVO> getInRoom(Integer waitingUserID) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<WaitingVO> wtList = new ArrayList<>();

		try {
			session.beginTransaction();
			NativeQuery<WaitingVO> query = session.createNativeQuery(
					"SELECT waiting.* FROM waiting INNER JOIN waitingPerson B ON waiting.waiting_id = B.waitingperson_waitingID WHERE B.waitingperson_userID =:waitingUserID AND waiting.waiting_reserve > NOW() ORDER BY waiting.waiting_reserve",
					WaitingVO.class).setParameter("waitingUserID",waitingUserID);
			wtList = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return wtList;
	}

}
