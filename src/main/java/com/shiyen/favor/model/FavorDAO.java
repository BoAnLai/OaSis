package com.shiyen.favor.model;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.shiyen.util.HibernateUtil;

public class FavorDAO implements FavorDAO_interface {
	private SessionFactory factory;
	
	public FavorDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	@Override
	public Integer insert(FavorVO favorVO) {
		return (Integer) getSession().save(favorVO);
		
	}

	@Override
	public Integer update(FavorVO favorVO) {
		try {
			getSession().update(favorVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public Integer delete(Integer favorId) {
		FavorVO favorVO = getSession().get(FavorVO.class, favorId);
		if (favorVO != null) {
			getSession().delete(favorVO);
			return 1;
		} else {
			return -1;
		}
	}

	@Override
	public Long getOneArtFavor(Integer favorArtId) {
		Query query = getSession().createQuery("SELECT COUNT(*) FROM FavorVO WHERE favorArtId=:value"
				).setParameter("value", favorArtId);
			return (Long) query.uniqueResult();
		}
	

}
