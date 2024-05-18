package com.shiyen.art.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shiyen.util.HibernateUtil;

public class ArtDAO implements ArtDAO_interface {
	
	private SessionFactory factory;
	
	public ArtDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public Integer insert(ArtVO artVO) {
		return (Integer) getSession().save(artVO);
		
	}

	@Override
	public Integer update(ArtVO artVO) {
		try {
			getSession().update(artVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public Integer delete(Integer artId) {
		ArtVO artVO = getSession().get(ArtVO.class, artId);
		if (artVO != null) {
			getSession().delete(artVO);
			return 1;
		} else {
			return -1;
		}
		
	}

	@Override
	public ArtVO findByPrimaryKey(Integer artId) {
		return getSession().get(ArtVO.class, artId);
	}

	@Override
	public List<ArtVO> getAll() {
		return getSession().createQuery("FROM ArtVO ORDER BY artTimestamp DESC", 
				ArtVO.class).getResultList();	
		}
	
	@Override
	public List<ArtVO> getReply() {
		return getSession().createQuery("FROM ArtVO WHERE artReply IS NOT NULL ORDER BY artTimestamp DESC",
				ArtVO.class).getResultList();
	}
	
	
}
