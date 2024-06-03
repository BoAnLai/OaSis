package com.lee.waitingperson.model;

import java.util.List;



import org.hibernate.Session;

import tool.HibernateUtil;

public class WaitingPersonDao implements WaitingPersonInterface {

	@Override
	public void insert(WaitingPersonVO watp) {

		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			session.beginTransaction();
			session.save(watp);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
		}

	}

	@Override
	public void delect(Integer waitingPersonID) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		try {

			session.beginTransaction();
			WaitingPersonVO waitp = session.get(WaitingPersonVO.class, waitingPersonID);

			if (waitp != null) {
				session.delete(waitp);
			}
			session.getTransaction().commit();

		} catch (Exception e) {
			if(session!=null) {
				session.getTransaction().rollback();
			}
		}
	}

	@Override
	public List<WaitingPersonVO> getAll(Integer waitingPersonWaitingID) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<WaitingPersonVO> wpList = null;

		try {
			session.beginTransaction();
			String hql = "FROM WaitingPersonVO WHERE waitingPersonWaitingID = :waitingPersonWaitingID";
			wpList = session.createQuery(hql, WaitingPersonVO.class)
					.setParameter("waitingPersonWaitingID", waitingPersonWaitingID).list();
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wpList;// 不要再忘記了!!!
	}

	@Override
	public List<WaitingPersonVO> getAll() {

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<WaitingPersonVO> wpList = null;

		try {
			session.beginTransaction();
			wpList = session.createQuery("from WaitingPersonVO", WaitingPersonVO.class).getResultList();
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wpList;// 不要再忘記了!!!
	}

	@Override
	public int serchPK(Integer waitingPersonWaitingId, Integer waitingPersonUserId) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		Integer waitingPersonPK = null;

		try {
			
			session.beginTransaction();
			String hql = "SELECT wp.id FROM WaitingPersonVO wp WHERE wp.waitingPersonWaitingID =:waitingPersonWaitingID AND wp.waitingPersonUserID =:waitingPersonUserID";

			waitingPersonPK = session.createQuery(hql,Integer.class)
					.setParameter("waitingPersonWaitingID", waitingPersonWaitingId)
					.setParameter("waitingPersonUserID", waitingPersonUserId).uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return waitingPersonPK;
	}

}
