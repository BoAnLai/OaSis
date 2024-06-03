package com.shiyen.art.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

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
	        }catch (Exception e) {
		        session.getTransaction().rollback();
		        e.printStackTrace();
		        return null;
		    }
	        
	}

	
	public List<ArtVO> getAll() {
	    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	    try {
	        session.beginTransaction();
	        List<ArtVO> list = dao.getAll();
	        // 在事務範圍內遍歷集合或訪問關聯對象以確保初始化
	        
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

	public ArtDTO getOneArt(Integer artId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
        try {
	        session.beginTransaction();
	        ArtDTO artDTO = dao.findByPrimaryKey(artId);
	        session.getTransaction().commit();
	        return artDTO;
	     }catch (Exception e) {
		        session.getTransaction().rollback();
		        e.printStackTrace();
		        return null;
		 }
		
	}
	public List<ArtReplyDTO> getReply(Integer artId){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
	        session.beginTransaction();
	        List<ArtReplyDTO> artReplyDTO = dao.getReply(artId);
	        session.getTransaction().commit();
	        return artReplyDTO;
	     }catch (Exception e) {
		        session.getTransaction().rollback();
		        e.printStackTrace();
		        return null;
		 }
	}

	public void deleteArt(Integer artId) {
		dao.delete(artId);
	}
	public ArtVO updateArt(ArtVO artVO) {
		
		dao.update(artVO);

		return artVO;
	}
}
