package com.shiyen.favor.model;

import java.util.List;

import org.hibernate.Session;

import com.shiyen.art.model.ArtDAO;
import com.shiyen.art.model.ArtVO;
import com.shiyen.util.HibernateUtil;

public class FavorService {
	private FavorDAO_interface dao;
	
	public FavorService() {
		dao = new FavorDAO();
	}
	public void addFavor(FavorVO favorVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			 dao.insert(favorVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
	}
	public void deleteFavor(FavorVO favorVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			 dao.delete(favorVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
	}

	public List<FavorDTO> getFavorByuserId(Integer userId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			List<FavorDTO> list = dao.getFavorByuserId(userId);

			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public Integer getfavorStatus(Integer artId,Integer userId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Integer favorStatus = dao.getfavorStatus(artId,userId);
			session.getTransaction().commit();
			return favorStatus;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return 0;
		}
		
	}
	
}
