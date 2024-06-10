package com.shiyen.art.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.oracle.wls.shaded.org.apache.bcel.generic.LSTORE;
import com.shiyen.util.HibernateUtil;

public class ArtService {
	private ArtDAO_interface dao;

	public ArtService() {
		dao = new ArtDAO();
	}

	public Integer addArt(ArtVO artVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Integer artId = dao.insert(artVO);
			session.getTransaction().commit();
			return artId;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}

	}

	public List<ArtVO> getAllByUserId(Integer userId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			List<ArtVO> list = dao.getAllByUserId(userId);

			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}

	public List<ArtDTO> getAllArtByGameId(Integer gameId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			List<ArtDTO> list = dao.getAllArtByGameId(gameId);
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}

	public ArtDTO getFirstArt(Integer artId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			ArtDTO artDTO = dao.getFirstArt(artId);
			session.getTransaction().commit();
			return artDTO;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}

	}

	public List<ArtReplyDTO> getReply(Integer artId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			List<ArtReplyDTO> artReplyDTO = dao.getReply(artId);
			session.getTransaction().commit();
			return artReplyDTO;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}

	public void deleteArt(Integer artId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			dao.delete(artId);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		}
	}

	public Integer updateArt(ArtVO artVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			dao.update(artVO);
			session.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}

	public ArtVO getOneArtByArtId(Integer artId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ArtVO artVO = dao.getOneArtByArtId(artId);
			session.getTransaction().commit();
			return artVO;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}
}
